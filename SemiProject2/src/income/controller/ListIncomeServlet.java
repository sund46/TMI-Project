package income.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import income.model.service.IncomeService;
import income.model.vo.Income;
import seller.model.vo.Seller;

/**
 * Servlet implementation class ListIncomeServlet
 */
@WebServlet("/list.ic")
public class ListIncomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListIncomeServlet() {
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
		
		IncomeService is = new IncomeService();
		
		ArrayList<Income> list = is.selectIncome(s.getSno());
		
		int allincome = 0;
		int beforeincome = 0;
		int afterincome = 0;
		
		String page = "";
		if(list!=null) {
		
			for(Income i : list) {
				switch(i.getIchistory()) {
					case "수익": allincome += i.getIcmoney(); break;
					case "출금": afterincome += i.getIcmoney(); break;
				}	
			}
			
			beforeincome = allincome - afterincome;
			
			Income ic = new Income(allincome,beforeincome,afterincome);
			
			request.setAttribute("list", list);
			request.setAttribute("ic", ic);
		
			page = "views/myPage/myPageManageIncome.jsp";
			
		} else {
			
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
