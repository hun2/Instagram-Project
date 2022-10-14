package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	
	@RequestMapping("/main/sign_in_view")
	public String sign_in() {
		
		
		return "main_signin";
	}
	
	
	
	@GetMapping("/main/sign_up_view")
	public String sign_up() {
		
		return "main_signup";
	}
}
