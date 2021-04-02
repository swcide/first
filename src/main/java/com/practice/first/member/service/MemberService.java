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


}
