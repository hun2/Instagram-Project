package com.example.demo.bo;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.common.FileManagerServices;
import com.example.demo.dao.FollowDAO;
import com.example.demo.dao.UserDAO;
import com.example.demo.model.Follow;
import com.example.demo.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private FollowDAO followDao;
	
	@Autowired
	private FileManagerServices fileManagerServices;
	
	//회원가입
	public int addUser(User user, MultipartFile file) {
		
		String profilePhoto = null;
		if (file !=  null) {
			profilePhoto = fileManagerServices.saveFile(user.getUid(), file);
			user.setProfilePhoto(profilePhoto);
		}
		
		return userDao.insertUser(user);
	}
	
	
	
	//회원가입_id 중복확인
	public Boolean get_id_user(String uid) {
		
		return userDao.select_id_user(uid);
	}
	
	
	//로그인 시 id 및 password 값 select 하기
	public User get_loign_user(User user) {
		
		return userDao.select_loign_user(user);
	}
	
	
	
	//user 하나만 가져오기
	public User getUserById(String uid) {
				
		return userDao.selectUserById(uid);
	}
	
	public List<User> getUserAll(User user) {
		
		return userDao.selectUserAll(user);
	}
	
	
	
	
}


