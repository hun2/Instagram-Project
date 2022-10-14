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
	
	@RequestMapping("/main/sign_in_view")
	public String sign_in() {
		
		
		return "main_signin";
	}
	
	
	
	@GetMapping("/main/sign_up_view")
	public String sign_up() {
		
		return "main_signup";
	}
	

	@PostMapping("/main/add_user")
	@ResponseBody
	public String add_user(User user) {
		
		userBo.addUser(user);
		
		return "성공";
	}
	
	@GetMapping("/main/get_id_user")
	@ResponseBody
	public Map<String, Boolean> get_id_user(@RequestParam("uid")String uid) {
		
		Map<String, Boolean> result = new HashMap<>();
		Boolean isduplication = userBo.get_id_user(uid);
		result.put("isduplication", isduplication);
		
		return result;
	}
	
}
