package com.example.demo;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.bo.UserBO;
import com.example.demo.common.SHA256;
import com.example.demo.model.User;

@Controller
public class LoginController {
	
	@Autowired
	private UserBO userBo;
	
	
	//로그인 메인 페이지 접속
	@GetMapping("/main/sign-in-view")
	public String sign_in() {
		
		
		return "main_signin";
	}
	
	//회원가입 접속
	@GetMapping("/main/sign-up-view")
	public String sign_up() {
		
		return "main_signup";
	}
	
	
	//회원가입 정보생성
	@PostMapping("/main/user")
	@ResponseBody
	public Map<String, Object> add_user(User user , @RequestParam(value="file", required = false) MultipartFile file) throws NoSuchAlgorithmException {
		
		//비밀번호 암호화
		SHA256 sha256 = new SHA256();
		String encryptedPwd = sha256.encrypt(user.getPwd());
		user.setPwd(encryptedPwd);
		//db insert
		int row = userBo.addUser(user, file);
		Map<String,Object> result = new HashMap<>();
		if ( row >0) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "회원가입에 실패하였습니다, 관리자에게 문의하세요");
		}
		
		return result;
	}
	
	//회원가입시 id 중복검사 확인
	@GetMapping("/main/id-user")
	@ResponseBody
	public Map<String, Boolean> get_id_user(@RequestParam("uid")String uid) {
		
		Map<String, Boolean> result = new HashMap<>();
		Boolean isduplication = userBo.get_id_user(uid);
		result.put("isduplication", isduplication);
		
		return result;
	}
	
	//로그인시 id 및 password 확인
	@GetMapping("/main/sign-success")
	@ResponseBody
	public User get_loign_user(User user, HttpServletRequest request) throws NoSuchAlgorithmException {
		
		SHA256 sha256 = new SHA256();
		String encryptedPwd = sha256.encrypt(user.getPwd());
		user.setPwd(encryptedPwd);
		User checkingIdPwd = userBo.get_loign_user(user);
		String uid =  user.getUid();
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", checkingIdPwd);
		session.setAttribute("loginUserId", uid);
		
		return checkingIdPwd;
	}
}
