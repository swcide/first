package com.practice.first.member.service;

import com.practice.first.member.model.vo.Member;

public interface MemberService {

	/**
	 * 1.회원가입
	 * @param m
	 * @return
	 */
	int insertMember(Member m);

	/**
	 * 2. 로그인
	 * @param m
	 * @return
	 */
	Member loginMember(Member m);

	/**
	 * 3. 업데이트
	 * @param m
	 * @return
	 */
	int updateMember(Member m);

	/**
	 * 4.회원탈퇴
	 * @param id
	 * @return
	 */
	int deleteMember(String id);

	/**
	 * 5.암호체크
	 * @param id
	 * @return
	 */
	int pwdCheck(String id);




}
