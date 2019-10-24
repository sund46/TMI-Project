package sellerboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sellerboard.model.exception.SellerboardException;
import sellerboard.model.service.SellerboardService;
import sellerboard.model.vo.Top5;

/**
 * Servlet implementation class Top5Servlet
 */
@WebServlet("/top5.bo")
public class Top5Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Top5Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		SellerboardService sb = new SellerboardService();
		
		String page = "";
		try {
			Top5 t = sb.selectTop3(); // 수익순위가 높은 top3 상위카테고리 저장
			
			ArrayList<Top5> list = sb.selectTop5(t); // top3 카테고리의 게시물의 판매자 순위
			
			page = request.getParameter("page");
			System.out.println(page);
			request.setAttribute("t", t);
			request.setAttribute("list", list);
			
		} catch (SellerboardException e) {
			request.setAttribute("exception", e);
			page = "views/common/errorPage.jsp";
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
