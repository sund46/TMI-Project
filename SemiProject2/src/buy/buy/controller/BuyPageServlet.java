package buy.buy.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buy.buy.model.exception.BoardException;
import buy.buy.model.service.BoardService;
import buy.buy.model.vo.SellerBoard;
import buy.comment.model.service.BoardCommentService;
import buy.comment.model.vo.BoardComment;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class BuyPageServlet
 */
@WebServlet("/buyPage.bo")
public class BuyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		SellerBoard b;
		String page = "";
		
		try {
			b = new BoardService().selectOne(bno);
			page = "views/buypage/buy.jsp";
			request.setAttribute("sellerboard", b);
//			request.setAttribute("clist", clist);
		} catch (BoardException e) {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세 보기 실패");
			
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
