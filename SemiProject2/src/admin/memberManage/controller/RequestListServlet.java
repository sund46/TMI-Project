package admin.memberManage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.memberManage.model.service.MemberManageService;
import member.model.vo.ClientRequest;


@WebServlet("/requestList.admin")
public class RequestListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public RequestListServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getSession().invalidate();
		HttpSession session = request.getSession();
		
		
		ArrayList<ClientRequest> crList = null;
		String page ="";
		
		try {
		
		MemberManageService mms = new MemberManageService();
		crList = mms.selectRequestList();
		
		
		session.setAttribute("crList", crList);
		page = "views/adminPages/production/memberRequest.jsp";

		}
		catch(Exception e ){
			System.out.println("서비스 조회 중 문제 발생!");
			e.printStackTrace();
		}
		
	
		response.sendRedirect(page);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
