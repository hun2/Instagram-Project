package com.example.demo.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.common.FileManagerServices;
import com.example.demo.dao.BoardDAO;
import com.example.demo.model.Board;
import com.example.demo.model.Follow;
import com.example.demo.model.User;

@Service
public class BoardBO {

	@Autowired
	private BoardDAO boardDao;

	@Autowired
	private FileManagerServices fileManagerServices;

	// 글쓰기
	public int addList(Board board, MultipartFile file) {
		String boardImage = null;
		if (file != null) {
			boardImage = fileManagerServices.saveFile(board.getUserId(), file);
			board.setBoardImage(boardImage);
		}
		return boardDao.insertList(board);
	}

	// 게시글 카운트 select
	public int getListCountByUserId(Board board) {

		return boardDao.selectListCountByUserId(board);
	}

	// 게시글 select
	public List<Board> getList() {

		return boardDao.selectList();

	}

	// 마이페이지 게시글 select
	public List<Board> getListByUserId(Board board) {

		return boardDao.selectListByUserId(board);
	}

	// 게시글 update
	public int updateBoardListById(Board board, MultipartFile file ) {
		// 업데이트 할때 기존 글을 가져온다
		Board boardList = getBoardByBoardId(board);
		if (boardList == null) {

			return 0;
		}

		String boardImage = null;
		// 파일이 만약
		if (file != null) {
			boardImage = fileManagerServices.saveFile(board.getUserId(), file);

			if (boardImage != null && board.getBoardImage() != null) {
				fileManagerServices.deleteFile(board.getBoardImage());
			}

		}
		return boardDao.updateBoardListById(board);
	}

	// 게시글 중 내 글인지 아닌지 확인

	public boolean existBoardMyList(int boardId, String userId) {

		return boardDao.existBoardMyList(boardId, userId);
	}

	// 게시글 delete

	public int deleteBoard(Board board) {
		// 기존글 가져오기
		Board boardList = getBoardByBoardId(board);

		// 이미지가 있으면 이미지 삭제

		// 글삭제

		// 좋아요들 삭제

		// 댓글들 삭제

		return 0;
	}

	// board 타입으로 id로 가져오기 -> 게시글 udate 하기위한 준비.
	public Board getBoardByBoardId(Board board) {

		return boardDao.selectBoardByBoardId(board);

	}

	// 마이페이지 프로필 수정 User 타입으로 id 가져오기

	public User getUserByUserId(User user) {
		return boardDao.selectUserByUserId(user);

	}

	// 마이페이지 프로필 update
	public int updateMyProfileByUserId(User user, MultipartFile file) {
		User profile = getUserByUserId(user);
		if (profile == null) {
			return 0;
		}
		String profilePhoto = null;
		// 파일이 만약
		if (file != null) {
			profilePhoto = fileManagerServices.saveFile(user.getUid(), file);

			if (profilePhoto != null && user.getProfilePhoto() != null) {
				fileManagerServices.deleteFile(user.getProfilePhoto());
			}
			user.setProfilePhoto(profilePhoto);
		}

		return boardDao.updateMyProfileByUserId(user);
	}

}
