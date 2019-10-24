package admin.memberManage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.memberManage.model.service.MemberManageService;


@WebServlet("/mDelete.admin")
public class MemberDeleteByAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberDeleteByAdmin() {}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		try {
			
			System.out.println("email Delete : " +email);
			new MemberManageService().deleteMember(email);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
