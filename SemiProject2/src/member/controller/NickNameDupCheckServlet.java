package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.exception.MemberException;
import member.model.service.MemberService;


@WebServlet("/nickDupCheck")
public class NickNameDupCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public NickNameDupCheckServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName");
		
		MemberService ms = new MemberService();
		System.out.println(nickName);
		try {
			int isDup = ms.nickNameDupCheck(nickName);
			
			response.getWriter().print(isDup);
		}
		catch(Exception e) {
			e.printStackTrace();
			response.getWriter().print("Error");
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
