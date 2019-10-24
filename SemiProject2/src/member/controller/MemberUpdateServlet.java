package member.controller;


import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/mUpdate.do")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		

		String userPwd = request.getParameter("userPwd");
		String phone = request.getParameter("phone");
		
		Member m2 = new Member(m.getEmail(),userPwd,phone);
		
		MemberService ms = new MemberService();
		int result = ms.updateMember(m2);
		
		if(result > 0) {
			// 회원정보 변경 완료!
			System.out.println("회원 정보가 성공적으로 수정되었습니다.");
			// 세션정보 변경
			m2.setMemberSSN(m.getMemberSSN());
			m2.setUserName(m.getUserName());
			
			session.setAttribute("member", m2);
			
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			view.forward(request, response);
			
		} else {
			// 수정 실패!
			response.sendRedirect("views/common/errorPage.jsp");
		}
			
	}
		
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
