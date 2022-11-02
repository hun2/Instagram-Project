package com.example.demo.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Board;
import com.example.demo.model.CardView;
import com.example.demo.model.CommentView;
import com.example.demo.model.User;

@Service
public class TimeLineBO {

	
	@Autowired
	private BoardBO boardBo;
	
	@Autowired
	private UserBO userBo;
	
	@Autowired
	private CommentBO commentBo;
	
	@Autowired
	private LikeBO likeBo;
	
	public List<CardView> generateCardList(String userId){
		
		//최종 리턴 리스트 생성
		List<CardView> cardViewList = new ArrayList<>();
		
		//글 목록을 가져온다
		List<Board> boardList = boardBo.getList();
		for (Board board : boardList) {
			
			CardView card = new CardView();
			
			//글정보
			card.setBoard(board);
			
			
			//글쓴이 정보
			User user = userBo.getUserById(board.getUserId());
			card.setUser(user);
			
			//글 하나에 해당하는 댓글 목록
			List<CommentView> commentList = commentBo.generateCommentViewListByPostId(board.getBoardId());
			card.setCommentList(commentList);
			
			//좋아요 눌렀는지 체크
			
			card.setFilledLike(likeBo.existLike(board.getBoardId(), userId));
			
			//수정 및 삭제 체크 여부
			card.setCheckMyBoard(boardBo.existBoardMyList(board.getBoardId(), userId));
			
			//좋아요 갯수
			card.setLikeCount(likeBo.getLikeCountByBoardId(board.getBoardId()));
			
			//댓글 갯수
			card.setCommentCount(commentBo.getCommentListCountByBoardId(board.getBoardId()));
			
			cardViewList.add(card);
		}
		
		return cardViewList;
	}
}
