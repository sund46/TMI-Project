package message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.ClientRequest;
import member.model.vo.Member;
import message.model.service.MessageService;
import message.model.vo.PageInfo;


@WebServlet("/messageList")
public class MessageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public MessageListServlet() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				ArrayList<ClientRequest> requestList = null;
				HttpSession session = request.getSession();
				Member m = (Member)session.getAttribute("member");
				String email = m.getEmail();
				int startPage;
				int endPage;
				int maxPage;
				int currentPage;
				int limit;

				currentPage = 1;
				
			
				limit = 10;
		
				if(request.getParameter("currentPage") != null) {
				
				   currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}
				
				
				
				int listCount = new MessageService().getListCount(email);
				System.out.println("총 페이지 개수 : " + listCount);
				
			
				
			
				maxPage = (int)((double)listCount / limit + 0.9);
				
				
				
			
				startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
				
				
				
				endPage = startPage + limit -1;
				
			
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				
				requestList = new MessageService().selectList(email,currentPage,limit);
				
				String page = "";
				
				if(requestList !=null) {
					page ="views/message/message.jsp";
					request.setAttribute("requestList", requestList);
					
					// 페이지 정보를 묶어서 보내기 위한 Vo
					PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
					
					request.setAttribute("pi",pi);
					
				}else {
					System.out.println("메시지가 없습니다");
				}
				
				request.getRequestDispatcher(page).forward(request, response);

		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		doGet(request, response);
	}

}
