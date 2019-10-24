package income.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import income.model.exception.IncomeException;
import income.model.service.IncomeService;
import seller.model.vo.Seller;

/**
 * Servlet implementation class WithdrawServlet
 */
@WebServlet("/withdraw.ic")
public class WithdrawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WithdrawServlet() {
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
		
		int wdMoney = Integer.parseInt(request.getParameter("wdMoney"));
		
		IncomeService is = new IncomeService();
		
		int result = -1;
		
		int result2 = -1;
		
		s.setIncome(s.getIncome()-wdMoney);
		
		session.setAttribute("seller", s);
		
		try {
			result = is.withdraw(s.getSno(), wdMoney);
			result2 = is.updateincome(s.getSno(),wdMoney);
			response.sendRedirect("/semi/list.ic");
		} catch (IncomeException e) {
			
			e.printStackTrace();
			request.setAttribute("exception", e);
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			
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
