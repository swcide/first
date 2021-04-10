package com.practice.first.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;

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
	 * @throws IOException 
	 */
	@RequestMapping(value="login.do",method=RequestMethod.POST)
	public String login(Member m,Model model, HttpSession session,HttpServletResponse response,HttpServletRequest request) throws IOException {
		
		Member loginUser = mService.loginMember(m);
		
		
		
		if(loginUser!= null && bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser",loginUser);
			String referrer = request.getHeader("Referer");
			return "redirect:"+referrer;
		}else {
			model.addAttribute("msg","로그인 실패!");
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요'); history.go(-1);</script>");
			out.flush();
			return "home";
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
	
	
	
	
	
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장될 경로를 설정하기
		// 웹 서버의 ContextPath 불러와서 폴더의 경로를 가져온다
		// webapp 하위의 resources
		String root = request.getSession().getServletContext().getRealPath("resources");
		System.out.println("root : " + root);
		// 파일 경로
		// \를 문자로 인식시키기 위해서는 "\\"를 사용한다.
		String savePath = root + "\\img" + "\\memberImg";
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs(); // 폴더가 없다면 생성한다.
		}
		String fileName = file.getOriginalFilename();
		String renamePath = folder + "\\" + fileName;// 실제 저장될 파일 경로 + 파일명
		try {
			file.transferTo(new File(renamePath)); // 전달 받은 file이 rename명으로 이때 파일이 저장된다.
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		return fileName;
	}
	
	@RequestMapping(value = "myImgUpload.do", method = RequestMethod.POST)
	@ResponseBody
	public String myImgUpload(Member m, HttpServletRequest request, @RequestParam(name = "file", required = false) MultipartFile file) {
		System.out.println("이미지업로드");
		System.out.println(file);
		if (!file.getOriginalFilename().equals(" ")) {
			// 서버에 업로드 해야한다.
			String renameRefFileName = saveFile(file, request);
			if (renameRefFileName != null) { // 파일이 잘 저장된 경우
				m.setPhone(file.getOriginalFilename()); // 파일명만 DB에 저장
				m.setPhone(renameRefFileName);
			}
		}
		int result = mService.myImgUpload(m);
		System.out.println("Result 체크 : " + result);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
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
