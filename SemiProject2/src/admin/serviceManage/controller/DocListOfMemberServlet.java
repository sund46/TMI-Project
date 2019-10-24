package admin.serviceManage.controller;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.serviceManage.model.service.ServiceManageService;
import sellerboard.model.vo.SellerBoard;


@WebServlet("/docList.admin")
public class DocListOfMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DocListOfMemberServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.getSession().invalidate();
			HttpSession session = request.getSession();
			
			String email = request.getParameter("email");
			String nickName = request.getParameter("nickName");
			ArrayList<SellerBoard> docList = null;
			
			try {
				docList = new ServiceManageService().selectDocList(email);
				
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("게시물 리스트 불러오는 도중 실패! [서블릿]");
			}
			
			session.setAttribute("docList", docList);
			session.setAttribute("nickName", nickName);
		
			response.sendRedirect("views/adminPages/production/docListOfMember.jsp");
				}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
