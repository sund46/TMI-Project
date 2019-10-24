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
import message.model.service.MessageService;
import message.model.vo.PageInfo;


@WebServlet("/prging.bo")
public class SelectBuyControlPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectBuyControlPage() {
        super();
       
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		String state = request.getParameter("state");
		
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
			
			if(state.equals("0")) {
				dingList = dms.selectAllList(m);
				page = "views/personBUY/buyingcontrol.jsp";
			}else if(state.equals("1")) {
				dingList = dms.ingselectList(m);
				page = "views/personBUY/buyingProgressing.jsp";
			}else if(state.equals("2")) {
				dingList = dms.selectFinList(m);
				page = "views/personBUY/buyingcontrolFin.jsp";
			}else {
				dingList = dms.selectCancelList(m);
				page = "views/personBUY/buyingcontrolCc.jsp";
			}
			
			System.out.println("서블릿시점 ding: " + dingList);
			
			
			request.setAttribute("dingList", dingList);
			PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
			
			request.setAttribute("pi",pi);
			
			
			
			request.getRequestDispatcher(page).forward(request, response);
			
			
			
		} catch(buyingctrlException e) {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "요구사항이 없는 것 불러오기 에러!");
			request.setAttribute("exception", e);
			e.printStackTrace();
			
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
