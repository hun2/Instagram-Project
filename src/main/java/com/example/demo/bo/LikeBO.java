package com.example.demo.bo;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDao;
	
	//좋아요 눌렀는지 체그
	public boolean existLike(int boardId, String userId) {
		
		return likeDao.existLike(boardId, userId);
	}
	
	
	//좋아요 갯수 가져오기
	public int getLikeCountByBoardId(int boardId) {
		return likeDao.selectLikeCountByBoardId(boardId);
		
	}
	
	//좋아요 클릭시 insert
	public int addLikeCountByBoardIdUserId(int boardId, String userId) {
		return likeDao.insertLikeCountByBoardIdUserId(boardId, userId);
	}
	
	
	//좋아요 클릭시 delete
	public int deleteLikeCountByBoardIdUSerId(int boardId, String userId) {
		return likeDao.deleteLikeCountByBoardIdUSerId(boardId, userId);
	}
	
	
	//좋아요 있으면 제거 없으면 추가
	
	public void likeToggle(int boardId, String userId) {
		Map<String,Object> result = new HashMap<>();
		boolean isLike = existLike(boardId, userId);
		if ( isLike == true) {
			deleteLikeCountByBoardIdUSerId(boardId, userId);
		} else {
			addLikeCountByBoardIdUserId(boardId, userId);
		}
		
	}
	
	
	
}
