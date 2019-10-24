<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "buyingctrl.model.vo.*,java.util.*" %>
<%
	ArrayList<DealMng> list = (ArrayList<DealMng>)request.getAttribute("list");  
	int s1 = 0;
	int s2 = 0;
	int s3 = 0;

	for(DealMng d : list){
		switch(d.getProgress()){
			case "진행중" : s1+=1; break;
			case "완료" : s2+=1; break;
			case "취소" : s3+=1; break;
 		}
	}
	
	


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<title>판매관리</title>
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
		border-top: solid #E6E6E6 1px !important;
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
	.paging .hide {display:block;height:0;width:0;font-size:0;line-height:0;margin:0;padding:0;overflow:hidden;}

	.paging{padding:19px;text-align:center;}
	
	.paging a{display:inline-block;width:23px;height:23px;padding-top:2px;vertical-align:middle;}
	
	.paging a:hover{text-decoration:underline;}
	
	.paging .btn_arr{text-decoration:none;}
	
	.paging .btn_arr, .paging .on{margin:0 3px;padding-top:0;border:1px solid #ddd; border-radius:30px;
	
	/* background:url(/front/img/com/btn_paging.png) no-repeat; */}
	
	.paging .on{padding-top:1px;height:22px;color:#fff;font-weight:bold;background:rgb(54, 69, 89);}
	
	.paging .on:hover{text-decoration:none;}
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
								<a href="/semi/dSelect.do"><div class="padding-all-15 menu-slot" style="border-right:solid #E6E6E6 1px;">							
									<div><img src="/semi/resources/images/selling_active.png" alt="" /></div>
									<h6>판매관리</h6>							
								</div></a>
								<a href="/semi/list.ic"><div class="padding-all-15 menu-slot">
									<div><img src="/semi/resources/images/profits_new_active.png" alt="" /></div>
									<h6>수익관리</h6>			
								</div></a>
							</div>
							<div class="menu-line" style="text-align:center;border-bottom:solid #E6E6E6 1px;">
								<a href="/semi/views/myPage/myPageManageAd.jsp"><div class="padding-all-15 menu-slot active" style="border-right:solid #E6E6E6 1px;">							
									<div><img src="/semi/resources/images/advertisement_active.png" alt="" /></div>
									<h6>광고관리</h6>							
								</div></a>
								<a href="/semi/myboard.bo"><div class="padding-all-15 menu-slot">
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
					<h3 class="font-noto" style="font-weight:700">판매관리</h3>
				</div>
				<div style="margin-top:20px">
					<div class="padding-15">
						<ul class="sell-ing">
							<li>
								<a style="color:#000" href="/semi/dSelect.do">전체 &nbsp; <span class="selling-history"><%=list.size() %></span></a>
							</li>
							<li>
								<a href="/semi/dSelect.do?state=s1">진행중 &nbsp; <span class="selling-history"><%=s1 %></span></a>
							</li>
							<li>
								<a href="/semi/dSelect.do?state=s2">완료 &nbsp; <span class="selling-history"><%=s2 %></span></a>
							</li>
							<li>
								<a href="/semi/dSelect.do?state=s3">취소 &nbsp; <span class="selling-history select"><%=s3 %></span></a>
							</li>
						</ul>
					</div>
				</div>
				<div style="margin-top:20px">
					<div class="padding-15 font-noto">
						<div class="ui right action left icon input">
					  <i class="search icon"></i>
					  <input type="text" placeholder="검색">
					  <div class="ui basic floating dropdown button">
					    <div class="text font-noto">닉네임</div>
					    <i class="dropdown icon"></i>
					    <div class="menu">
					      <div class="item font-noto">닉네임</div>
					      <div class="item font-noto">주문번호</div>
					      <div class="item font-noto">이름</div>
					      <div class="item font-noto">전화번호</div>
					      <div class="item font-noto">이메일</div>
					    </div>
					  </div>
					</div>
					<script>
            			$('.ui.dropdown').dropdown();
        			</script>
					</div>
				</div>
				<div>
					<div class="padding-15" style="margin-top:10px">
						<div class="detail-box">
							<%if(list != null){ int count = -1;%>
							<div class="detail-list" style="padding:0">
								<div class="comment" style="overflow:hidden;background:#f9fafb;padding:5px 0;">
									<div style="width:20%; display:inline-block; float:left;"><h5>사진</h5></div>
									<div style="width:45%; display:inline-block;float:left;"><h5>제목</h5></div>
									<div style="width:10%; display:inline-block;float:left;"><h5>닉네임</h5></div>
									<div style="width:15%; display:inline-block;float:left;"><h5>가격</h5></div>
									<div style="width:10%; border-right:none; display:inline-block;float:left;"><h5>상태</h5></div>
								</div>
								<%for(DealMng d : list){%>
								<%if(d.getProgress().equals("취소")){ count++;%>
								<%
								 String price = dc.format(d.getPrice()); 
								%>
									<div class="mySlist" style="margin:0;padding: 20px 0">
									<div style="width:20%; "><img width=100px src="/semi/resources/selleruploadIMG/<%=d.getImages()%>" alt="" /></div>
									<div style="width:45%; height:78px;"><div style="text-overflow: ellipsis; overflow:hidden;margin:30px 0"><a href="/semi/listDetail.bo?bno=<%= d.getBno()%>"><h5 style="text-align:left; padding:0 10px; margin:0 20px;overflow:hidden;text-overflow: ellipsis; white-space: nowrap;"><%=d.getBtitle() %></h5></a></div></div>
									<div style="width:10%; "><div style="margin:30px 0"><h5><%=d.getNickname() %></h5></div></div>
									<div style="width:15%; "><div style="margin:30px 0"><h5><%=price %>원</h5></div></div>
									<div style="width:10%; border-right:none;"><div style="margin:30px 0">
										<select onchange="if(this.value) location.href=(this.value);" name="" id="" style="border-radius:5px;font-size:13px;">
											<%if(d.getProgress().equals("진행중")){ %>
												<option value="/semi/uProgress.do?progress=진행중&dmcode=<%=d.getDmcode()%>&state=s1">진행중</option>
												<option value="/semi/uProgress.do?progress=완료&dmcode=<%=d.getDmcode()%>&state=s1">완료</option>
												<option value="/semi/uProgress.do?progress=취소&dmcode=<%=d.getDmcode()%>&state=s1">취소</option>
											<%} else if(d.getProgress().equals("완료")){%>
												<option value="/semi/uProgress.do?progress=완료&dmcode=<%=d.getDmcode()%>&state=s1">완료</option>
												<option value="/semi/uProgress.do?progress=진행중&dmcode=<%=d.getDmcode()%>&state=s1">진행중</option>
												<option value="/semi/uProgress.do?progress=취소&dmcode=<%=d.getDmcode()%>&state=s1">취소</option>
											<%} else if(d.getProgress().equals("취소")){%>
												<option value="/semi/uProgress.do?progress=취소&dmcode=<%=d.getDmcode()%>&state=s1">취소</option>
												<option value="/semi/uProgress.do?progress=진행중&dmcode=<%=d.getDmcode()%>&state=s1">진행중</option>
												<option value="/semi/uProgress.do?progress=완료&dmcode=<%=d.getDmcode()%>&state=s1">완료</option>
											<%} %>
										</select>
									</div></div>
								</div>

								<%} if(count<0){%>
									<div style="margin-top:129px;"><img src="/semi/resources/images/nothing.png" style="width:50px;vertical-align: middle;border:0" /></div>
									<h5 class="font-noto" style="margin:10px 0;margin-bottom:130px;">내역이 없습니다.</h5>
								<%} %>
								<%} %>
							</div>
						<%}else{ %>
							<div class="detail-list">
								<div><img src="/semi/resources/images/nothing.png" style="width:50px;vertical-align: middle;border:0" /></div>
								<h5 class="font-noto" style="margin:10px 0;">내역이 없습니다.</h5>
							</div>
							<%} %>
						</div>
						<% if(list != null){ int count = -1;%>
						<% for(DealMng d : list){if(d.getProgress().equals("취소")){ count++;}}%>
						<% if(count>-1){ %>
							<div class="paging">
		 
						  	<a href="" class="btn_arr first"><span class="hide">처음페이지</span></a>
						  
						  	<a class="btn_arr prev"><span class="hide">이전페이지</span></a>  
						    
						  	<a href="" class="btn_arr prev"><span class="hide">이전페이지</span></a>  
						  
						 
						  	<a class="on">1</a>
						  	
						  	<a href="">2</a>
						  	<a href="">3</a>
						  	<a href="">4</a>
						  	<a href="">5</a>
						  
						 
						  	<a class="btn_arr next"><span class="hide">다음페이지</span></a>
						  
						 	<a href="" class="btn_arr next"><span class="hide">다음페이지</span></a> 
						 
						  	<a href="" class="btn_arr last"><span class="hide">마지막페이지</span></a>
						          
							</div>
						<%} %>							
						<%} %>
					</div>
				</div>	
			</div>
		</div>
	</div>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>