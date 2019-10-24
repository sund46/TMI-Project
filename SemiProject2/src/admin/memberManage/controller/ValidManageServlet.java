package admin.memberManage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.memberManage.model.service.MemberManageService;


@WebServlet("/validateManage.admin")
public class ValidManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public ValidManageServlet() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String email = request.getParameter("email");
			String isValid = request.getParameter("isValid");
			System.out.println(email);
			try {
				if(isValid.equals("Y")) {
					new MemberManageService().invalidateMember(email);	
				}else {
					new MemberManageService().validateMember(email);
				}
				
				
				
				
				response.sendRedirect("memberSelect.admin");
			}catch(Exception e){
					e.printStackTrace();
			}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		doGet(request, response);
	}

}
