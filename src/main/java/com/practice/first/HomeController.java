package com.practice.first;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.practice.first.board.model.vo.Board;
import com.practice.first.board.model.vo.PageInfo;
import com.practice.first.board.service.BoardService;
import com.practice.first.common.PaginationHome;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private BoardService bService;
	
	
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv, 
			  @RequestParam(value="currentPage",
			  required = false,defaultValue = "1") int currentPage) {

		int listCount = bService.getListCount();
		
		
		PageInfo pi = PaginationHome.getpageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.selectList(pi);
		
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("home");
		
		
		
		
		
		return mv;
	}

	
}
