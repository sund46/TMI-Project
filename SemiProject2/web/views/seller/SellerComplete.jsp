<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap css 파일 추가하기 -->
<link   rel="stylesheet" 
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
		crossorigin="anonymous">
<!-- bootstrap js 파일 추가하기 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<title>SellerRegistration Page</title>
<style type="text/css">
	.jumbotron{
		width:800px;
		height:auto;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
		border: 0px solid #22d;
		padding: 12px;
		text-align: left;
	}
	
	
	.ui checkbox{
		text-align: right;
	}

	footer {
		position: absolute;
		bottom: -500px;
		left: 0;
	}
	
</style>
</head>
<body>
	<%@ include file="/views/common/cateheader1.jsp" %>

	<div class="jumbotron" style = "top:100px; left:200px; width:800px; height:auto;" align="center">

		<p class="lead" align="center">
		<img src="images/sellercomp.png">
		
		<hr class="my-4">
		<div align="right">
			<a class="btn btn-primary btn-lg" id="backButton" role="button" href="/semi/seller.so">메인으로가기</a>
			<a class="btn btn-primary btn-lg" id="backButton" role="button" href="/semi/views/seller/ServiceRegistration.jsp">판매하러가기</a>
		</div>
	</div>
		
		
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>