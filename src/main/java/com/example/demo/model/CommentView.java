package com.example.demo.model;

import lombok.Getter;
import lombok.Setter;

//댓글 한개
@Setter
@Getter
public class CommentView {
	
	
	//댓글 하나가 필요
	private Comment comment;
	
	//댓글 글쓴이 정보
	private User user;
	
	
	
}
