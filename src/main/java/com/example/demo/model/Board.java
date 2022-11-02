package com.example.demo.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Board {

	
	private int boardId;
	private String userId;
	private String boardImage;
	private String content;
	private Date createdAt;
	private Date updatedAt;
	
}
