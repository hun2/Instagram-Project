package com.example.demo.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Comment {

	
	private int commentId;
	private int boardId;
	private String userId;
	private String comment;
	private Date createdAt;
	private Date updatedAt;
	
}
