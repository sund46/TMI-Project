package charge.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import charge.model.exception.CashRechargeException;
import charge.model.service.CashRechargeService;
import charge.model.vo.Cash;
import member.model.vo.Member;

/**
 * Servlet implementation class whghlListServlet
 */
@WebServlet("/whghl.bo")
public class whghlListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public whghlListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 검색 카테고리
		String category = request.getParameter("con");
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		
		
		ArrayList<Cash> list = new ArrayList<Cash>();
		
		CashRechargeService cs = new CashRechargeService();
		
		String page = "";
		try {
			list = cs.searchNotice(category, m);
		} catch (CashRechargeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		page = "views/personBUY/billingHistory.jsp";
		request.setAttribute("list", list);
		
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
