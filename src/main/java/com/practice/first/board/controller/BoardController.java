package com.practice.first.board.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	
	/**
	 * 1. 보드 리스트
	 * @param
	 * @return
	 */
	@RequestMapping(value = "bList.do")
	public ModelAndView bList(ModelAndView mv ) {
		
//		int listCount = bService.getListCount();
		
		
//		PageInfo pi = Pagination.getpageInfo(currentPage, listCount);
		
//		ArrayList<Board> list = bService.selectList(pi);
		
//		mv.addObject("list",list);
//		mv.addObject("pi",pi);
		mv.setViewName("board/bList");
		return mv;
	}
	
	/**
	 * 2. 보드 디테일
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "bDeteil.do", method = RequestMethod.GET)
	public String bDetial(Locale locale, Model model) {
		
		
		return "board/bDeteil";
	}
	/**
	 * 3. 보드 라이트
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "bWrite.do", method = RequestMethod.GET)
	public String bWrite(Locale locale, Model model) {
		
		
		return "board/bWrite";
	}
	/**
	 * 4. 보드 업데이트
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "bUpdate.do", method = RequestMethod.GET)
	public String bUpdate(Locale locale, Model model) {
		
		
		return "board/bUpdate";
	}

	
}
