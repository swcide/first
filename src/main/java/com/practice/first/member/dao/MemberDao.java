package com.practice.first.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.practice.first.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {
	
	  @Autowired
	  SqlSessionTemplate sqlSession;

	public int insertMember(Member m) {
		System.out.println("여기들어옴?dao");
		return sqlSession.insert("memberMapper.insertMember",m);
	}

	public Member loginMember(Member m) {
		return (Member)sqlSession.selectOne("memberMapper.loginMember",m);
	}

}
