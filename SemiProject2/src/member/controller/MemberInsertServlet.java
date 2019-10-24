package member.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;


/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/mInsert.do")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public MemberInsertServlet() {
        super();
     
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // 회원 가입 서비스를 연동하는 서블릿
		
	     // 1. 인코딩
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			String email = request.getParameter("email");
			String userPwd = request.getParameter("userPwd");
			String userName = request.getParameter("userName");
			String nickName = request.getParameter("nickName");
			String phone = String.join("-", request.getParameter("phone1"),request.getParameter("phone2"),request.getParameter("phone3"));
			String memberSSN = String.join("-", request.getParameter("memberSSN1"),request.getParameter("memberSSN2"));
			String isSNS = request.getParameter("isSNS");
			
			Member m = new Member(email,userPwd,userName,nickName,phone,memberSSN,isSNS);
			
			// 회원 가입 서비스 실행
			MemberService ms = new MemberService();
			int result = ms.insertMember(m);
			
			if(result > 0 && isSNS.equals("N")) {
				// 회원 가입 성공!
				
				RequestDispatcher view = request.getRequestDispatcher("views/member/sendEmail.jsp");
				view.forward(request, response);
			  	
			} else if(result > 0 && isSNS.equals("Y")){
			  response.sendRedirect("index.jsp");
			  } else {
				// 회원 가입 실패!
				response.sendRedirect("views/common/errorPage.jsp");
			}
			
		
			
			
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
