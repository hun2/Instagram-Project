package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Board;
import com.example.demo.model.User;

@Repository
public interface BoardDAO {

	//글쓰기
	public int insertList(Board board);
	
	//글갯수(select)
	
	public int selectListCountByUserId(Board board);
	
	//글목록(select)
	
	public List<Board> selectList();

	//글 목록 중 내 글인지 아닌지 확인
	public boolean existBoardMyList(
			@Param("boardId") int boardId, 
			@Param("userId") String userId);
	
	//마이페이지 글누르면 가져오는것 
	
	public List<Board> selectListByUserIdAndBoardId(Board board);
	
	//마이페이지 글 목록(select)
	public List<Board> selectListByUserId(Board board);
	
	
	//------------마이페이지 프로필 수정
	public int updateMyProfileByUserId(User user);
	
	//프로필
	public User selectUserByUserId(User user);
	
	
	
	
	//-----------------게시글 수정
	public int updateBoardListById(Board board);
	
	//게시글 
	public Board selectBoardByBoardId(Board board);
	
	
}
