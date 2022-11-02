package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.model.Follow;

@Repository
public interface FollowDAO {

	//팔로우 추가
	public int insertFollow(Follow follow);
	
	
	//팔로우 삭제
	public int deleteFollow(Follow follow);
	
	
	//팔로우 수 카운트
	
	public int CountFollow(Follow follow);
	
	
	//팔로워 수 카운트
	
	public int CountFollowed(Follow follow);
	
	
	//팔로우 인지 아닌지 체크
	
	public int selectFollowByFollowId(Follow follow);
	
}
