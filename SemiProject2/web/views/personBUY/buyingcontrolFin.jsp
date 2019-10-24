<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="buyingctrl.model.vo.DealMng" %>
<%@ page import="message.model.vo.PageInfo" %>
<%
	ArrayList<DealMng> dingList = (ArrayList<DealMng>)request.getAttribute("dingList");

		

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TMI 구매 관리</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<style>

	.container1 {
	width: 1200px;
	margin: 0 auto;
	border : 1px solid red;
	}

	.clearFix::after {
	width: 100%;
	content: '';
	clear: both;
	display: block;
	}
	
	.listcontent{
		padding-left : 5%;
	}
	<!-- ------------------------- -->
	.font-noto{
		font-family: 'Noto Sans KR', sans-serif;
    	font-weight: 400;
	}
	.my-page-sell{
		margin:0 auto;
	}
	.scontainer{

		width : 1024px;
		margin:0 auto;
		overflow : hidden;
	}
	.scontainer1{
		padding-left : 15px;
		padding-right : 15px;
		margin:0 auto;
	}
	.scontainer2{

		margin:0 auto;
		float : left;
	}
	
	.profile{
		margin-top:20px;
	}
	.width-25per{
		width:25%;

	}
	.width-75per{
		width:75%;

	}
	.user-profile-body{
		border: solid #E6E6E6 1px;
		border-bottom:none;
		text-align : center;
		padding-top : 20px;
	}
	.user-profile-box>li{
		border: solid #E6E6E6 1px;
		border-bottom:none;
		list-style : none;
		overflow : hidden;
	}
	
	.sell{
		margin-top : 40px;
	}
	.seller-check{
		display: inline;
	    border-radius: 10px;
	    padding: 1px 7px 2px 7px;
	    font-size: 75%;
	    line-height: 1;
	    color: #fff;
	    text-align: center;
	    white-space: nowrap;
	    vertical-align: baseline;
	    background : #364559;
	}
	.padding-15{
		padding:0 15px;
	}
	.income-out{
		padding :15px 0;
	}
	.income-out>div{
		display : inline-block;
		
	}
	.income-out-div{
		text-align:left; 
		width:50%;
		padding-left:15px; 
		padding-right: 0px;
		float:left;
		
	}
	.won{
		text-align:right; 
		width:50%;
		padding-right:15px; 
		padding-left:0;
	}
	.menu-line{
		border: solid #E6E6E6 1px;
		border-bottom:none;
		overflow:hidden;
	}
	.menu-line>a{
		display : inline-block;
		width:50%;
		margin-bottom : 0;
		float:left;
	}
	.menu-box img{
		width : 40px;
	}
	.menu-box{
	
	}
	.menu-box>div>div{

	}
	.padding-all-15{
		padding : 15px;
	}
	.menu-slot{
		width:100%;
		
	}
	.sell-ing{
		padding-bottom : 15px;
		 border-bottom:solid #E6E6E6 1px;
	}
	.sell-ing>li{
		list-style: none;
		display : inline-block;
		margin-right : 15px;
		
	}
	.sell-ing>li>a{
		color : #878787;
		font-family: 'Noto Sans KR', font;
		font-weight : 500;
	}
	.detail-box{
	    border-bottom: solid #E6E6E6 1px !important;
	}
	.detail-list{
		border: solid #E6E6E6 1px !important;
		padding : 85px 0;
		text-align : center;
		margin-top : 20px;
	}
	.selling-history{
	    vertical-align: 1px;
	    font-size: 11px;
	    color: #878787;
	    padding: 1px 6px;
	    background-color: #ddd;
	    border-radius: 500px !important;
	}
	.active{
		background:#E8F0F5;
	}
	.select{
		background-color: #BDD4F2;
		color : #000;
	}
	
	.margin-bottom-15{
		margin-bottom:15px;
	}
	
	.margin-top-5{
		margin-top : 5px;
	}
	
	.link-color-blue{
		color:#FF5050;
	}
	
	.padding-left-20{
		padding-left:20px;
	}
	

	
	
</style>
</head>
<body>
	<%@ include file="/views/common/cateheader2.jsp" %>
	<%
	DecimalFormat df = new DecimalFormat("###,###");
	int val = m.getCash();
	%>
	<div class="my-page-sell">
		<div class="scontainer">
			<div class="scontainer1">
				<div class = "sell font-noto">
					<h3>구매</h3>
				</div>
			</div>
			<div class="scontainer2 width-25per">
					<div class="profile">
						<div class="padding-15">
						<div class="user-profile-body">
							<img src="/semi/resources/images/myprofile.png" style="border-radius: 500px;width:100px;height:100px"/>
						</div>
						<ul class="user-profile-box">
							<li style=" border-top:none;"><div style="text-align : center; margin-bottom:20px;">
								<div class="font-noto" style="margin-top:5px;margin-bottom:10px;"><a href=""><%=m.getNickName() %></a></div><br>
								<div class="font-color-lighter font-size-h6">TMI캐시</div>
								<h3 class="margin-bottom-15 margin-top-5 link-color-blue NGB"><i class="won sign icon"></i><%=df.format(val) %> 원</h3>
								<div>
									<label class="seller-check font-noto" style="cursor:pointer;" onclick="lbcash();"><i class="credit card outline icon"></i>캐시충전</label>
									
								</div>
							</div>
							</li>
							
						</ul>
					</div>
					<div class="menu-box">
						<div class="padding-15">
							<div class="menu-line" style="text-align:center">
								<a href="/semi/prging.bo?state=1"><div class="padding-all-15 menu-slot active" style="border-right:solid #E6E6E6 1px;">							
									<div><img src="/semi/resources/images/buying_active.png" alt="" /></div>
									<h6>구매관리</h6>							
								</div></a>
								<a href="/semi/views/personBUY/cash.jsp"><div class="padding-all-15 menu-slot">
									<div style="margin: 3px 0;"><img src="/semi/resources/images/noun_won.png" alt="" /></div>
									<h6>TMI캐시</h6>			
								</div></a>
							</div>
							<div class="menu-line" style="text-align:center;border-bottom:solid #E6E6E6 1px;">
								<a href="/semi/cList.bo"><div class="padding-all-15 menu-slot" style="border-right:solid #E6E6E6 1px;">							
									<div><img src="/semi/resources/images/payment_active.png" alt="" /></div>
									<h6>캐시내역</h6>							
								</div></a>
								<a href="/semi/views/personBUY/coupon.jsp"><div class="padding-all-15 menu-slot">
									<div><img src="/semi/resources/images/coupon_active.png" alt="" /></div>
									<h6>쿠폰</h6>			
								</div></a>
							</div>
						</div>
					</div>
					
				</div>
				
			</div>
			<div class="scontainer3 width-75per" style="float:left">
				<div class="padding-15">
					<h3 class="font-noto" style="font-weight:700">구매관리</h3>
				</div>
				<div style="margin-top:20px">
					<div class="padding-15">
						<ul class="sell-ing">
							
							<li>
								<a style="" href="/semi/prging.bo?state=0">전체</a>
							</li>
							
							<li>
								<a href="/semi/prging.bo?state=1">진행중</a>
							</li>
							
							<li>
								<a style="color:#000" href="/semi/prging.bo?state=2">완료</a>
							</li>
							<li>
								<a href="/semi/prging.bo?state=3">취소</a>
							</li>
						</ul>
					</div>
				</div>
				<div style="margin-top:20px"></div>
					
				<div class="mp2">
			
				<table class="ui blue table" style="width:94%; margin-left:20px;">
				  <thead>
				    <tr>
				    <th>No</th>
				    <th style="width:45%; margin-right: 5%;">서비스 이름</th>
				    <th>가격</th>
				    <th>판매자</th>
				    <th>거래성사일</th>
				  </tr>
				  </thead>
				  
				  <tbody>
				   	<%
				   	int num = 1;
				   	for(DealMng dm : dingList){
				   	
				   		%>
				   	  <tr>
				   	  	<input type="hidden"/>
				   	  	<td><%=num %></td>	
				   	  	<td><%=dm.getBtitle()%></td>
				   	  	<td><%=dm.getPrice()%></td>
				   	  	<td><%=dm.getsNickname()%></td>
				   	  	<td><%=dm.getDealdate()%></td>
				   
				   	  </tr>
				
				   	<% num++; } %>

				  </tbody>
				</table>
				
				
				
				
				
				<div class="col-xs-12 margin-top-15">
                                      
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="panel bg-color-kmong-main profits-panel-border border-radius-0 border-solid">
                                    <div class="panel-body">
                                        <h6 class="NGB margin-all-0 padding-bottom-5">
                                            <i class="fa fa-exclamation-circle" aria-hidden="true"></i>
                                            <b>꼭 확인해주세요!</b>
                                        </h6>
                                        <ul class="font-color-light margin-top-5 margin-top-5 margin-bottom-0 font-size-h6 padding-left-20">
                                            <li>세금계산서는 거래 주체인 전문가가 의뢰인에게 발행합니다.</li>
                                            <li>
                                                세금계산서는 사업자 인증 받은 기업전문가에게 요청하실 수 있습니다.
                                            </li>
                                            <li>
                                                이벤트 쿠폰 사용 금액은 할인된 금액이기 때문에 세금계산서에 포함되지 않습니다.
                                            </li>
                                            <li>
                                                거래명세서는 결제가 완료되었음을 증명하는 용도로만 활용 가능하며 세무상의 지출증빙 효력이 없습니다.
                                            </li>
                                            <li>
                                                현금영수증은 개인의 소득공제용으로만 사용 가능하며, 결제 당시 지출 증빙용으로 선택하셨더라도 매입세액공제를 받으실 수 없습니다.
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
			</div>
		</div>
	</div>


	<script>
	
		
		function lbcash(){
			location.href="cash.jsp";
		}
	</script>
	
	


	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>