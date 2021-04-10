package com.practice.first.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.practice.first.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {
	
	  @Autowired
	  SqlSessionTemplate sqlSession;

	/**
	 * 1. 회원가입
	 * @param m
	 * @return
	 */
	public int insertMember(Member m) {
		System.out.println("여기들어옴?dao");
		return sqlSession.insert("memberMapper.insertMember",m);
	}

	/**
	 * 2. 로그인
	 * @param m
	 * @return
	 */
	public Member loginMember(Member m) {
		return (Member)sqlSession.selectOne("memberMapper.loginMember",m);
	}

	/**
	 * 
	 * 3. 업데이트
	 * @param m
	 * @return
	 */
	public int updateMember(Member m) {
		System.out.println("에이오");
		return sqlSession.update("memberMapper.updateMember",m);
	}
	
	/**
	 * 3-1. 이미지 업데이트
	 * @param m
	 * @return
	 */
	public int myImgUpload(Member m) {
		return sqlSession.update("memberMapper.myImgUpload",m);
	}

	/**
	 * 4. 회원삭제
	 * @param id
	 * @return
	 */
	public int deleteMember(String id) {
		return sqlSession.update("memberMapper.deleteMember",id);
	}

	/**
	 * 4-1 비밀번호 체크
	 * @param id
	 * @return
	 */
	public int pwdCheck(String id) {
		return sqlSession.selectOne("memberMapper.pwdCheck",id);
	}

	

}
