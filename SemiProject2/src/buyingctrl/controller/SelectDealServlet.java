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
import seller.model.vo.Seller;

/**
 * Servlet implementation class SelectDealServlet
 */
@WebServlet("/dSelect.do")
public class SelectDealServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectDealServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		Seller s = (Seller)session.getAttribute("seller");
		DealMngService dms = new DealMngService();
		
		String state=null;
		if(request.getParameter("state")!=null) {
			state=request.getParameter("state");
		}
		String page="";
		ArrayList<DealMng> list;
		try {
			list = dms.selectDeal(s.getSno());
			request.setAttribute("list", list);
			if(request.getParameter("state")!=null) {
				page = "views/myPage/mySell/mySell"+state+".jsp";
				
			}else {
				page = "views/myPage/myPageManageSell.jsp";
			}
		} catch (buyingctrlException e) {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "요구사항이 없는 것 불러오기 에러!");
		}
		
	
		
		
		request.getRequestDispatcher(page).forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
