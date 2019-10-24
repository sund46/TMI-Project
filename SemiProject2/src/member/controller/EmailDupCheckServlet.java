package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.exception.MemberException;
import member.model.service.MemberService;


@WebServlet("/emailDupCheck.do")
public class EmailDupCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EmailDupCheckServlet() {
        super();
      
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String email = request.getParameter("email");
	
		MemberService ms = new MemberService();
		
		try {
			int isDup = ms.emailDupCheck(email);
			response.getWriter().print(isDup);
		}
		
		catch(MemberException e) {
			e.printStackTrace();
			response.getWriter().print("Error");
		}
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
