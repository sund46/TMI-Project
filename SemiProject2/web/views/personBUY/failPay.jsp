<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐시 결제 실패</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
</head>
<style>
	.failMain{
		margin : 0 auto;
		width : 900px;
		height : auto;
		margin-top : 50px;
	}
	
	.failcont{
		margin-left : 30px;
		margin-right : 30px;
		margin-top : 4f0px;
	}
	
	.failcontents{
		width : 700px;
		margin : 0 auto;
		margin-top : 5px;

		padding-bottom : 50px;
	}
	
	.image_Fail{
		padding-top : 80px;
		padding-bottom : 170px;
		padding-left : 4%;
		margin:0 auto;
	}
	
	.returnpay{
		padding-left : 40%;
	}


</style>
<body>
	<%@ include file="/views/common/cateheader2.jsp"%>

	<div class="failMain">
		<div class="failcont">
			<h3>TMI 캐시 결제 실패</h3>
			
			<div class="failcontents">
				<div class="image_Fail">
					<img src="/semi/resources/images/noun_Fail.png" width="140px;"/>
					<span style="font-size:30px; font-weight:bold; color:red;">캐시 결제 실패하였습니다.</span>
					<img src="/semi/resources/images/noun_BrokenCard.png" width="140px;"/>
				</div>
				<div class="returnpay">
					<button class="ui red button" onclick="reCashButton();">다시 결제하기</button>
				</div>
			</div>
		</div>
	</div>

	<script>
	function reCashButton(){
		location.href="/semi/views/personBUY/cash.jsp";
	}
	</script>





	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>