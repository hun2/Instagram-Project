package com.example.demo.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CommentDAO;
import com.example.demo.model.Comment;
import com.example.demo.model.CommentView;
import com.example.demo.model.User;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDao;
	
	@Autowired
	private UserBO userBo;
	
	
	public int getCommentListCountByBoardId(int boardId) {
		
		return commentDao.selectCommentListCountByBoardId(boardId);
	}
	
	
	
	public void createComment(String uid, int boardId, String comment) {
		commentDao.insertComment(uid, boardId, comment);
		
	}
	
	public List<Comment> getCommentListByBoardId(int boardId) {
			
		return commentDao.selectCommentListByBoardId(boardId);
	}
	
	
	public List<CommentView> generateCommentViewListByPostId(int boardId) {
		
		//결과물
		List<CommentView> commentViewList = new ArrayList<>();
		
		//댓글 목록 가져오기
		List<Comment> commentList = getCommentListByBoardId(boardId);
		
		//반복문 순회
		for ( Comment comment : commentList) {
			
			CommentView commentView = new CommentView();
			commentView.setComment(comment);
			
			User user = userBo.getUserById(comment.getUserId());
			
			//리스트에 담는다
			commentViewList.add(commentView);
			
		}
		
		return commentViewList;
	}
	
}
