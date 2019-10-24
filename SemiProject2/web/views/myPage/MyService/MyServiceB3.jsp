<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "sellerboard.model.vo.*, java.util.*" %>
<% 
	ArrayList<SellerBoard> list = (ArrayList<SellerBoard>)request.getAttribute("list");
	int b1 = 0;
	int b2 = 0;
	int b3 = 0;
	int b4 = 0;
	if(list!=null){
		for(SellerBoard b : list){
			switch(b.getState()){
				case "B1" : b1+=1; break;
				case "B2" : b2+=1; break;
				case "B3" : b3+=1; break;
				case "B4" : b4+=1; break;
	 		}
		}
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="/semi/resources/js/semantic.min.js"></script>
<title>나의 서비스</title>
<style>
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
	.mySlist{
		overflow:hidden;
		margin:0 auto;
		border-bottom : 1px solid #E6E6E6;
		
	}
	.mySlist>div{
		display:inline-block;
		float:left;
		vertical-align:center;
		border-right : 1px solid #E6E6E6;
	}
	.mySlist>div div{
		margin:20px 0;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/cateheader2.jsp" %>
	<div class="my-page-sell">
		<div class="scontainer">
			<div class="scontainer1">
				<div class = "sell font-noto">
					<h3>판매</h3>
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
								<% if(s!=null){ %>
                        			<a href="/semi/dSelect.do"><div class="padding-all-15 menu-slot" style="border-right:solid #E6E6E6 1px;">
	                        	<%}else{ %>
	            					<a href="/semi/views/myPage/myPageManageSell.jsp"><div class="padding-all-15 menu-slot" style="border-right:solid #E6E6E6 1px;">
	                        	<%} %>					
									<div><img src="/semi/resources/images/selling_active.png" alt="" /></div>
									<h6>판매관리</h6>							
								</div></a>
								<% if(s!=null){ %>
                        			<a href="/semi/list.ic"><div class="padding-all-15 menu-slot">
	                        	<%}else{ %>
	            					<a href="/semi/views/myPage/myPageManageIncome.jsp"><div class="padding-all-15 menu-slot">
	                        	<%} %>
									<div><img src="/semi/resources/images/profits_new_active.png" alt="" /></div>
									<h6>수익관리</h6>			
								</div></a>
							</div>
							<div class="menu-line" style="text-align:center;border-bottom:solid #E6E6E6 1px;">
								<a href="/semi/views/myPage/myPageManageAd.jsp"><div class="padding-all-15 menu-slot" style="border-right:solid #E6E6E6 1px;">							
									<div><img src="/semi/resources/images/advertisement_active.png" alt="" /></div>
									<h6>광고관리</h6>							
								</div></a>
								<% if(s!=null){ %>
                        			<a href="/semi/myboard.bo"><div class="padding-all-15 menu-slot active">
	                        	<%}else{ %>
	            					<a href="/semi/views/myPage/myPageMyService.jsp"><div class="padding-all-15 menu-slot active">
	                        	<%} %>
									<div><img src="/semi/resources/images/my_gigs_active.png" alt="" /></div>
									<h6>나의 서비스</h6>			
								</div></a>
							</div>
						</div>
					</div>
					
				</div>
				
			</div>
			<div class="scontainer3 width-75per" style="float:left">
				<div class="padding-15">
					<h3 class="font-noto" style="font-weight:700">나의 서비스</h3>
				</div>
				<div style="margin-top:20px">
					<div class="padding-15">
						<%if(s!=null){ %>
						<ul class="sell-ing">
							<li>
								<a href="/semi/myboard.bo">전체 &nbsp; <span class="selling-history"><%=list.size()%></span></a>
							</li>
							<li>
								<a href="/semi/myboard.bo?state=B2">판매중 &nbsp; <span class="selling-history"><%=b2 %></span></a>
							</li>
							<li>
								<a href="/semi/myboard.bo?state=B1">승인대기중 &nbsp; <span class="selling-history"><%=b1 %></span></a>
							</li>
							<li>
								<a style="color:#000" href="/semi/myboard.bo?state=B3">판매중지 &nbsp; <span class="selling-history select"><%=b3 %></span></a>
							</li>
							<li>
								<a href="/semi/myboard.bo?state=B4">비승인 &nbsp; <span class="selling-history"><%=b4 %></span></a>
							</li>
						</ul>
						<%}else{ %>
						<ul class="sell-ing">
							<li>
								<a href="/semi/myboard.bo">전체 &nbsp; <span class="selling-history">0</span></a>
							</li>
							<li>
								<a href="/semi/myboard.bo?state=B2">판매중 &nbsp; <span class="selling-history">0</span></a>
							</li>
							<li>
								<a href="/semi/myboard.bo?state=B1">승인대기중 &nbsp; <span class="selling-history">0</span></a>
							</li>
							<li>
								<a style="color:#000" href="/semi/myboard.bo?state=B3">판매중지 &nbsp; <span class="selling-history select">0</span></a>
							</li>
							<li>
								<a href="/semi/myboard.bo?state=B4">비승인 &nbsp; <span class="selling-history">0</span></a>
							</li>
						</ul>
						<%} %>
					</div>
				</div>
				<div>
					<div class="padding-15" style="margin-top:10px">
						<div class="detail-box">
						<%if(list != null){ %>
							<div class="detail-list" style="padding:0">
								<div class="comment" style="overflow:hidden;background:#f9fafb;padding:5px 0;">
									<div style="width:20%; display:inline-block; float:left;"><h5>사진</h5></div>
									<div style="width:50%; display:inline-block;float:left;"><h5>제목</h5></div>
									<div style="width:15%; display:inline-block;float:left;"><h5>가격</h5></div>
									<div style="width:15%; border-right:none; display:inline-block;float:left;"><h5>상태</h5></div>
								</div>
								<%for(SellerBoard b : list){ 
								  String states = " ";%>
								<%switch(b.getState()){
									case "B1" : states="승인대기중"; break;
									case "B2" : states="판매중"; break;
									case "B3" : states="판매중지"; break;
									case "B4" : states="비승인"; break;
								}%>
								<%if(b.getState().equals("B3")){ %>
								
									<div class="mySlist" style="margin:0;padding: 20px 0">
										<div style="width:20%; "><img width=100px src="/semi/resources/selleruploadIMG/<%=b.getImages()%>" alt="" /></div>
										<div style="width:50%; "><div><a href="/semi/listDetail.bo?bno=<%= b.getBno()%>"><h5 style="text-align:left; margin-left:20px"><%=b.getBtitle() %></h5></a></div></div>
										<div style="width:15%; "><div style="margin:30px 0"><h5><%=b.getPrice() %></h5></div></div>
										<div style="width:15%; border-right:none;"><div style="margin:30px 0"><h5><%=states%></h5></div></div>
									</div>
								<%}%>
								
								<%} %>
							</div>
						<%}else{ %>
							
							<div class="detail-list">
								<div>
									<h5 class="font-noto" style="color:#878787">
									등록한 서비스가 없습니다.<br> 서비
									
									스를 등록하여 판매를 시작해보세요!
                                    </h5>
								</div>
								<button class="ui button" style="background:#364559;color:white;margin-top:5px;" onclick="sellstart()">판매 시작하기
									
								</button>
								
								<script>
									function sellstart(){
										<%if(s == null){ %>
											location.href='/semi/views/seller/SellerRegistration.jsp';
			                            <%}else{ %>
			                            	location.href='/semi/views/seller/ServiceRegistration.jsp';
			                            <%} %>
									}
								</script>
								
							</div>
							
							<%} %>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>