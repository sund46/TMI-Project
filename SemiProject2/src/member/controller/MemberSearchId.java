package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;


import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberSearchId
 */
@WebServlet("/searchId.do")
public class MemberSearchId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearchId() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("userName");
		String memberSSN1 = request.getParameter("userSSN1");
		String memberSSN2 = request.getParameter("userSSN2");
		
		String memberSSN = String.join("-", memberSSN1,memberSSN2);
		
		Member m = new Member();
		m.setSid(userName, memberSSN);
		
		MemberService ms = new MemberService(); 
		
		String result = ms.searchId(m);
	
		if(result != null) {
		
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(result, response.getWriter());
		
			
		}else {
			String errorMsg = "입력하신 정보에 해당하는 아이디가 존재하지 않습니다.";
		
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(errorMsg, response.getWriter());
			
			
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
