package com.example.demo;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.bo.BoardBO;
import com.example.demo.bo.CommentBO;
import com.example.demo.bo.FollowBO;
import com.example.demo.bo.TimeLineBO;
import com.example.demo.bo.UserBO;
import com.example.demo.common.SHA256;
import com.example.demo.model.Board;
import com.example.demo.model.CardView;
import com.example.demo.model.Follow;
import com.example.demo.model.User;

@Controller
public class BoardController {

	@Autowired
	private BoardBO boardBo;

	@Autowired
	private CommentBO commentBo;

	@Autowired
	private UserBO userBo;

	@Autowired
	private TimeLineBO timeLineBo;

	@Autowired
	private FollowBO followBo;

	// 피드목록 - 접속
	@GetMapping("/main/board-view")
	public String board_view(HttpSession session, Model model, User user) {
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUid();

		if (userId == null) {

			return "redirect:/main/sign-in-view";
		}

		List<CardView> cardView = timeLineBo.generateCardList(userId);
		model.addAttribute("cardList", cardView);

		// select db
		List<Board> board = boardBo.getList();
		model.addAttribute("boardList", board);

		// select user db
		user.setUid(userId);
		List<User> userList = userBo.getUserAll(user);
		model.addAttribute("userList", userList);
		return "board_view";
		
		
		
		
	}

	// 로그아웃 - 세션제거
	@GetMapping("/main/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginUser");
		return "redirect:/main/sign-in-view";

	}

	// 글쓰기
	@PostMapping("/main/list")
	@ResponseBody
	public Map<String, Object> addList(Board board, @RequestParam(value="file", required = false) MultipartFile file, HttpSession session) {
		// session get(id값만 뺄때)
		User user = (User) session.getAttribute("loginUser");
		board.setUserId(user.getUid());

		int row = boardBo.addList(board, file);
		Map<String, Object> result = new HashMap<>();

		// 비로그인 일때는 결과값을 다르게 떨궈주기.
		if (user.getUid() == null) {
			result.put("code", 300);
			return result;
		}

		if (row > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "글쓰기 실패 하였습니다.");
		}
		return result;
	}

	// 댓글쓰기
	@PostMapping("/main/add-comment")
	@ResponseBody
	public Map<String, Object> addComment(int boardId, String comment, HttpSession session) {
		Map<String, Object> result = new HashMap<>();

		// session이 끊겼으면 code 값 200으로 주기
		User user = (User) session.getAttribute("loginUser");

		if (user == null) {
			result.put("code", 300);
			return result;
		}
		String userId = user.getUid(); // db insert int row = .addComment(boardId, comment, userId);
		commentBo.createComment(userId, boardId, comment);
		result.put("code", 100);

		return result;
	}

	// 댓글 가져오기

	// 마이페이지 - 접속
	@GetMapping("/main/my-list")
	public String my_list(HttpServletRequest request, Board board, Model model, Follow follow) {

		// 세션
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		board.setUserId(user.getUid());
		// select
		// List<CommentView>
		List<Board> boardList = boardBo.getListByUserId(board);
		int boardCount = boardBo.getListCountByUserId(board);
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardCount", boardCount);

		// select user
		User users = userBo.getUserById(user.getUid());
		model.addAttribute("user", users);

		// 팔로우 팔로워 숫자 카운트
		follow.setUserId_follower(user.getUid());
		follow.setUserId_followed(user.getUid());
		int followCount = followBo.CountFollow(follow);
		int followedCount = followBo.CountFollowed(follow);
		model.addAttribute("followCount", followCount);
		model.addAttribute("followedCount", followedCount);

		return "my_list";
	}

	// 마이페이지 - 글쓰기
	@PostMapping("/main/my-list-add")
	@ResponseBody
	public Map<String, Object> my_list_add(HttpSession session, @RequestParam(value="file", required = false) MultipartFile file,  Board board) {
		User user = (User) session.getAttribute("loginUser");
		board.setUserId(user.getUid());
		Map<String, Object> result = new HashMap<>();
		int row = boardBo.addList(board, file);

		// 비로그인 일때는 결과값을 다르게 떨궈주기.
		if (user.getUid() == null) {
			result.put("code", 300);
			return result;
		}

		// insert db
		if (row > 0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "글쓰기 실패 하였습니다.");
		}

		return result;
	}

	// ----------------추후에 다시 해보기 게시글 수정
	// ----------------게시글 본인이 올린 글만 수정이 되야함. 현재 모든글이 수정권한이 됨.
	@PutMapping("/main/board-list-modify")
	@ResponseBody
	public Map<String, Object> update_board_list(Board board, @RequestParam(value="file", required = false) MultipartFile file, HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		User user = (User) session.getAttribute("loginUser");
		board.setUserId(user.getUid());

		int count = boardBo.updateBoardListById(board, file);
		if (count > 0) {
			result.put("code", 100);
		} else {
			result.put("code", 400);
		}
		return result;
	}

	// 마이페이지 - 프로필 수정
	@PutMapping("/main/modify")
	@ResponseBody
	public Map<String, Object> update_my_profile(User user, @RequestParam(value="file", required = false) MultipartFile file, HttpSession session) throws NoSuchAlgorithmException {
		Map<String, Object> result = new HashMap<>();

		// 비밀번호 암호화
		SHA256 sha256 = new SHA256();
		String encryptedPwd = sha256.encrypt(user.getPwd());
		user.setPwd(encryptedPwd);

		// 세션 id
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUid();
		user.setUid(userId);

		// 비로그인 일때는 결과값을 다르게 떨궈주기.
		if (user.getUid() == null) {
			result.put("code", 300);
			return result;
		}

		int count = boardBo.updateMyProfileByUserId(user, file);
		if (count > 0) {
			result.put("code", 100);
		} else {
			result.put("code", 400);
		}

		return result;
	}

	// 다른사람 마이페이지 접속
	@RequestMapping("/main/other-list")
	public String other_list(User user, Model model, Board board, Follow follow, HttpSession session) {

		// 게시글리스트 모델추가
		board.setUserId(user.getUid());
		List<Board> boardList = boardBo.getListByUserId(board);
		model.addAttribute("boardList", boardList);

		// 게시글 총 카운트 모델추가
		int boardCount = boardBo.getListCountByUserId(board);
		model.addAttribute("boardCount", boardCount);

		// 유저정보 모델추가 (유저의 아이디, 이미지 , 닉네임 가져오기위한)
		User userList = userBo.getUserById(user.getUid());
		model.addAttribute("userList", userList);

		// 팔로우 카운트
		follow.setUserId_follower(user.getUid());
		int followCount = followBo.CountFollow(follow);
		model.addAttribute("followCount", followCount);
		// 팔로워 카운트
		follow.setUserId_followed(user.getUid());
		int followedCount = followBo.CountFollowed(follow);
		model.addAttribute("followedCount", followedCount);

		// 팔로우 중인지 아닌지 확인.
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUid();
		follow.setUserId_follower(userId);
		follow.setUserId_followed(userList.getUid());
		int check = followBo.getFollowByFollowId(follow);
		model.addAttribute("check", check);

		return "other_list";
	}

	// 팔로우 추가하기
	@RequestMapping("/main/follow")
	@ResponseBody
	public Map<String, Object> follow(HttpSession session, Follow follow, User user) {

		// 세션들고오기 => 팔로우에서 팔로우 아이디값 셋팅
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUid();
		follow.setUserId_follower(userId);

		// board 게시판에서 user 정보를 ajax에서 보낸 후 그 값을 팔로워아이디로 set
		Map<String, Object> result = new HashMap<>();
		follow.setUserId_followed(user.getUid());

		// 세션이 초기화 되면 로그인 페이지로 던지기
		if (userId == null) {

			result.put("code", 300);
			return result;
		}

		int row = followBo.addFollow(follow);
		if (row > 0) {
			result.put("code", 100);
		}

		return result;
	}

	// 팔로우 삭제하기
	@DeleteMapping("/main/follow-delete")
	@ResponseBody
	public Map<String, Object> followDelte(HttpSession session, Follow follow, User user) {

		// 세션가져오기
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUid();
		follow.setUserId_follower(userId);

		// 유저 정보 가져오기
		Map<String, Object> result = new HashMap<>();
		follow.setUserId_followed(user.getUid());

		// 세션이 초기화 되면 로그인 페이지로 던지기
		if (userId == null) {

			result.put("code", 300);
			return result;
		}

		// 팔로우삭제
		int row = followBo.deleteFollow(follow);
		if (row > 0) {
			result.put("code", 100);
		}

		return result;
	}

	@DeleteMapping("/main/board-delete")
	@ResponseBody
	public Map<String, Object> boardDelete(HttpSession session, Board board) {

		// 세션가져오기
		User users = (User) session.getAttribute("loginUser");
		String userId = users.getUid();
		board.setUserId(userId);
		Map<String, Object> result = new HashMap<>();
		// 세션이 초기화 되면 로그인 페이지로 던지기
		if (userId == null) {

			result.put("code", 300);
			return result;
		}
		
		
		
		return result;
	}

}
