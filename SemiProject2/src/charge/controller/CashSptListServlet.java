package charge.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import charge.model.exception.CashRechargeException;
import charge.model.service.CashRechargeService;
import charge.model.vo.Cash;
import member.model.vo.Member;

/**
 * Servlet implementation class CashSptListServlet
 */
@WebServlet("/spentList.bo")
public class CashSptListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CashSptListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");

		ArrayList<Cash> spentOnlyList = new ArrayList<Cash>();
		
		CashRechargeService crs = new CashRechargeService();
		
		// 페이징 처리에 필요한 변수들 ----------
		
				// 버튼들끼리 있을 때 가장 앞에 속하는 것
				// 한 번에 표시할 페이지들 중 가장 앞의 페이지
				// 1, 2, 3, 4, 5 --> 1
				// 6, 7, 8, 9, 10 --> 6
				int startPage;
				
				// 한 번에 표시할 페이지들 중 가장 뒤의 페이지
				int endPage;
				
				// 전체 페이지의 가장 마지막 페이지
				int maxPage;
				
				// 사용자가 위치판 현재 페이지
				int currentPage;
				
				// 총 페이지 수(한 페이지 당 보여줄 게시글 수)
				int limit;
				// -------------┘ 변수생성
				// 처음 접속 시 페이지는 1페이지부터 시작한다.
				currentPage = 1;
				
				// 글 개수 및  페이지 수 5개로 제한하기
				limit = 5;
				
				// 만약 사용자가 현재 페이지의 정보를 들고 왔다면
				// 현재 페이지의 정보를 1에서 특정 페이지로 수정해주어야 한다.

				if(request.getParameter("currentPage") != null) {
					//현재 페이지 정보를 가져온게 null이 아니라면
					
					currentPage = Integer.parseInt(request.getParameter("currentPage")); //문자열로 오니깐 숫자형태로 변경
								//null이 아니니깐 현재 페이지를 숫자로 바꿔서 다시 입힌다.
					System.out.println("currentPage : " + currentPage);
				}
				
				// 페이징 처리
				int listCount = 0;
				try {
					listCount = crs.getsptOnlyListCount(m);
				} catch (CashRechargeException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} //게시글 수 (물론 selectList로 해도 되지만, ListCount는 개수만 가져온다.)
												   //create method합시당~ (service, dao, query.properties 순서대로 작성해여~)
				System.out.println("총 페이지 개수 : " + listCount);
				
				maxPage = (int)((double)listCount / limit + 0.9);
				
				startPage
				  = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
				
				endPage = startPage + limit - 1;
				
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				
				
				
				
				
				
		String page="";
	
		try {
			spentOnlyList = crs.selectSptOnlyList(currentPage, limit, m);
		
			page = "views/personBUY/billingHistorySpt.jsp";
			
			request.setAttribute("spentOnlyList", spentOnlyList);
			
			charge.model.vo.PageInfo pi = new charge.model.vo.PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
			// 6개의 페이지 정보 담아서~
			request.setAttribute("pi", pi); //담은 것들을 한 번에 보내요~		
			
		} catch(CashRechargeException e) {
			page = "/semi/views/common/errorPage.jsp";
			request.setAttribute("msg", "결제목록 불러오기 에러!");
			request.setAttribute("exception", e);
			
			
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
