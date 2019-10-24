package sellerboard.controller;

import java.io.IOException;


import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sellerboard.model.service.SellerboardService;
import sellerboard.model.vo.PageInfo;
import sellerboard.model.vo.SellerBoard;



@WebServlet("/searchedList.bo")
public class SearchedBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SearchedBoardList() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		
		ArrayList<SellerBoard> searchedList = null;
		SellerboardService bs = new SellerboardService();
		
		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int pageLimit;
		int boardLimit;
		String searchWord = request.getParameter("searchWord");
		currentPage = 1;
		pageLimit = 5;
		boardLimit = 12;
		
		
		
		
		if(request.getParameter("currentPage")!=null) {
			currentPage
			= Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int searchedListCount = bs.getSearchedListCount(searchWord);
		
	
		
		maxPage = (int)((double)searchedListCount/boardLimit+0.99);
		
		startPage = (int)((double)currentPage/(pageLimit+1))*pageLimit+1;
		
		endPage = startPage+pageLimit-1;
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		searchedList = bs.searchedList(currentPage, pageLimit, boardLimit, searchWord);
		System.out.println("리턴된 서치리스트 " + searchedList);
		
		String page="";
		
		if(searchedList != null) {
			page="views/categoryPage/searchPage.jsp";
			request.setAttribute("searchedList", searchedList);
			PageInfo pi = new PageInfo(currentPage, searchedListCount, pageLimit, boardLimit, maxPage, startPage, endPage);
			request.setAttribute("pi", pi);
			
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 목록 조회 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
