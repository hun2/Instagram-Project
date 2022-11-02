package com.example.demo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.bo.LikeBO;
import com.example.demo.model.Board;
import com.example.demo.model.User;

@Controller
public class LikeController {

	@Autowired
	private LikeBO likeBo;
	
	@RequestMapping("/main/like")
	@ResponseBody
	public Map<String, Object> like(HttpSession session, Board board){
		Map<String,Object> result = new HashMap<>();
		User user = (User) session.getAttribute("loginUser");
		String userId = user.getUid();
		
		// 비로그인 일때는 결과값을 다르게 떨궈주기.
		if (user.getUid() == null) {
			result.put("code", 300);
			return result;
		}
		
		/*
		 * boolean isLike = likeBo.existLike(board.getBoardId(), userId); if(isLike
		 * ==true) { likeBo.deleteLikeCountByBoardIdUSerId(board.getBoardId(), userId);
		 * result.put("code", 100); } else {
		 * likeBo.addLikeCountByBoardIdUserId(board.getBoardId(), userId);
		 * 
		 * result.put("code", 1000); }
		 */
		
		
		//좋아요가 있든 없든 무조건 메소드 실행됨.
		likeBo.likeToggle(board.getBoardId(), userId);
		result.put("code", 100);
		
		return result;
	}
	
	
	
}
