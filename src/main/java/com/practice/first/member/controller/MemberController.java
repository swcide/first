package com.practice.first.member.controller;

import java.text.DateFormat;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	/**
	 * 2.로그인
	 * @param m
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value="login.do",method=RequestMethod.POST)
	public String login(Member m,Model model, HttpSession session) {
		
		Member loginUser = mService.loginMember(m);
		
		
		
		if(loginUser!= null && bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser",loginUser);
			return "redirect:home.do";
		}else {
			model.addAttribute("msg","로그인 실패!");
			return "common/errorPage"; 
		}
		
	
	}
	/**
	 * 3.로그아웃
	 * @param status
	 * @return
	 */
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		System.out.println(status.toString() +"이거임??" );
		status.setComplete();
		return "redirect:home.do";
		
	}
	
	/**
	 * 4. 정보보기
	 *
	 ** @return
	 */
	@RequestMapping("myInfo.do")
	public String myInfoView() {
		return "member/uInfo";
	}
	/**
	 * 5-1.업데이트 뷰
	 * @return
	 */
	@RequestMapping("mUpdateView.do")
	public String mUpdateView() {
		return "member/uUpdate";
	}
	
	/**
	 * 5-2 업데이트
	 * @param m
	 * @param model
	 * @return
	 */
	@RequestMapping("mUpdate.do")
	public String mUpdate(Member m,Model model ,@RequestParam("birth") String birth ) {
		
		
		
        Calendar cal = Calendar.getInstance();
        int year  = cal.get(Calendar.YEAR);
        int age = year-Integer.parseInt(birth)+1;
		m.setAge(age);
		
		
		
		String encPwd= bcryptPasswordEncoder.encode(m.getPwd());
		m.setPwd(encPwd);
		
		int result= mService.updateMember(m);
		System.out.println(result);
		
		System.out.println(m);
		if (result>0) {
			model.addAttribute("loginUser",m);
			return "redirect:myInfo.do";
		}else {
			model.addAttribute("msg", "회원정보수정실패!");
			return "common/errorPage";
		}
	}
	
	/**
	 * 6-1 회원탈퇴 뷰
	 * 
	 * @return
	 */
	@RequestMapping("mdeleteView.do")
	public String mDeleteView(Member m) {
		
		
		return "member/withdrawal";
	}
	
	
	

	/**
	 * 6-2 비밀번호 체크
	 * @return
	 */
	@ResponseBody
	@RequestMapping("pwdcheck.do")
	public String pwdCheck(Member m,HttpSession session) {
		Member ms = (Member) session.getAttribute("loginUser");
		
		
		String id = ms.getId();
		
		System.out.println(id);
		int result = mService.pwdCheck(id);
		
		System.out.println(result);
		if(ms!= null && bcryptPasswordEncoder.matches(m.getPwd(), ms.getPwd())) {
			if(result>0) {
				System.out.println(result+"??");
				return "ok";
			}else {
				return "fail";
			}
		}else {
			return null;
		}
		
		
		
		
	
	}
	
	
	/**
	 * 6-2. 회원탈퇴
	 * @param id
	 * @param model
	 * @param status
	 * @return
	 */
	@RequestMapping("mdelete.do")
	public String mDelete(String id,Model model, HttpSession session) {
		
		System.out.println(session);
		
		int result = mService.deleteMember(id);
		System.out.println(result);
		if(result>0) {
			return "redirect:logout.do";
		}else {
			model.addAttribute("msg","회원탈퇴실패!");
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
