package seller.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import seller.model.exception.SellerException;
import seller.model.service.SellerService;
import seller.model.vo.Seller;

/**
 * Servlet implementation class SellerSelectServlet
 */
@WebServlet("/seller.so")
public class SellerSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerSelectServlet() {
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
		Member m = (Member)session.getAttribute("member");
		String page = null;
		if(request.getAttribute("page")!=null) {
			page = (String)request.getAttribute("page");
		}

		String email = m.getEmail();
		Seller result = new Seller();
		
		try {
			result = new SellerService().selectSeller(email);

			session.setAttribute("seller", result);
			if(page!=null) {
				response.sendRedirect(page);
			}else {
				response.sendRedirect("/semi/index.jsp");
			}
		} catch (SellerException e) {
			request.setAttribute("msg", "판매자 식별 실패");
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
