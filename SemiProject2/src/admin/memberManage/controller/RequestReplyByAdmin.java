package admin.memberManage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.memberManage.model.service.MemberManageService;
import member.model.vo.ClientRequest;



@WebServlet("/requestReply.admin")
public class RequestReplyByAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public RequestReplyByAdmin() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int rno = Integer.parseInt(request.getParameter("rno"));
			String replyTitle = request.getParameter("replyTitle");
			String replyContent = request.getParameter("replyContent");
			try {
			
				ClientRequest cr = new ClientRequest(rno,replyTitle,replyContent);
				new MemberManageService().replyRequest(cr);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
