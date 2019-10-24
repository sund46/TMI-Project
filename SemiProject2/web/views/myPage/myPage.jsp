<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int mCount = 0;
	int buyCount = 0;
	int sellCount = 0;
		
	    mCount = (int)(session.getAttribute("mCount"));

		buyCount = (int)(session.getAttribute("buyCount"));

	    sellCount = (int)(session.getAttribute("sellCount"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="icon" href="/semi/resources/images/pic.jpg"/>
<link rel="stylesheet" href="../dist/css/swiper.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<title>나의 TMI</title>

<style>
*{
font-family: 'Noto Sans KR', sans-serif;
}
.section1{
	margin: 0 auto;
}
.section2{
	margin: 0 auto;
	width: 1024px;
	
}
.section3{
	margin:0 auto;
	margin-left:22px;
	margin-top : 50px;
}
.section4{
	overflow:hidden;
	margin:0 auto;
}
.section4>div{
 	display:inline-block;
}
.mp1{
	width:25%;
	margin:0 auto;
	float : left;
}
.mp2{
	width:75%;
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

.padding-all-15{
	padding : 15px;
}
.menu-slot{
	width:100%;
	
}

.active{
	background:#E8F0F5;
}

.dbox>div{
display: inline-block;
}
.dbox>div>a{
font-size:16px;
font-family: 'Noto Sans KR', sans-serif;
}
.dbox>div>h4{
font-family: 'Noto Sans KR', sans-serif;
}
.selling-history{
    vertical-align: 1px;
    font-size: 11px;
    color: #878787;
    padding: 1px 6px;
    background-color: #ddd;
    border-radius: 500px !important;
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
.select{
		background-color: #BDD4F2;
		color : #000;
	}
</style>
</head>

<body>
<%@ include file="../common/cateheader2.jsp" %>

<div class="section1">
	<div class="section2">
	
		<div class="section3" style="font-family: 'Noto Sans KR', sans-serif;">
			<h3>나의 TMI</h3>
		</div>
			<div class="section4">
				<div class="mp1"">
					<div class="profile">
								<div class="padding-15">
								<div class="user-profile-body">
									<img src="/semi/resources/images/myprofile.png" style="border-radius: 500px;width:100px;height:100px"/>
								</div>
								<ul class="user-profile-box">
									<li style=" border-top:none;"><div style="text-align : center; margin-bottom:20px;">
										<div class="font-noto" style="margin-top:5px;margin-bottom:10px;"><a href=""><%= m.getNickName() %></a></div>
										<%if(s==null){ %>
											<div><label class="seller-check font-noto" style="cursor:pointer;" onclick="gosell();">전문가 인증</label></div>
											<script>
												function gosell(){
													location.href="/semi/views/seller/SellerRegistration.jsp";
												}
											</script>
										<%}else{%>
											<div><label class="seller-check font-noto">전문가</label></div>
										<%} %>
									</div></li>
									<li><div class="income-out">
										<div class="income-out-div">
											<div class="font-noto">출금가능 수익금</div>
										</div>
										  
										<%
										 String income = "0";
										 String cash = dc.format(m.getCash());
										if(s!=null){
										  income = dc.format(s.getIncome()); 	  
										} 
										%>
										<div class="font-noto won"><b><%=income %>원</b></div>
									</div></li>
									<li><div class="income-out">
										<div class="income-out-div">
											<div class="font-noto">회원 보유캐시</div>
										</div>
										<div class="font-noto won"><b><%= cash %>원</b></div>
									</div></li>
								</ul>
							</div>
							<div class="menu-box">
								<div class="padding-15">
									<div class="menu-line" style="text-align:center">
										<a href="/semi/prging.bo?state=1"><div class="padding-all-15 menu-slot" style="border-right:solid #E6E6E6 1px;">							
											<div><img src="/semi/resources/images/buying_active.png" alt="" /></div>
											<h6>구매관리</h6>							
										</div></a>
										<% if(s!=null){ %>
		                        			<a href="/semi/dSelect.do"><div class="padding-all-15 menu-slot" style="border-right:solid #E6E6E6 1px;">
			                        	<%}else{ %>
			            					<a href="/semi/views/myPage/myPageManageSell.jsp"><div class="padding-all-15 menu-slot" style="border-right:solid #E6E6E6 1px;">
			                        	<%} %>
											<div><img src="/semi/resources/images/selling_active.png" alt="" /></div>
											<h6>판매관리</h6>			
										</div></a>
									</div>
									<div class="menu-line" style="text-align:center;border-bottom:solid #E6E6E6 2px;">
										<a href="/semi/views/myPage/myPageManageAd.jsp"><div class="padding-all-15 menu-slot" style="border-right:solid #E6E6E6 1px;">							
											<div><img src="/semi/resources/images/msg1.png" alt="" /></div>
											<h6>메시지</h6>							
										</div></a>
										<a href="/semi/views/myPage/myPageMyService.jsp"><div class="padding-all-15 menu-slot">
											<div><img src="/semi/resources/images/my_gigs_active.png" alt="" /></div>
											<h6>계정설정</h6>			
										</div></a>
									</div>
								</div>
							</div>
							
						</div>
				</div>
		 
				
			<div class="mp2">
				<div class="box1" style="border: 1px solid #E6E6E6; border-radius: 3px; width: 100%; height: 105px; margin-top:21px ">
					<div class="dbox" style="text-align: center;padding: 25px 0px;">
						<div class="detail1" style="border-right: 1px solid #E6E6E6; padding-right: 35px;">
							<h4>판매 중인 건</h4>
							<a href="/semi/myboard.bo"><b><%= sellCount %></b>건</a>
						</div>
						<div class="detail2" style="border-right: 1px solid #E6E6E6;padding:0 23px;">
							<h4>이달의 수익금</h4>
							<a href="/semi/list.ic"><b><%=income %></b>원</a>
						</div> 
						<div class="detail3" style="border-right: 1px solid #E6E6E6;padding:0 35px;">
							<h4>구매 중인 건</h4>
							<a href="/semi/nReq.bo"><b><%= buyCount %></b>건</a>
						</div>
						<div class="detail4" style="border-right: 1px solid #E6E6E6;padding:0 26px;">
							<h4>TMI 캐쉬</h4>
							<a href="/semi/cList.bo"><b><%= cash %></b>원</a>
						</div>
						<div class="detail5" style="padding-left: 35px">
							<h4>보유 쿠폰 개수</h4>
							<a href="/semi/views/personBUY/coupon.jsp"><b>0</b>개</a>
						</div>
					</div>
				
				</div>
				<div class="box2" style="margin-top:20px;">
					<div class="content1">
						<ul class="sell-ing">
							<li>
								<a style="color:#000; font-size:15px;margin-left:10px;" href="">할일 &nbsp; <span class="selling-history select">0</span></a>
							</li>
							<li style="font-size:15px;">
							<a style="color:#000; font-size:15px;" href="">알림 &nbsp; <span class="selling-history select">0</span></a>
							</li>
							
						</ul>
					</div>
					<div class="content2" style="border: 1px solid #E6E6E6;height:320px; margin-top:20px;"></div>
				</div>
			
			</div>
		</div>
	</div>
</div>

 <%@ include file="../common/footer.jsp" %>
</body>
</html>