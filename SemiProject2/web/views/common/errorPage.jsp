<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% Exception e = (Exception)request.getAttribute("exception");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
<style>

.logo{
   width: 500px;
   text-align:center;
   margin:0 auto;
}

</style>
</head>
<body>
	<div class="Wrapper" style="margin: 0 auto; border-bottom: 4px solid #BDD4F2!important;">
   <div class="logo">
      <img src="/semi/resources/images/KakaoTalk_20190606_164601739.png" style="width:125px; cursor:pointer; margin-bottom: -9px;" onclick="toMain();">   
   </div>
  </div>
	<h1>에러 발생!!</h1>
	<h2>에러 메세지 : <%=e.getMessage() %></h2>
	<p>관리자에게 문의하세요!</p>
	
	<%@ include file="/views/common/footer.jsp" %>
	
</body>
</html>