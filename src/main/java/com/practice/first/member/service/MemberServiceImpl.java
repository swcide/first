package com.practice.first.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.practice.first.member.dao.MemberDao;
import com.practice.first.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{

	@Autowired 
	private MemberDao mDao;
	
	
	/**
	 *1. 회원가입
	 *
	 */
	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(m);
	}


	/**
	 *
	 *2. 로그인
	 */
	@Override
	public Member loginMember(Member m) {
		Member loginUser = mDao.loginMember(m) ;
		return loginUser;
	}


	/**
	 *3.업데이트
	 */
	@Override
	public int updateMember(Member m) {
		
		return mDao.updateMember(m);
		
	}
	
	/**
	 *3-1 이미지 업데이트
	 */
	@Override
	public int myImgUpload(Member m) {
		return mDao.myImgUpload(m);
	}


	/**
	 *
	 *4. 회원탈퇴
	 */
	@Override
	public int deleteMember(String id) {
		return mDao.deleteMember(id);
	}


	/**
	 *4-1 암호체크
	 */
	@Override
	public int pwdCheck(String id) {
		return mDao.pwdCheck(id);
	}


	

}
