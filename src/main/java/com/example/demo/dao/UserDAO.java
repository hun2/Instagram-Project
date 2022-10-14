package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.model.User;

@Repository
public interface UserDAO {

	
	//회원 가입
	public void insertUser(User user);
	
	//회원가입 id 중복확인 
	
	public Boolean select_id_user(String uid);
}


