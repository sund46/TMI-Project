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
import charge.model.vo.Cash;
import member.model.vo.Member;

/**
 * Servlet implementation class CashRechServlet
 */
@WebServlet("/insertRech.bo")
public class CashRechServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CashRechServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession(false);//세션

		int mno = ((Member)session.getAttribute("member")).getMno();

		
		int cp = Integer.parseInt(request.getParameter("tprice"));
		
		String email = request.getParameter("email");

		
		Cash csh = new Cash(mno, cp, "충전");

		CashRechargeService crs = new CashRechargeService();

		
		try {
			crs.chargeInsert(csh);
			
			request.setAttribute("tprice", cp);
			request.setAttribute("email", email);

			
			request
			.getRequestDispatcher("/mCashRec.bo")
			.forward(request, response); 
			
			
		} catch(CashRechargeException e) {

			request.setAttribute("msg", "캐시 내역 넣을 때 에러 발생!!");
			request.setAttribute("exception", e);
		
			request
			.getRequestDispatcher("views/common/errorPage.jsp")
			.forward(request, response);
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
