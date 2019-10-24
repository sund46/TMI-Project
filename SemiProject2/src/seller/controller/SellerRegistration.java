package seller.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;

import seller.model.exception.SellerException;
import seller.model.service.SellerService;
import seller.model.vo.Seller;
import sellerboard.model.exception.SellerboardException;
import sellerboard.model.service.SellerboardService;

/**
 * Servlet implementation class SellerRegistration
 */
@WebServlet("/seller.do")
public class SellerRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("판매 등록 서블릿과 연결 잘되었음");
		//인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		
		int mno=0;
		
		//똑같이 이메일로 MNO를가져올것이다. 
		String email = m.getEmail();
		
		try {
			mno = new SellerService().findMno(email);

		} catch (SellerException e) {
			request.setAttribute("msg", "멤버번호 가져오는 도중에 에러발생했어");
			request.setAttribute("exception", e);
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);	
		}
		
		//form 버튼이 눌렸을 때 getParameter로 값을 받아온다 
		
		String abletime = request.getParameter("abletime");			//연락가능시간
		String introtext = request.getParameter("introtext");		//전문가 소개
		String careerdate1 = request.getParameter("careerdate1");	//경력 날짜 1
		String careerdate2 = request.getParameter("careerdate2");	//경력 날짜 2
		String careerdate3 = request.getParameter("careerdate2");	//경력 날짜 3
		String career1 = request.getParameter("career1");			//경력 1
		String career2 = request.getParameter("career2");			//경력 2
		String career3 = request.getParameter("career3");			//경력 3
		String certificat1 = request.getParameter("certificat1");	//자격증 1
		String certificat2 = request.getParameter("certificat2");	//자격증 2
		String certificat3 = request.getParameter("certificat3");	//자격증 3
		String bankname = request.getParameter("bankname");
		String bankNumber = request.getParameter("bankNumber");
		
		Seller s = new Seller(mno, abletime, bankname, bankNumber, careerdate1, careerdate2, careerdate3, career1, career2, career3, certificat1, certificat2, certificat3, introtext);
		
		SellerService ss = new SellerService();
		SellerboardService sbs = new SellerboardService();
		
		
		
		int sno=0;
		
		try {
			ss.insertSeller(s);
			System.out.println("판매자 등록완료");
			ss.changeIsseller(mno);
			sno=sbs.findSno(email);
			s.setSno(sno);
			session.setAttribute("seller", s);
			
			
			response.sendRedirect("views/seller/SellerComplete.jsp");
		} catch(SellerException | SellerboardException e){
			request.setAttribute("msg", "판매자 등록 중 에러가 발생했어");
			request.setAttribute("exception", e); // 화면을 던져줄거니까
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		System.out.println("servlet에서 sno를 잘받았는지 확인 : "+sno);
		//sno의 세션을 유지 시킨다.
		session.setAttribute("sno", sno);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
