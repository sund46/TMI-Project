package buy.buy.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import buy.buy.model.exception.BoardException;
import buy.buy.model.service.BoardService;
import buy.buy.model.vo.SellerBoard;
import charge.model.exception.CashRechargeException;
import charge.model.service.CashRechargeService;
import charge.model.vo.Cash;
import member.model.vo.Member;

/**
 * Servlet implementation class BuyPagePaymentServlet
 */
@WebServlet("/bPayment.bo")
public class BuyPagePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyPagePaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		int tprice = (int)request.getAttribute("tprice");
		String page = "";
		

		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		m.setCash(m.getCash()-tprice);
		
		
		CashRechargeService crs = new CashRechargeService();
	
		try {
			
			crs.CashUpdate(m.getMno(),tprice);
			
			page = "views/buypage/payCreate.jsp";
			request.setAttribute("tprice", tprice);
			session.setAttribute("member", m);
			
			request.getRequestDispatcher(page).forward(request, response);
		} catch(SQLException e) {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "결제목록 불러오기 에러!");
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
