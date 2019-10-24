<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="buy.buy.model.vo.* , java.util.*, member.model.vo.*" %>
<%
	String tprice = request.getParameter("tprice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<style>
p{
	margin:0 !important;
}
.clearFix::after {
	content: '';
	display: block;
	width: 100%;
	clear: both;
}

/* container 고정레이아웃 */
.container1 {
	width: 1200px;
	margin: 0 auto;
}

.paycontainer1{
	width: 680px;
	float: left;
}
.paycontainer2{
	width: 500px;
	float: left;
}
</style>
</head>
<body>
	<%@ include file="/views/common/cateheader1.jsp"%>
	
	<section class="container1 clearFix" style="margin-top: 50px;">
	<div class="paycontainer1">
		<div style="width: 100%;" >
			<img src="/semi/resources/images/paycreate.png" alt="" style="width: 100%;"/>
		</div>
		<div style="margin-top: 20px; border: 1px solid #e6e6e6; padding: 30px 0;">
			<p style="text-align: center; font-size: 21px; font-weight: bold; margin: 20px 0 !important;">결제가 완료되었습니다.</p>
			<div style="text-align: center;">
				<p style="width: 400px; margin: 0 auto !important; background: #bdd4f2; padding: 30px 0; font-size: 14px;">결제금액: &nbsp; <span style="font-size: 21px;"><%=tprice %>원</span></p>
				
			</div>
			<div style="text-align: center;">
			<p style=" width: 400px; margin: 25px auto !important; text-align: left;">주문 내역은 "우측상단 닉네임>구매>구매관리"에서 <br>확인 가능합니다.<br>
				기타 문의사항이 있을 경우, 고객센터를 이용해 주세요.
			</p>
			</div>
		</div>
	</div>
	
	<div class="paycontainer2" style="margin-top: 0px;">
	<fieldset style="padding: 30px !important;  margin-left:20px !important; border: 2px solid #e6e6e6;">
		<legend style="text-align: center; font-size: 18px; padding: 10px 20px; font-weight: bold;"> 주문 후 확인하세요 !</legend>
		
		<div style="border-bottom: 1px solid #e6e6e6; text-align: left; ">
			<p style="font-size: 16px; font-weight: bold; color: #333;">작업전 요청사항을 입력하세요.</p>
			
			<p style="margin: 10px 0 !important;">전문가님이 작업을 시작하실 수 있도록 요청되는 자료를 제공해주세요</p>
		</div>
		
		<div style="border-bottom: 1px solid #e6e6e6; text-align: left;">
			<p style="font-size: 16px; margin: 15px 0 !important; font-weight: bold; color: #333;">작업일을 확인하세요.</p>
			
			<p style="margin: 10px 0 !important;">전문가님의 작업물 발송을 확인하여 정확한 날짜에 작업물을 받아보세요.</p>
		</div>
		
		<div style=" text-align: left;">
			<p style="font-size: 16px; margin: 15px 0 !important;font-weight: bold; color: #333;">평가 해 주세요.</p>
			<p style="margin: 10px 0 !important;">작업물과 전문가에 대한 솔직한 의견은 다른 의뢰인들의 선택에 많은 도움이 됩니다.</p>
		</div>
		
		
		<div style="text-align: center;">
			<button style="padding: 10px 100px; 
				background: #364559; 
				border-radius: 8px;
				margin: 20px 10px;
				color:#fff;" onclick="location.href='/semi/prging.bo?state=1'">
				거래화면으로
			</button>		
		</div>
	</fieldset>
			
		
		
	</div>
	</section>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>









