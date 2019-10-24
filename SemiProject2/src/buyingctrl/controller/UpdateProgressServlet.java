package buyingctrl.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buyingctrl.model.exception.buyingctrlException;
import buyingctrl.model.service.DealMngService;

/**
 * Servlet implementation class UpdateProgressServlet
 */
@WebServlet("/uProgress.do")
public class UpdateProgressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProgressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String progress = request.getParameter("progress");
		String dmcode = request.getParameter("dmcode");
		
		System.out.println(progress + " " + dmcode);
		
		String state="";
		if(request.getParameter("state")!=null) {
			state=request.getParameter("state");
		}
		
		DealMngService dms = new DealMngService();
		String page = "";
		try {
			dms.updateProgress(progress,dmcode);
			page="/dSelect.do";
		} catch (buyingctrlException e) {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "요구사항이 없는 것 불러오기 에러!");
			request.setAttribute("error", e);
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
