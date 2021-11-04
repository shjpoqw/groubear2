package com.kh.groubear.common;

import com.kh.groubear.member.model.vo.PageInfo;

public class Pagination {

	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		
		//총 페이지수 maxPage
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		//현재 페이지에 보여지는 페이징 바의 시작수 
		int startPage = (currentPage - 1)/pageLimit *pageLimit +1;
		
		//현재 페이지에서 보여지는 페이징 바의 끝수 
		int endPage = startPage + pageLimit -1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, startPage ,endPage ,maxPage, pageLimit, boardLimit);
		
		return pi;
	}
}
