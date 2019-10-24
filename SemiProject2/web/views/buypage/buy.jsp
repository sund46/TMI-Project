<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="buy.buy.model.vo.* , java.util.*, member.model.vo.*" %>
<%
SellerBoard b = (SellerBoard)request.getAttribute("sellerboard");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=b.getBtitle() %></title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<style>
@charset "UTF-8";

html{
	font-family: 'Noto Sans KR', sans-serif;
}
.clearFix::after{
	content: '';
	display: block;
	width: 100%;
	clear: both;
}

/* container 고정레이아웃 */
.container1{
	width: 1200px;
	margin: 0 auto;
	

}
.container2{
	width: 1200px;
	margin: 0 auto;
	border: 1px solid #e6e6e6;
	
		
	
}
.buyBox{
	padding: 20px;
}


.buytitbox img{
	float: left;	
}

.buytit {
	font-size: 16px;
	color: #4d4d4d;
	margin: 10px 10px;
	line-height: 23px;
	display: inline-block;
	float:left;
}

.buytit p:nth-child(2){
	margin: 20px 0;
	
}
.buyid{
	font-size: 14px;
	color: #878787;
	margin-top: 20px;
	margin-left: 130px;
	
}

.order{
	margin: 30px 0;
}

table{
	width: 1160px;
	margin-top:20px;
}
table th{
	width: 200px;
	color: #4d4d4d;
	font-size: 14px;
	background: #f1f1f1;
	padding: 5px 0 ;
}
table th:nth-child(1){
	width: 600px;
	text-align: left;
	padding-left:10px;
	
}
table th:nth-child(4){
	text-align: right;
	padding-right:10px;
	
}

table td{
	text-align:center;
	width: 200px;
	color: #4d4d4d;
	font-size: 14px;
}
table td:nth-child(1){
	width: 600px;
	text-align: left;
	padding-left:10px;
	
}
table td:nth-child(4){
	text-align: right;
	padding-right:10px;
	
}



.payment{
	background: #f1f1f1;
	padding: 10px 5px;
	border-bottom: 1px solid #e6e6e6;
}

.cuponbox{
	display: inline-block;
	width: 800px;
	float:left;
	border-right: 1px solid #e2e2e2;
}
.cuponbox div{
    padding: 10px 20px;
}
.sumbox{
	float:left;	
	
	
}
.sumbox p{ 
	font-size: 18px;
	padding: 10px;
	width: 379px;
	
}
.sumbox p:nth-child(2){
	text-align:center; 
	font-size: 28px;
	color:#bdd4f2;
}
.buybtntext{
	float: left;
	margin-left: 20px;
}
.buybtntext p{
	
}
.buybtnbox{
	float:right;
	margin: 15px 0;
	
}
.buybtnbox a{
	padding: 10px 100px;
	background: #bdd4f2;
	border-radius: 8px;
}
.shildbox{
}

.paymentbtn{
	color: #fff;
    background-color: #6364d8;
    border-color: #6364d8;
	padding: 5px 20px;
	border-radius: 4px;
}

</style>

</head>
<body>
	<%@ include file="/views/common/cateheader1.jsp"%>
	
	<% if(m != null ) { %>
	<div class="container1">
		<h3 class="order" style="margin:30px 0;">주문하기</h3>
	</div>

	<section>
		<div class="container2">
			<div class="buyBox clearFix">
				<img src="/semi/resources/selleruploadIMG/<%=b.getImages()%>"
					style="width: 120px; height: 90px; display: inline-block; float:left;" />
				<div class="buytit clearFix">
					<p><%=b.getBtitle() %></p>
					<p><%=m.getNickName() %></p>
				</div>

				<table>
					<thead>
						<tr>
							<th>기본항목</th>
							<th>작업일</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="hidden" name="check" value="<%=b.getPrice() %>" id="option1" checked/>이미지</td>
							<td><%=b.getEditablecount() %>일</td>
							<td class="price"><%=b.getPrice() %>원</td>
						</tr>
					</tbody>
					<thead>
						<tr>
							<th>옵션항목</th>
							<th>작업일</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox" name="check" value="<%=b.getSpeed() %>" class="option2"/>빠른 작업</td>
							<td><%=b.getExtradate1() %>일</td>
							<td class="price"><%=b.getSpeed() %>원</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="check" value="<%=b.getPlusedit() %>" class="option2"/>추가 수정</td>
							<td><%=b.getExtradate2() %>일</td>
							<td class="price"><%=b.getPlusedit() %>원</td>
						</tr>
				
					</tbody>
				</table>

				
			</div>
		</div>

	</section>
	
	
	
	<section>
		<div class="container2" style="margin-top:20px;">
			<div class="payment">
				<p>결제금액</p>
			</div>
			<div class="clearFix">

				<div class="cuponbox clearFix">
					<div class="clearFix">
						<p style="display:inline-block;">쿠폰사용</p>
						<button class="paymentbtn" style="float:right">쿠폰선택</button>
					</div>

					<div class="clearFix">
						<p style="display:inline-block;">총 서비스 금액</p>
						<p style="float:right" class="totalPrice"><%=b.getPrice() %>원</p>
					</div>
					<div class="clearFix">
						<p>캐쉬사용(보유중인캐쉬:<%=m.getCash()%>원)
						<button class="paymentbtn" style="float: right;" onclick="location.href='/semi/views/personBUY/cash.jsp'">캐시충전</button></p>
					</div>
				</div>
				<div class="sumbox">
					<p>총 결제금액(VAT 포함)</p>
					<p class="totalPrice"><%=b.getPrice() %>원</p>
				</div>
			</div>
			
		</div>
	</section>

	<section>
		
			<div class="shildbox container1 clearFix" style="margin-top: 20px;">
				<img src="/semi/resources/images/shild.png" alt=""
					style="float: left; margin-left: 10px;">
				<div class="buybtntext">
					<p>TMI는 안전한 거래 환경을 제공합니다.</p>
					<p>TMI를 통해 결제 진행 시 관련 정책에 의해 보호 받을 수 있습니다.</p>
				</div>
				
					<div class="buybtnbox">
						<a onclick="goPay()">결제하기</a>
					</div>
			
				</div>
				  
				</section>
				<%} %>
	<script>	
    // 선택된 체크박스의 상품의 가격 합계 구하는 함수
    var total1=<%=b.getPrice() %>;
    $('input[name=check]').click(function(){
	   
    	total1=<%=b.getPrice() %>;
       $('input[name=check]:checked').each(function() {
    	   
          /* console.log(Number($('.price' + $(this).val()).text()));
          total += Number($('.price' + $(this).val()).text()); */
          console.log(Number($(this).val()));
          total1 += Number($(this).val());
          //console.log($('#price' + $(this).val()));
       });
       console.log(total1);
         $('.totalPrice').text(total1+"원");
       
    });
	
    function goPay(){
    	
    	if(<%= m.getCash() %> < total1){
    		alert("캐쉬충전이 필요합니다.");
    		location.href="views/personBUY/cash.jsp";
    	}else{ 		
    		   location.href = "<%=request.getContextPath()%>/dealComplete?tprice="+total1+"&bno=<%=b.getBno()%>&sno=<%=b.getSno()%>"
    	}
    		
  
    }
	</script>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>