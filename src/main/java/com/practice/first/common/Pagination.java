package com.practice.first.common;

import com.practice.first.board.model.vo.PageInfo;

public class Pagination {
	
	public static PageInfo getpageInfo(int currentPage, int listCount) {
		// 페이지 정보를 담아줄 PageInfo 참조변수 선언
		PageInfo pi = null;
		
		int pageLimit = 10;       // 한 페이지에서 보여질 페이징 수
		int maxPage;			  // 전체 페이징 수 중 가장 마지막 페이지
		int startPage;			  // 현재 페이지에서 보여질 페이징 버튼의 시작 페이지
		int endPage;			  // 현재 페이지에서 보여질 페이징 버튼의 끝 페이지
		
		int boardLimit = 5;		  // 한 페이지에서 보여질 개시글 갯수
		
		// * maxPage  - 총 페이지 수
		maxPage = (int)((double)listCount/ boardLimit +0.9);
		
		//* startPage - 현재 페이지에 보여질 시작 페이지 수
		
		startPage = (((int)((double)currentPage/pageLimit+0.9)) -1)*pageLimit +1;
		
		// * endPage - 현재 페이지에서 보여질 마지막 페이지 수
		endPage = startPage+pageLimit -1;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage,listCount,pageLimit,maxPage,startPage,endPage, boardLimit);
		
		return pi;
	}

}
