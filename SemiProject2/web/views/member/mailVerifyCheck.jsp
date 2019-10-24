<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.common.PasswordWrapper"%>
<%@ page import ="member.model.dao.MemberDao"%>
<%@ page import ="member.model.service.MemberService" %>
<%@ page import ="java.io.PrintWriter" %>
<%
	// 이메일에서 보내온 암호화된 코드
	String code = request.getParameter("code");
	// 공백을 '+'로 변경
    String edittedCode = code.replace(" ", "+");
	String email = request.getParameter("receiver");
	// 받은 email 암호화
	String compareCode = PasswordWrapper.getSHA512(email);
	MemberService ms = new MemberService();
	// 메일에서 보내온 code와 비교해서 맞으면 인증
	if(edittedCode.equals(compareCode)){
		PrintWriter script = response.getWriter();
		// 실제 인증을 해주는 Service 부분
		int result = ms.verifyEmail(email);
		// 성공
		if(result > 0){
			script.println("<script>");
			script.println("alert('인증이 완료되었습니다. 로그인하세요!')");
			script.println("location.href = '/semi/index.jsp'");
			script.println("</script>");
		}
		// 실패
		else{
			script.println("<script>");
			script.println("alert('인증실패')");
			script.println("location.href = '/semi/index.jsp'");
			script.println("</script>");
		}
		script.close();
		
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이메일 값이 틀립니다.')");
		script.println("location.href = '/semi/index.jsp'");
		script.println("</script>");
		script.close();
	
	}

%>
