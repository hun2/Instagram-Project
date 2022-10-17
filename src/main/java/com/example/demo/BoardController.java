package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	
	//피드목록 - 접속
	@RequestMapping("/main/board_view")
	public String board_view() {
		
		
		
		return "board_view";
	}
	
	
	
	//마이페이지 - 접속
	@RequestMapping("/main/my_list")
	public String my_list() {
		
		return "my_list";
	}
	
}
