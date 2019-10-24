package charge.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import charge.model.exception.CashRechargeException;
import charge.model.service.CashRechargeService;
import member.model.vo.Member;

/**
 * Servlet implementation class CashSptServlet
 */
@WebServlet("/mCashSpt.bo")
public class CashSptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CashSptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//2사용
		int Cash = (int)(request.getAttribute("tprice"));
		String email = (String) request.getAttribute("email");
		System.out.println("Cash : " + Cash);
		Member m = new Member(Cash);
		
		m.setEmail(email);
		
		CashRechargeService crs = new CashRechargeService();
		
		HttpSession session = request.getSession(false);
		Member changeMember = (Member)session.getAttribute("member");
		String page;
//		try {
//			changeMember.setCash(crs.minusinsertCash(m));
//			
//			session.setAttribute("member", changeMember);
//			
//			request
//			.getRequestDispatcher("/bPayment.bo")
//			.forward(request, response);
//			page = "views/buypage/payCreate.jsp"; 
//		} catch (CashRechargeException e) {
//			request.setAttribute("msg", "캐시내역 에러 발생!!");
//			request.setAttribute("exception", e);
//		} 
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
