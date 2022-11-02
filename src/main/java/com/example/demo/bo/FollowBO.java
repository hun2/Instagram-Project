package com.example.demo.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.FollowDAO;
import com.example.demo.model.Follow;

@Service
public class FollowBO {

	@Autowired
	private FollowDAO followDao;
	
	
	//팔로우 추가
	
	public int addFollow(Follow follow) {
		
		return followDao.insertFollow(follow);
	}
	
	//팔로우 삭제
	
	public int deleteFollow(Follow follow) {
		
		return followDao.deleteFollow(follow);
	}
	
	//팔로우수 확인
	
	public int CountFollow(Follow follow) {
		
		return followDao.CountFollow(follow);
	}
	
	
	//팔로워수 확인
	public int CountFollowed(Follow follow) {
		return followDao.CountFollowed(follow);
	}
	
	
	//팔로우 중인지 아닌지 확인
	public int getFollowByFollowId(Follow follow) {
		
		return followDao.selectFollowByFollowId(follow);
	}
	
}
