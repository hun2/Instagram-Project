package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Comment;

@Repository
public interface CommentDAO {
	
	public void insertComment(
			@Param("uid") String uid, 
			@Param("boardId") int boardId, 
			@Param("comment") String comment);
	
	public List<Comment> selectCommentListByBoardId(int boardId);
	
	
	public int selectCommentListCountByBoardId(int boardId);
	
}
