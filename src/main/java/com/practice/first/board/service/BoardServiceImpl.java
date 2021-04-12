package com.practice.first.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.practice.first.board.dao.BoardDao;
import com.practice.first.board.model.vo.Board;
import com.practice.first.board.model.vo.BoardDTO;
import com.practice.first.board.model.vo.PageInfo;
import com.practice.first.board.model.vo.Reply;

@Service("bService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao bDao;
	
	
	/**
	 *1-1 리스트 갯수 조회
	 */
	@Override
	public int getListCount() {
		return bDao.getListCount();
	}

	/**
	 * 1-2 리스트 조회
	 */
	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bDao.selectList(pi);
	}

	/**
	 *2 게시판 디테일
	 *
	 */
	@Override
	public Board selectBoard(int bId) {
		// 조회수 증가
		int result=bDao.updateCount(bId); 
		System.out.println("서비스");
		if(result>0) {
			return bDao.selectBoard(bId);
		}else {
			return null;
		}
	}
	/**
	 *2-1 이전글
	 */
	@Override
	public Board bprev(int bId) {
		
		
		return bDao.bprev(bId);
	}
	/**
	 *2-2 다음글
	 */
	@Override
	public Board bnext(int bId) {
		
		return bDao.bnext(bId);
	}

	
	/**
	 *3. 게시글 작성
	 */
	@Override
	public int insertBoard(Board b) {
		return bDao.insertBoard(b);
	}


	/**
	 *4. 게시글 수정 뷰
	 */
	@Override
	public Board selectUpdateBoard(int bId) {
		return bDao.selectBoard(bId);
	}

	/**
	 *4-1 게시글 수정.
	 */
	@Override
	public int updateBoard(Board b) {
		return bDao.updateBoard(b);
	}


	/**
	 *5. 게시글 삭제
	 */
	@Override
	public int deleteBoard(int bId) {
		return bDao.deleteBoard(bId);
	}


	/**
	 *6. 최신글 리스트
	 */
	@Override
	public ArrayList<Board> selectTopList() {
		return bDao.selectTopList();
	}

	/**
	 *7. 댓글 리스트
	 *
	 */
	@Override
	public ArrayList<Reply> selectReplyList(int bId) {
		return bDao.selectReplyList(bId);
	}

	/**
	 *
	 *8. 댓글 달기
	 */
	@Override
	public int insertReply(Reply r) {
		return bDao.insertReply(r);
	}

	@Override
	public int deleteReply(Reply r) {
		return bDao.deleteReply(r);
	}

	@Override
	public int updateReply(Reply r) {
		return bDao.updateReply(r);
	}

	@Override
	public ArrayList<Reply> moreReplyList(int bId) {
		return bDao.moreReplyList(bId);
	}

	
	
		


	

}
