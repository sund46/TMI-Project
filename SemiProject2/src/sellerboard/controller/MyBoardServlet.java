package sellerboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import seller.model.vo.Seller;
import sellerboard.model.exception.SellerboardException;
import sellerboard.model.service.SellerboardService;
import sellerboard.model.vo.SellerBoard;

/**
 * Servlet implementation class MyBoardServlet
 */
@WebServlet("/myboard.bo")
public class MyBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String state = null;
		if(request.getParameter("state") != null) {
			state = request.getParameter("state");
		}
		
		HttpSession session = request.getSession();
		Seller s = (Seller)session.getAttribute("seller");
		
		
		
		int sno = s.getSno();
		System.out.println(sno);

		ArrayList<SellerBoard> list;
		String page="";
		try {
			list = new SellerboardService().myBoardSelect(sno);
			
			if(state == null) {
				page="views/myPage/myPageMyService.jsp"; 
			} else {
				page="views/myPage/MyService/MyService"+state+".jsp";
			}
			
			request.setAttribute("list", list);
			
		} catch (SellerboardException e) {
			System.out.println("오류");
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 목록 조회 실패");
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
