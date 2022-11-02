package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.User;

@Repository
public interface UserDAO {

	
	//회원가입
	public int insertUser(User user);
	
	//회원가입 id 중복확인 
	public Boolean select_id_user(String uid);
	
	//로그인 시 id 및 password 값 확인
	public User select_loign_user(User user);
	
	//로그인 아이디 하나 가져오기
	public User selectUserById(String uid);
	
	//유저 다 가져오기
	public List<User> selectUserAll(User user);
	
	
}


