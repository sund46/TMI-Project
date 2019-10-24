<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="member.model.vo.ClientRequest" %>
<%@ page import="message.model.vo.PageInfo" %>
<%
	ArrayList<ClientRequest> requestList = (ArrayList<ClientRequest>)request.getAttribute("requestList"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();    
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
<title>메세지</title>

<style>
*{
font-family: 'Noto Sans KR', sans-serif;
}
.section1{
	margin: 0 auto;
}
.section2{
	margin: 0 auto;
	width: 1170px;
	
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
	width:22%;
	margin:0 auto;
	float : left;
}
.mp2{
	width:78%;
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
	
.paging .hide {display:block;height:0;width:0;font-size:0;line-height:0;margin:0;padding:0;overflow:hidden;}

.paging{margin-top:20px;padding-right:22px;text-align:center;}

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
<%@ include file="../common/cateheader2.jsp" %>

<div class="section1">
	<div class="section2">
	
		<div class="section3" style="font-family: 'Noto Sans KR', sans-serif;">
			<h2>메세지</h2>
		</div>
		
			<div class="section4">
				<div class="mp1">
					<div style="margin : 22px 0px 0px 22px;">
						<h3>구매 / 판매 메세지</h3>
						<a href="/semi/messageList"><h3>1:1 문의 답변</h3></a>
					</div>
				
						
				</div>
		 
				
			<div class="mp2">
				<h2 style="margin-left:5%;">1:1문의 답변</h2>
				<table class="ui blue table" style="width:85%; margin-left:5%;">
				  <thead>
				    <tr><th>No</th>
				    <th style="width:50%; margin-right: 5%;">제목</th>
				    <th>보낸이</th>
				  </tr>
				  </thead>
				  
				  <tbody>
				   	<%
				   	int num = 1;
				   	for(ClientRequest cr : requestList){
				   		if(cr.getReplyTitle()!=null){
				   		%>
				   	  <tr>
				   	  	<input type="hidden" value="<%=cr.getReplyContent()%>">
				   	  	<td><%=num %></td>	
				   	  	<td><span class="detailSpans" style="cursor:pointer;" onclick="replyDetail();"><%=cr.getReplyTitle()%></span></td>
				   	  	<td>관리자
				   	  			<!-- Modal -->
								<div class="ui modal" id="replyDetailModal<%=num%>">
								  <div class="header">제목 : <%=cr.getReplyTitle()%></div>
								  <div class="content">
								    <p><%=cr.getReplyContent()%></p>
								    
								  </div>
								</div>
				   	  	</td>
				   	  	
				   	  </tr>
					  <% } %>
				   	<% num++; } %>

				  </tbody>
				</table>

			<div class="paging">
 
				  <a href="<%=request.getContextPath()%>/selectList.bo?currentPage=1" class="btn_arr first"><span class="hide">처음페이지</span></a>
				  <%if(currentPage<=1){ %>
				  	<a class="btn_arr prev"><span class="hide">이전페이지</span></a>  
				  <%} else{ %>          
				  	<a href="<%= request.getContextPath() %>/selectList.bo?currentPage=<%=currentPage - 1 %>" class="btn_arr prev"><span class="hide">이전페이지</span></a>  
				  <%} %>   
				  <%for(int p = startPage; p <= endPage; p++){
						if(p==currentPage){  
					%>
				  	<a class="on"><%= p %></a>
				  	<%}else{ %>
				  	<a href="<%=request.getContextPath()%>/selectList.bo?currentPage=<%=p%>"><%=p%></a>
				  	<%}
				  	}	
				  	%>
				  <%if(currentPage>=maxPage){ %>
				  	<a class="btn_arr next"><span class="hide">다음페이지</span></a>
				  <%}else{ %>
				 	<a href="<%= request.getContextPath() %>/selectList.bo?currentPage=<%=currentPage + 1 %>" class="btn_arr next"><span class="hide">다음페이지</span></a> 
				  <%} %>           
				  <a href="<%=request.getContextPath()%>/selectList.bo?currentPage=<%=maxPage %>" class="btn_arr last"><span class="hide">마지막페이지</span></a>
				             
				</div>
			
				
			</div>
		
			
			
		</div>
	</div>
</div>

 <%@ include file="../common/footer.jsp" %>
</body>
<script>
	$('.detailSpans').each(function(){
		$(this).click(function(){
			var num = $(this).parent().parent().find('td').eq(0).text();
			var modalId = "#replyDetailModal"+num;
			$(modalId).modal('show');
		});
		
	});


</script>



</html>