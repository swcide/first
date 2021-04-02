package com.practice.first.member.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.practice.first.member.model.vo.Member;
import com.practice.first.member.service.MemberService;

//import com.practice.first.member.service.MemberService;
//import com.practice.first.member.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
//	
//	private Logger logger = LoggerFactory.getLogger(MemberController.class);
//	

	@Autowired
	private MemberService mService;
	
	
 	
	
	
	/**
	 * 0.회원가입 뷰
	 * @return
	 */
	@RequestMapping("uInsertView.do")
	public String uInsertView() {
		System.out.println("들어와?");
		return "member/uInsert";
	}
	
	/**
	 * 1. 회원가입
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "uInsert.do", method = RequestMethod.POST)
	public String uInsert(Member m ,Model model) {
		
		System.out.println("컨트롤러");
		System.out.println(m);
 		
		String encPwd= bcryptPasswordEncoder.encode(m.getPwd());
 		m.setPwd(encPwd);
 		System.out.println(m);
 		
 		int result = mService.insertMember(m);
 		
 		if(result>0) {
 			return "redirect:home.do";
 		}else {
 			model.addAttribute("msg","회원가입실패");
 			return "common/errorPage";
 		}
		
		
		
	}
	
	@RequestMapping(value="login.do",method=RequestMethod.POST)
	public String memberLogin(Member m,Model model, HttpSession session) {
		
		Member loginUser = mService.loginMember(m);
		
		
		
		if(loginUser!= null && bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser",loginUser);
			return "redirect:home.do";
		}else {
			model.addAttribute("msg","로그인 실패!");
			return "common/errorPage"; 
		}
		
	
	}
//	
//	
//	/**
//	 * 3. 로그아웃
//	 * @param status
//	 * @return
//	 */
//	@RequestMapping("logout.do")
//	public String logout(SessionStatus status) {
//		System.out.println(status.toString() +"이거임??" );
//		status.setComplete();
//		return "redirect:home.do";
//		
//	}
	

}
