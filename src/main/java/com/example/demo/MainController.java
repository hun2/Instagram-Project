package com.example.demo;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.bo.UserBO;
import com.example.demo.model.User;

@Controller
public class MainController {
	
	@Autowired
	private UserBO userBo;
	
	
	//로그인 메인 페이지 접속
	@RequestMapping("/main/sign_in_view")
	public String sign_in() {
		
		
		return "main_signin";
	}
	
	
	//회원가입 접속
	@GetMapping("/main/sign_up_view")
	public String sign_up() {
		
		return "main_signup";
	}
	
	//회원가입 정보생성
	@PostMapping("/main/add_user")
	@ResponseBody
	public String add_user(User user) {
		
		userBo.addUser(user);
		
		return "성공";
	}
	
	//회원가입시 id 중복검사 확인
	@GetMapping("/main/get_id_user")
	@ResponseBody
	public Map<String, Boolean> get_id_user(@RequestParam("uid")String uid) {
		
		Map<String, Boolean> result = new HashMap<>();
		Boolean isduplication = userBo.get_id_user(uid);
		result.put("isduplication", isduplication);
		
		return result;
	}
	
	//로그인시 id 및 password 확인
	@GetMapping("/main/sign_success")
	@ResponseBody
	public Map<String, Boolean> get_loign_user(@RequestParam("uid")String uid, @RequestParam("pwd") String pwd) {
		
		Map<String, Boolean> result2 = new HashMap<>();
		Boolean checkingIdPwd = userBo.get_loign_user(uid, pwd);
		result2.put("checkingIdPwd", checkingIdPwd);
		
		return result2;
	}
}
