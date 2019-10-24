package buyingctrl.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import buyingctrl.model.exception.buyingctrlException;
import buyingctrl.model.service.DealMngService;
import buyingctrl.model.vo.DealMng;
import member.model.vo.Member;
import message.model.vo.PageInfo;

/**
 * Servlet implementation class finishedListServlet
 */
@WebServlet("/finished.bo")
public class finishedListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public finishedListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		
		ArrayList<DealMng> dingList = new ArrayList<DealMng>();
		
		DealMngService dms = new DealMngService();
		
		String page="";
		
		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit;

		currentPage = 1;
		
	
		limit = 10;

		if(request.getParameter("currentPage") != null) {
		
		   currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = dms.getListCount(m);
		
		System.out.println("총 페이지 개수 : " + listCount);

		maxPage = (int)((double)listCount / limit + 0.9);
		startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
		endPage = startPage + limit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}


		try {
				
			dingList = dms.ingselectList(m,currentPage,limit);
			System.out.println("서블릿시점 ding: " + dingList);
			page = "views/personBUY/buyingProgressing.jsp";
			
			request.setAttribute("dingList", dingList);
			PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
			
			request.setAttribute("pi",pi);
			
			
			
			request.getRequestDispatcher(page).forward(request, response);
			
			
			
		} catch(buyingctrlException e) {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "요구사항이 없는 것 불러오기 에러!");
			request.setAttribute("exception", e);
			
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
