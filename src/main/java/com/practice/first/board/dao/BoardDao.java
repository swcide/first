package com.practice.first.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.practice.first.board.model.vo.Board;
import com.practice.first.board.model.vo.BoardDTO;
import com.practice.first.board.model.vo.PageInfo;
import com.practice.first.board.model.vo.Reply;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 1-1 게시글 갯수 조회
	 * @return
	 */
	public int getListCount() {
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	/**
	 * 1_2 게시글 리스트
	 * @param pi
	 * @return
	 */
	public ArrayList<Board> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList",null,rowBounds);

	}

	/**
	 * 2-1 조회수 증가
	 * @param bId
	 * @return
	 */
	public int updateCount(int bId) {
		return sqlSession.update("boardMapper.updateCount",bId);
	}

	/**
	 * 2-2 게시글 디테일
	 * @param bId
	 * @return
	 */
	public Board selectBoard(int bId) {
		System.out.println("디에이오");
		return sqlSession.selectOne("boardMapper.selectBoard",bId);
		
	}
	
	/**
	 * 2-1 이전글
	 * @param bId
	 * @return
	 */
	public Board bprev(int bId) {
		return sqlSession.selectOne("boardMapper.bprev",bId);
	}



	/**
	 * 2-2 다음글
	 * @param bId
	 * @return
	 */
	public Board bnext(int bId) {
		return sqlSession.selectOne("boardMapper.bnext",bId);
	}
	
	
	/**
	 * 3. 게시글 작성
	 * @param b
	 * @return
	 */
	public int insertBoard(Board b) {
		return sqlSession.insert("boardMapper.insertBoard",b);
	}

	/**
	 * 4. 게시글 수정
	 * @param b
	 * @return
	 */
	public int updateBoard(Board b) {
		return sqlSession.update("boardMapper.updateBoard",b);
	}

	/**
	 * 5. 게시글 삭제
	 * @param bId
	 * @return
	 */
	public int deleteBoard(int bId) {
		return sqlSession.update("boardMapper.deleteBoard",bId);

	}

	public ArrayList<Board> selectTopList() {
		return (ArrayList)sqlSession.selectList("boardMapper.selectTopList");
	}

	public ArrayList<Reply> selectReplyList(int bId) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList",bId);
	}

	public int insertReply(Reply r) {
		return sqlSession.insert("boardMapper.insertReply",r);
	}

	


	
}
