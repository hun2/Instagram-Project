package com.example.demo.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	public boolean existLike(
			@Param("boardId") int boardId, 
			@Param("userId")  String userId);
	
	public int selectLikeCountByBoardId(int boardId);
	
	public int insertLikeCountByBoardIdUserId(
			@Param("boardId") int boardId,
			@Param("userId") String userId);
	
	public int deleteLikeCountByBoardIdUSerId(
			@Param("boardId") int boardId,
			@Param("userId") String userId);
	
}
