package buyingctrl.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import buyingctrl.model.service.DealMngService;
import charge.model.exception.CashRechargeException;
import charge.model.service.CashRechargeService;
import charge.model.vo.Cash;
import member.model.vo.Member;


@WebServlet("/dealComplete")
public class DealCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DealCompleteServlet() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");

		int mno = m.getMno();
		
		int sno = Integer.parseInt(request.getParameter("sno"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		String email = request.getParameter("email"); // 어따쓰는건지?
		
		
		int cp = Integer.parseInt(request.getParameter("tprice")); //차감되는가격(이름변경해야함.)
		

		Cash csh = new Cash(mno, cp, "사용");

		CashRechargeService crs = new CashRechargeService();

		
		try {
			crs.spentCashInsert(csh);
			
			new DealMngService().dealComplete(mno,bno,sno,cp);
			
				
			
			
			request.setAttribute("tprice", cp);
			request.setAttribute("email", email);

			
			request
			.getRequestDispatcher("/bPayment.bo")
			.forward(request, response); 
			
			
		} catch(CashRechargeException e) {

			request.setAttribute("msg", "사용된 캐시 내역 넣을 때 에러 발생!!");
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
