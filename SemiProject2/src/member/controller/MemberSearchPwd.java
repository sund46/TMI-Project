package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberSearchPwd
 */
@WebServlet("/searchPwd.do")
public class MemberSearchPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearchPwd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("sEmail");
		String userName = request.getParameter("sName");
		String memberSSN = String.join("-", request.getParameter("sSSN1"),request.getParameter("sSSN2"));
		
		Member m = new Member();
		
		m.setSpwd(email, userName, memberSSN);
		
		MemberService ms = new MemberService();
	
		String result = ms.searchPwd(m);		
		
		if(result != null) {
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(result, response.getWriter());
		
		} else {
			String resultMsg = "입력하신 정보와 일치하는 계정이 없습니다.";
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(resultMsg, response.getWriter());
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
