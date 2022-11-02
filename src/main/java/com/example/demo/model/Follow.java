package com.example.demo.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Follow {

	
	private String userId_follower;
	private String userId_followed;
	private Date createdAt;
}
