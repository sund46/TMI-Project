package admin.serviceManage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.serviceManage.model.service.ServiceManageService;


@WebServlet("/serviceApv.admin")
public class ServiceApproveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServiceApproveServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int bno = Integer.parseInt(request.getParameter("bno"));
		
			try {
				new ServiceManageService().approveService(bno);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
