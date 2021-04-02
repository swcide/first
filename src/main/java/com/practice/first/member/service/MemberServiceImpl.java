package com.practice.first.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.practice.first.member.dao.MemberDao;
import com.practice.first.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{

	@Autowired 
	private MemberDao mDao;
	
	
	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(m);
	}


	@Override
	public Member loginMember(Member m) {
		Member loginUser = mDao.loginMember(m) ;
		return loginUser;
	}

}
