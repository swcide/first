package com.practice.first.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.practice.first.board.model.vo.Board;
import com.practice.first.board.model.vo.BoardDTO;
import com.practice.first.board.model.vo.PageInfo;
import com.practice.first.board.model.vo.Reply;
import com.practice.first.board.service.BoardService;
import com.practice.first.common.Pagination;

@Controller
public class BoardController {
	
	
	@Autowired
	private BoardService bService;
	
	
	/**
	 * 1. 보드 리스트
	 * @param
	 * @return
	 */
	@RequestMapping(value = "bList.do")
	public ModelAndView boardList(ModelAndView mv, 
			  @RequestParam(value="currentPage",
			  required = false,defaultValue = "1") int currentPage) {

		int listCount = bService.getListCount();
		
		
		PageInfo pi = Pagination.getpageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectList(pi);
		
		ArrayList<Board> toplist = bService.selectTopList();
		
		mv.addObject("toplist",toplist);
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("board/bList");
		
		
		
		
		
		return mv;
	}
	
	/**
	 * 2. 보드 디테일
	 * @param model
	 * @return
	 */
	@RequestMapping("bDeteil.do")
	public ModelAndView boardDetail(ModelAndView mv, int bId,
			@RequestParam(value="currentPage",required = false,defaultValue = "1") int currentPage) {
		Board b = bService.selectBoard(bId);
		Board max = bService.bnext(bId);
		
		System.out.println("컨트롤러");
		ArrayList<Board> toplist = bService.selectTopList();
				
		if(b!=null) {
		mv.addObject("b",b)
		.addObject("max",max)
		.addObject("toplist",toplist)
		.addObject("currentPage", currentPage)
		.setViewName("board/boardDetailView");
		}else {
		mv.addObject("msg", "게시글 상세 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/**
	 * 2-1이전
	 * @param mv
	 * @param bId
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("bprev.do")
	public ModelAndView bPrev(ModelAndView mv, int bId,
			@RequestParam(value="currentPage",required = false,defaultValue = "1") int currentPage) {
		
		Board b = bService.bprev(bId);
		
		
		
		
		mv.addObject("bId",b.getbId())
		.addObject("currentPage", currentPage)
		.setViewName("redirect:bDeteil.do");
		
		
	
		return mv;
	}
	
	/**
	 * 2-2 다음
	 * @param mv
	 * @param bId
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("bnext.do")
	public ModelAndView bNext(ModelAndView mv, int bId,
			@RequestParam(value="currentPage",required = false,defaultValue = "1") int currentPage) {
		Board b = bService.bnext(bId);
	
		
		
		mv.addObject("bId",b.getbId())
		.addObject("currentPage", currentPage)
		.setViewName("redirect:bDeteil.do");
		
		
		
		return mv;
	}
	
	/**
	 * 3. 보드 라이트 뷰
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "bWriteView.do", method = RequestMethod.GET)
	public String bWriteView(Locale locale, Model model) {
		
		
		return "board/bWrite";
	}
	
	/**
	 * 
	 * 3-1 작성 
	 * @param b
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping("bWrite.do")
	public String insertBoard(Board b,HttpServletRequest request,
							 @RequestParam(name="uploadFile",required = false) MultipartFile file) {
		// @RequestParam어노테이션을 이용한 업롣 ㅡ파일 접근
		// form enctype이 multipart/form-data로 작성되어있어야하고, method=post이어야 한다.
		// MultipartResolver가 multipartFile객체를 컨트롤러로 전달할 수 있다.
		
		if(!file.getOriginalFilename().equals("")) {
			//서버에 업로드를 해야한다.
			String renameFIleName =  saveFile(file,request);
			
			if(renameFIleName != null) { // 파일이 잘 저장된 경우;
				b.setOriginalFileName(file.getOriginalFilename());
				b.setRenameFileName(renameFIleName);
				
			}
		}
		
		int result = bService.insertBoard(b);
		
		if(result>0) {
			return "redirect:bList.do";
		}else {
			return "common/errorPage";
		}
	
	}
	
/**
 * 3-2 파일저장
 * @param file
 * @param request
 * @return
 */
	public String saveFile(MultipartFile file,HttpServletRequest request) {
		
		// 파일이 저장될 경로를 설정하기
		// 웹 서버의 contextPath를 불러와서 폴더의 경로를 가져온다.
		
		// webapp하위의 resources
		String root  = request.getSession().getServletContext().getRealPath("resources");
		System.out.println("root : " + root );
		
		// 파일 경로
		// \를 문자로 인식시키기 위해서는 "\\"를 사용한다
		String savePath = root+"\\buploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs(); // 폴더가 없다면 생성한다.
		}
		// 파일명을 rename 과정을 추가 --> "년월일시분초.확장자"로 변경
		String originalFileName= file.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String renameFileName =sdf.format(new java.sql.Date(System.currentTimeMillis()))+"."
								+originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		
		String renamePath =folder+"\\"+renameFileName; // 실제 저장될 파일 경로 + 파일명
		
		try {
			file.transferTo(new File(renamePath)); // 전달받은 file이 rename명으로 이때 파일이 저장된다.
			
		}catch(Exception e) {
			System.out.println("파일전송 에러"+e.getMessage());
		}
		
		
		return renameFileName;
	}
	
	/**
	 * 3-3 파일 삭제
	 * @param fileName
	 * @param request
	 */
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root+"\\buploadFiles";
		File f = new File(savePath+"\\"+fileName);//기존의 업로드된 파일의 실제 경로를 이용해서 ifle 객체 생성
	
		if( f.exists()) {
			f.delete();
		}
	}
	/**
	 * 
	 * 3-3 서머노트 이미지 업로드
	 * @param multipartFile
	 * @param request
	 * @return
	 */
	@RequestMapping(value="sNoteImg.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		System.out.println(contextRoot);
		System.out.println(fileRoot);
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/spring/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
	/**
	 * 4. 보드 업데이트 뷰
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "bUpdateView.do", method = RequestMethod.GET)
	public ModelAndView bUpdateView(ModelAndView mv,int bId) {
		mv.addObject("b",bService.selectUpdateBoard(bId)).setViewName("board/bUpdate");
		return mv;
	}

	/**
	 * 
	 * 4-1 업데이트
	 * @param mv
	 * @param b
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping("bupdate.do")
	public ModelAndView updateBoard(ModelAndView mv,Board b,HttpServletRequest request,
			 @RequestParam(name="uploadFile",required = false) MultipartFile file) {
		
		System.out.println("여기 들어와?");
		if(file !=null && !file.isEmpty()) { // 새로 업로드된 파일이 있다면
			if(b.getRenameFileName() !=null) { //기존의 파일이 존재했을 경우 기존 파일 삭제.
				deleteFile(b.getRenameFileName(),request);
			}
			
			String renameFileName = saveFile(file,request);
			
			if(renameFileName != null) {
				b.setOriginalFileName(file.getOriginalFilename());
				b.setRenameFileName(renameFileName);
			}
		}
		System.out.println(b);
		
		int result = bService.updateBoard(b);
		System.out.println("여기 들어와?2");
		System.out.println(result);
		if(result>0) {
			mv.addObject("bId",b.getbId()).setViewName("redirect:bDeteil.do");
		}else {
			mv.addObject("msg","수정실패").setViewName("common/errorPage");
		}
		
		
		return mv;
	}
	
	/**
	 * 5 게시글 삭제
	 * @param bId
	 * @param request
	 * @return
	 */
	@RequestMapping("bdelete.do")
	public String boardDelete(int bId, HttpServletRequest request) {
		
		Board b = bService.selectUpdateBoard(bId);
		
		if(b.getRenameFileName() != null) {
			deleteFile(b.getRenameFileName(),request);
		}
		
		int result = bService.deleteBoard(bId);
		
		if(result >0) {
			return "redirect:bList.do";
		}else {
			return "common/errorPage";
		}
	}
	
	/**
	 * 
	 * 6.최신글 리스트
	 * @param mv
	 * @return
	 */
	public ModelAndView  bTopList( ModelAndView mv ) {
		
		ArrayList<Board> list = bService.selectTopList();
		
		System.out.println(list);
		mv.addObject("toplist",list);
		mv.setViewName("common/sidebar");
		
		
		
		return mv;
		
	}
	
	/**
	 * 7. 댓글 리스트
	 * 
	 * @param response
	 * @param nId
	 * @throws JsonIOException
	 * @throws IOException
	 */
	@RequestMapping(value = "rList.do")
	public void getReplyList(HttpServletResponse response, int bId) throws JsonIOException, IOException {

		response.setContentType("application/json; charset=UTF-8");

		ArrayList<Reply> rList = bService.selectReplyList(bId);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(rList, response.getWriter());

	}
	
	/**
	 * 
	 * 8.댓글 달기
	 * @param r
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addReply.do")
	public String addReply(Reply r) {

		int result = bService.insertReply(r);

		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
}
