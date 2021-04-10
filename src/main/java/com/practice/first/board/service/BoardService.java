package com.practice.first.board.service;

import java.util.ArrayList;

import com.practice.first.board.model.vo.Board;
import com.practice.first.board.model.vo.BoardDTO;
import com.practice.first.board.model.vo.PageInfo;
import com.practice.first.board.model.vo.Reply;

public interface BoardService {

	/**
	 *  1_1 게시판 총 갯수 조회
	 * @return
	 */
	int getListCount();

	/**
	 * 1_2 게시판 리스트 조회
	 * @param pi
	 * @return
	 */
	ArrayList<Board> selectList(PageInfo pi);

	/**
	 * 2 게시판 디테일
	 * @param bId
	 * @return
	 */
	Board selectBoard(int bId);


	/**
	 * 2-1 이전글
	 * @param bId
	 * @return
	 */
	Board bprev(int bId);
	
	/**
	 * 2-2 다음글
	 * @param bId
	 * @return
	 */
	Board bnext(int bId);
	

	
	/**
	 * 3. 게시글 작성
	 * @param b
	 * @return
	 */
	int insertBoard(Board b);

	/**
	 * 4. 보드 업데이트
	 * @param bId
	 * @return
	 */
	Board selectUpdateBoard(int bId);
	int updateBoard(Board b);

	/**
	 * 5. 게시글 삭제
	 * @param bId
	 * @return
	 */
	int deleteBoard(int bId);

	/**
	 * 6. 최신글 리스트
	 * @return
	 */
	ArrayList<Board> selectTopList();

	/**
	 * 7 댓글 리스트
	 * @param nId
	 * @return
	 */
	ArrayList<Reply> selectReplyList(int bId);

	/**
	 * 8. 댓글달기
	 * @param r
	 * @return
	 */
	int insertReply(Reply r);

	


	

}
