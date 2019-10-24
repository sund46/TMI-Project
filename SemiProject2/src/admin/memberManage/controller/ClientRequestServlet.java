package admin.memberManage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.memberManage.model.service.MemberManageService;
import member.model.vo.ClientRequest;
import member.model.vo.Member;

@WebServlet("/clientRequest.do")
public class ClientRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ClientRequestServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			
			HttpSession session = request.getSession();
			Member m = (Member)session.getAttribute("member");
			
			String email = m.getEmail();
			String nickName = m.getNickName();
			String rTitle = request.getParameter("rTitle");
			String rContent = request.getParameter("rContent");
			
			try {
				ClientRequest cr = new ClientRequest(email,rTitle,rContent,nickName);	
				new MemberManageService().sendRequest(cr);
			}catch(Exception e) {
				
				e.printStackTrace();
			}
			
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		doGet(request, response);
	}

}
