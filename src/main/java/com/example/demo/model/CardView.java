package com.example.demo.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;


@Setter
@Getter
public class CardView {

	//게시글(1개의) 구성되는 모든것들
	private Board board;
	
	//글쓴이 정보
	private User user;
	
	
	//댓글은 n개
	private List<CommentView> commentList;
	
	//댓글 샛수
	private int commentCount;
	
	//좋아요갯수
	private int likeCount;
	
	
	//로그인된 사람이 좋아요를 눌렀는지
	private boolean filledLike;
	
	//수정 및 삭제 권한 체크
	
	private boolean checkMyBoard;
	
}
