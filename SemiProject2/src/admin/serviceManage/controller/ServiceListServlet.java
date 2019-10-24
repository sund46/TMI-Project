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


@WebServlet("/serviceList.admin")
public class ServiceListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ServiceListServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().invalidate();
		HttpSession session = request.getSession();
		
		ArrayList<SellerBoard> sList = null;
		String page ="";
		
		try {
		
		ServiceManageService sms = new ServiceManageService();
		sList = sms.selectServiceList();
		System.out.println(sList);
		session.setAttribute("sList", sList);
		page = "views/adminPages/production/serviceManage.jsp";
		
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
