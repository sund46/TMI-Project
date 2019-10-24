package admin.memberManage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.memberManage.model.service.MemberManageService;


@WebServlet("/rDelete.admin")
public class RequestDeleteByAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public RequestDeleteByAdmin() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int rno = Integer.parseInt(request.getParameter("rno"));
			System.out.println(rno);
		try {
			
			new MemberManageService().deleteRequest(rno);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
