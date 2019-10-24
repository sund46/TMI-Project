package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.exception.MemberException;
import member.model.service.MemberService;
import member.model.vo.Member;


@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public LoginServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 인코딩
		request.setCharacterEncoding("UTF-8");
		
		String userEmail = request.getParameter("userEmail");
		String userPwd = request.getParameter("userPwd");
		String isSNS = request.getParameter("isSNS");
		int mCount = 0;
		int buyCount =0;
		int sellCount =0;
		
		Member m = new Member(userEmail,userPwd);
		m.setIsSNS(isSNS);
		
		
		MemberService ms = new MemberService();
		
		try {
			m = ms.selectMemeber(m);
			mCount = ms.getMcount(m);
			buyCount = ms.getBuyCount(m);
			sellCount = ms.getSellCount(m);
			
		
			// 관리자 계정일 경우 관리자 페이지로 보낸다.
			if(m.getIsAdmin().equals("Y")) {
				HttpSession session = request.getSession();
				session.setAttribute("admin", m);
				response.sendRedirect("memberSelect.admin");
			}// 관리자가 아닐 경우 메일인증 여부 확인
			else if(m.getEmailVerification().equals("0")) {
				request.setAttribute("errorMsg", "메일인증이 되지않은 계정입니다.");
				request.getRequestDispatcher("views/LoginForm.jsp").forward(request, response);
			}else if(m.getIsValid().equals("N")||m.getIsAlive().equals("N")) {
				request.setAttribute("errorMsg", "관리자에 의해 정지되었거나 탈퇴한 회원입니다.");
				request.getRequestDispatcher("views/LoginForm.jsp").forward(request, response);
			}
			
			else { // 메일인증 된 회원이면 로그인
					
					// 판매자일 경우
				if(m.getIsSeller().equals("Y")) {

					HttpSession session = request.getSession();
					session.setAttribute("member", m);
					
					System.out.println("서블릿에서의 mCount : " + mCount);
					session.setAttribute("mCount", mCount);
					session.setAttribute("buyCount", buyCount);
					session.setAttribute("sellCount", sellCount);
					
					RequestDispatcher view = request.getRequestDispatcher("seller.so");
					view.forward(request, response);
					
					
					// 판매자 아닐경우
				}else {
					HttpSession session = request.getSession();
					session.setAttribute("member", m);
					System.out.println("서블릿에서의 mCount : " + mCount);
					session.setAttribute("mCount", mCount);
					session.setAttribute("buyCount", buyCount);
					session.setAttribute("sellCount", sellCount);
					
					
					
					RequestDispatcher view = request.getRequestDispatcher("index.jsp");
					view.forward(request, response);
				}
			}
			
		  // 아이디 & 비밀번호가 틀릴 경우 에러메세지
		} catch (Exception e) {
			request.setAttribute("errorMsg", "아이디 또는 비밀번호를 다시 확인하세요.<br> TMI에 등록되지 않은 아이디이거나, 비밀번호를 잘못 입력하셨습니다.");
			request.getRequestDispatcher("views/LoginForm.jsp").forward(request, response);
		
		}
		
		

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
