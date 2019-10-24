<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat,java.util.*,income.model.vo.*"%>
<%
	ArrayList<Income> list = (ArrayList<Income>)request.getAttribute("list");
	Income ic = (Income)request.getAttribute("ic");
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<title>수익관리</title>
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
	.select{
		background-color: #BDD4F2;
		color : #000;
	}
	
	.ad-request{
		border-radius: 4px;
		padding: 5px 10px;
		color: #4d4d4d;
	    background-color: #fff;
	    display: inline-block;
	    margin-bottom: 0;
	    text-align: center;
	    vertical-align: middle;
	    touch-action: manipulation;
	    cursor: pointer;;
	    border: 1px solid #e6e6e6;	    
	    font-size: 13px;
	    line-height: 1.5438;
	    user-select: none;
	}
	.ad-request:hover{
	    color: #4d4d4d;
	    background: #f0f0f0;
	    border-color: #c7c7c7;
	}
	.ad-request>h5{
		color:#666;
	}
	.income-box{
	    padding: 8px;
	    box-shadow: 0 0 10px 0 #E6E6E6;
	}
	.withdraw-income{
	    border-right: solid #E6E6E6 1px;
	    padding-left: 25px;
        margin-bottom: 10px;
        margin-top: 10px;
        width: 50%;
        overflow:hidden;
        float:left;
	}
	.row{
		overflow:hidden;
	}
	.row>div{
		display:inline-block;
	}
	.predict-income{
	    border-right: solid #E6E6E6 1px;
	    margin-bottom: 10px;
        margin-top: 10px;
        width: 25%;
		float:left;
        text-align:center;
        
	}
	.margin-10{
		margin:10px 0;
	}
	.plain{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight:400;	
		text-decoration: none;
    	color: #4d4d4d;	
	}
	.NGB{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight:500;
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
		border-top: solid #E6E6E6 1px !important;
	    border-bottom: solid #E6E6E6 1px !important;
	}
	.detail-list{
		border: solid #E6E6E6 1px !important;
		padding : 85px 0;
		text-align : center;
		margin-top : 20px;
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
		
	}
	#withdraw{
		width:500px;
	}
</style>
</head>
<body>
	<%@ include file="../common/cateheader2.jsp" %>
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
								<div class="font-noto" sty le="margin-top:5px;margin-bottom:10px;"><a href=""><%= m.getNickName() %></a></div>
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
									 String allincome = "0";
										 String beforeincome = "0";	
										 String afterincome = "0";
									 String cash = dc.format(m.getCash());
									if(ic!=null){
									  allincome = dc.format(ic.getAllincome()); 
									  beforeincome = dc.format(ic.getBeforeincome());
									  afterincome = dc.format(ic.getAfterincome());
									} 
								%>
								<%if(ic!=null){ %>
									<div class="font-noto won"><b><%=beforeincome %>원</b></div>
								<%}else{ %>
									<div class="font-noto won"><b>0원</b></div>
								<%} %>
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
                        			<a href="/semi/list.ic"><div class="padding-all-15 menu-slot active">
	                        	<%}else{ %>
	            					<a href="/semi/views/myPage/myPageManageIncome.jsp"><div class="padding-all-15 menu-slot active">
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
                        			<a href="/semi/myboard.bo"><div class="padding-all-15 menu-slot">
	                        	<%}else{ %>
	            					<a href="/semi/views/myPage/myPageMyService.jsp"><div class="padding-all-15 menu-slot">
	                        	<%} %>
									<div><img src="/semi/resources/images/my_gigs_active.png" alt="" /></div>
									<h6>나의 서비스</h6>			
								</div></a>
							</div>
						</div>
					</div>
					
				</div>
				
			</div>
			<div class="scontainer3 width-75per" style="float:left;padding-bottom : 78px;">
				<div class="row">
					<div class="padding-15" style="width:66.66667%; float:left">
						<h3 class="font-noto" style="font-weight:700;margin-top:5px;">수익관리</h3>
					</div>
					<div class="padding-15" style="width:33.33333%; float:left; text-align:right;">
						<a href="" class="ad-request">
							<h5>광고 신청</h5>
						</a>
					</div>
				</div>
				<div class="row">
					<div class="padding-15" style="width:100%">
						<div style="margin-top:10px;margin-bottom:20px;">
							<div class="income-box">
								<div class="row">
									<div class="withdraw-income">
										<div style="width:25%;float:left"><img width=80% src="/semi/resources/images/profits_new_active.png" alt="" /></div>
										<div style="width:75%;padding-right:15px;float:left">
											<h5 class="font-noto" style="margin-top:5px;margin-bottom:10px">출금가능 수익금</h5>
											<%if(ic!=null){ %>
											<h2 class="font-noto" style="margin:0;margin-bottom:10px"><%=beforeincome%>원</h2>
											<%}else{ %>
											<h2 class="font-noto" style="margin:0;margin-bottom:10px">0원</h2>
											<%} %>
										</div>
									</div>
									<div class="predict-income padding-15">
										<h6 class="margin-10">전체 수익금</h6>
										<%if(ic!=null){ %>
										<h5 class="margin-10" style="margin-bottom:10px"><%=allincome %>원</h5>
										<%}else{ %>
										<h5 class="margin-10" style="margin-bottom:10px">0원</h5>
										<%} %>
										
									</div>
									<div class="predict-income padding-15" style="border-right:none;">
										<h6 class="margin-10">출금 완료 수익금</h6>
										<%if(ic!=null){ %>
										<h5 class="margin-10" style="margin-bottom:10px"><%=afterincome %>원</h5>
										<%}else{ %>
										<h5 class="margin-10" style="margin-bottom:10px">0원</h5>
										<%} %>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="padding-15" style="text-align:right;width:100%">
						<a href="javascript:void(0);" class="plain NGB" id="monthly" onclick="getProfitsMChart()">월별</a> &nbsp;
						<a href="javascript:void(0);" class="plain" id="daily" onclick="getProfitsDChart()">일별</a>		
					</div>
					<div class="income-chart" style="width:100%;float:right">
						<div class="padding-15">
							<canvas id="myChart" width=600px></canvas>
							<script>
								new Chart(document.getElementById("myChart"),{
									"type":"line"
									,"data":{"labels":["2018-06","2018-07","2018-08","2018-09","2018-10","2018-11","2018-12","2019-01","2019-02","2019-03","2019-04","2019-05","2019-06"]
									,"datasets":[{"label":"My First Dataset","data":[65,59,80,81,56,55,40,56,30,70,65,80,81]
									,"fill":false
									,"borderColor":"rgb(75, 192, 192)","lineTension":0.1}]}
									,"options":{}});
					
							</script>
						</div>
					</div>
					<script>
						function getProfitsMChart(){
							$("#monthly").addClass('NGB');
							$("#daily").removeClass();
							new Chart(document.getElementById("myChart"),{
								"type":"line"
								,"data":{"labels":["2018-06","2018-07","2018-08","2018-09","2018-10","2018-11","2018-12","2019-01","2019-02","2019-03","2019-04","2019-05","2019-06"]
								,"datasets":[{"label":"My First Dataset","data":[65,59,80,81,56,55,40,56,30,70,65,80,81]
								,"fill":false
								,"borderColor":"rgb(75, 192, 192)","lineTension":0.1}]}
								,"options":{}});
						}
						function getProfitsDChart(){
							$("#daily").addClass('NGB');
							$("#monthly").removeClass('NGB');
							new Chart(document.getElementById("myChart"),{
								"type":"line"
								,"data":{"labels":["06-01","06-02","06-03","06-04","06-05","06-06","06-07","06-08","06-09","06-10","06-11","06-12","06-13","06-14","06-15",
									"06-16","06-17","06-18","06-19","06-20","06-21","06-22","06-23","06-24","06-25","06-26","06-27","06-28","06-29","06-30"]
								,"datasets":[{"label":"My First Dataset","data":[65,59,80,81,56,55,40,56,30,70,65,80,81,59,80,81,56,55,40,56,30,70,65,80,59,80,81,56,55,40]
								,"fill":false
								,"borderColor":"rgb(75, 192, 192)","lineTension":0.1}]}
								,"options":{}});
						}
					</script>
				</div>
				<div style="margin-top:20px">
					<div class="padding-15">
						<ul class="sell-ing">
							<li>
								<h3>수익금 내역</h3>
							</li>
						</ul>
					</div>
				</div>
				<div style="margin-top:10px">
					<div class="padding-15 font-noto" style="height:35px;">
						<div style="width:50%;float:left">
							<div id="change" class="ui compact selection dropdown" style="width:85px">
						  <i class="dropdown icon"></i>
						  <div class="text">전체</div>
						  <div class="menu">
						   	  <div class="item">전체</div>
						      <div class="item">수익</div>
						      <div class="item">출금</div>
						  </div>
						</div>
						</div>
					<script>
            			$('#change').dropdown({
            				onChange: function(text){
            					if(text=="수익"){
            						console.log("수익");
            					} else if(text=="전체"){
            						console.log("전체");
            					} else if(text=="출금"){
            						console.log("출금");
            					}
            				}
            			});
        			</script>
        			<%if(s!=null){ %>
        			<div style="text-align:right;width:50%;float:left"><button class="ui teal button" onclick="withdrawbtn()">출금신청</button></div>
        			<%} %>
        			<div id="withdraw"class="ui modal" style="width:500px">
					  <div class="header font-noto">출금 신청</div>
					  <div class="image content">
					    <img class="image">
					    
					    	<div style="width:100%">
					    		<div class="description font-noto" style="text-align:left;width:100%">
						      		<div class="ui input focus" style="height:30px">
									 	<h4 style="margin-top: 4px;margin-right: 10px;">출금 할 금액 : </h4>
									 	<%if(s!=null){ %>
									 	<input type="text" id="wdMoney" name="withdraw" placeholder="<%=ic.getBeforeincome()%>"/><h4 style="margin-top: 5px;margin-left: 5px;">원</h4>
										<%}else{ %>
										<input type="text" id="wdMoney" name="withdraw" placeholder="0"/><h4 style="margin-top: 5px;margin-left: 5px;">원</h4>
										<%} %>
									</div>
					      		</div>
					      		
					      		<div class="font-noto" style="text-align:right;width:100%; margin-top:10px">
					      			<button class="ui grey button" onclick="cancel()">취소</button>
					      			<button class="ui teal button" onclick="withdraw()">출금</button>
					      		</div>
							</div>
					   
					  </div>
					</div>
					<script>
					function withdrawbtn(){
						$('#withdraw')
						  .modal('show')
						;
					}
					<%if(s!=null){%>
					var income = <%=ic.getBeforeincome()%>;
					<%}else{%>
					var income = 0;
					<%}%>
					var money = $('#wdMoney').val();
					function withdraw(){
						if(money>income){
							alert("금액이 부족합니다.");
						}else{
							location.href = '/semi/withdraw.ic?wdMoney='+$('#wdMoney').val();
						}
					}
					
					</script>
					</div>
				</div>
				<div>
					<div class="padding-15" style="margin-top:10px">
						
						<div class="detail-box">
							<div class="detail-list" style = "padding : 0;">
								<%if(list!=null){ %>
								<div id="all">
									<%for(Income i : list){ %>
									<div class="mySlist"  style="margin:0;padding: 20px 0" >
										<div style="width:25%; "><h5><%=i.getRownum()%></h5></div>
										<div style="width:25%; "><div><h5><%=i.getIcmoney() %>원</h5></div></div>
										<div style="width:25%; "><div><h5><%=i.getIchistory()%></h5></div></div>
										<div style="width:25%;"><h5><%=i.getIcdate() %></h5></div>
									</div>
									<%} %>
								</div>
								<div id="after" style="display:none">
									<%for(Income i : list){ %>
										<%if(i.getIchistory().equals("출금")){ %>
											<div class="mySlist" id="after" style="margin:0;padding: 20px 0" >
												<div style="width:25%; "><h5><%=i.getRownum()%></h5></div>
												<div style="width:25%; "><div><h5><%=i.getIcmoney() %>원</h5></div></div>
												<div style="width:25%; "><div><h5><%=i.getIchistory()%></h5></div></div>
												<div style="width:25%;"><h5><%=i.getIcdate() %></h5></div>
											</div>
										<%} %>
									<%} %>
								</div>
								<div id="before" style="display:none">
									<%for(Income i : list){ %>
										<%if(i.getIchistory().equals("수익")){ %>
											<div class="mySlist" id="before" style="margin:0;padding: 20px 0" >
												<div style="width:25%; "><h5><%=i.getRownum()%></h5></div>
												<div style="width:25%; "><div><h5><%=i.getIcmoney() %>원</h5></div></div>
												<div style="width:25%; "><div><h5><%=i.getIchistory()%></h5></div></div>
												<div style="width:25%;"><h5><%=i.getIcdate() %></h5></div>
											</div>
										<%} %>
									<%} %>
								</div>
								<%}else{ %>
									<div style="margin-top:130px"><img src="/semi/resources/images/nothing.png" style="width:50px;vertical-align: middle;border:0" /></div>
									<h5 style="margin-bottom:129px;margin-top: 10px;" class="font-noto">내역이 없습니다.</h5>
								<%} %>
								<script>
									$('#change').dropdown({
			            				onChange: function(text){
			            					if(text=="수익"){
			            						$('#all').css("display","none");
			            						$('#after').css("display","none");
			            						$('#before').css("display","block");		
			            					} else if(text=="전체"){
			            						$('#all').css("display","block");
			            						$('#after').css("display","none");
			            						$('#before').css("display","none");		
			            					} else if(text=="출금"){
			            						$('#all').css("display","none");
			            						$('#after').css("display","block");
			            						$('#before').css("display","none");		
			            					}
			            				}
			            			});
								</script>						
							</div>
						</div>
					</div>
				</div>	
				
			</div>
		</div>
	</div>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>