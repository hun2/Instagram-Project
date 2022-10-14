package com.example.demo.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class User {

	private int id;
	private String uid;
	private String pwd;
	private String email;
	private String nickName;
	private Date createdAt;
	private Date updatedAt;
	
	
	
}
