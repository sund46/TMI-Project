<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member"%>    
<% 
	Member m = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<% if(m != null){
  	response.sendRedirect("/semi/top5.bo?page=mainheader2.jsp");
 }else{%>
	<%response.sendRedirect("/semi/top5.bo?page=mainheader1.jsp");}%>
</head>
<body>
</body>
</html>