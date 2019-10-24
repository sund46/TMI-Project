<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sellerboard.model.vo.*, java.util.*" %>
<%
	ArrayList<SellerBoard> list = (ArrayList<SellerBoard>)request.getAttribute("list");
	Talent t = (Talent)request.getAttribute("talent");
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
<title><%=t.getTalent1() %> 카테고리 페이지</title>
<style>
*{
	font-family: 'Noto Sans KR', sans-serif;
}
.section1{
	margin:0 auto;
}
.section2{
	width : 1200px;
	margin:0 auto;
}
.sbody{
	width : 1200px;
	margin:0 auto;
	position: relative;
	z-index: 1;
	
}
.sbody>div{
	display:inline-block;
	float:left;
}
.cb1{
	margin-top: 50px; 
	padding-left:40px;
	padding-right:10px;
		
}
.cb2{
    margin-top: 40px; 
    padding: 0 5px;
}
.cb3{
	text-align:right;
	margin-top: 50px;
	z-index:0;
}

.scontent{
	margin:0 auto;
	background:transparent;
	
}
.left-menu{
	width:18%;
}
.post{

	width:84%;
	margin:0 auto;
	padding: 0 15px;
	display:inline-block;
}
.posting{

	padding:0 20px;
	margin-bottom: 20px;
	
}
.post-row{

position: relative;
z-index: 2;
}

.posting>div{
	display:inline-block;
	box-shadow: 5px 5px 10px 0 #E6E6E6;
	margin-right: 20px;
}
.paging .hide {display:block;height:0;width:0;font-size:0;line-height:0;margin:0;padding:0;overflow:hidden;}

.paging{padding:19px;text-align:center;margin-left:150px;}

.paging a{display:inline-block;width:23px;height:23px;padding-top:2px;vertical-align:middle;}

.paging a:hover{text-decoration:underline;}

.paging .btn_arr{text-decoration:none;}

.paging .btn_arr, .paging .on{margin:0 3px;padding-top:0;border:1px solid #ddd; border-radius:30px;

/* background:url(/front/img/com/btn_paging.png) no-repeat; */}

.paging .on{padding-top:1px;height:22px;color:#fff;font-weight:bold;background:rgb(54, 69, 89);}

.paging .on:hover{text-decoration:none;}

.ani{
	width:210px;
	cursor:pointer;
	transition:0.25s;
}
.ani:hover{
	transform: scale(1.05);
}



</style>

</head>
<body>
<%@include file= "/views/common/faq.jsp"%>
<%@include file= "/views/common/cateheader1.jsp"%>

<div class="section1">

	<div class="section2">
			<div class="sbody">
				<div class="cb1" style="width:18%" >
					<h1 style="font-size:25px;"><%=t.getTalent1() %></h1>		
				</div>
			
				<div class="cb2" style="width:50%;"> 
					<%if(m!=null){ %>
						<h3 style="font-size:15px;display:inline-block;"><a href="/semi/mainheader2.jsp">홈 ></a></h3>
					<%}else{ %>
						<h3 style="font-size:15px;display:inline-block;"><a href="/semi/index.jsp">홈 ></a></h3>
					<%} %>
					<h3 style="font-size:15px;display:inline-block;"><a href="/semi/selectList.bo?cate=contentCategoryPage"><%=t.getTalent1() %></a></h3>	
					
					<%if(t.getTalent2()!=null){ %>
						<h3 style="font-size:15px;display:inline-block;"><a href="/semi/selectList.bo?cate=contentCategoryPage">> <%=t.getTalent2() %></a></h3>	
					<%} %>
				</div>

				<div class="cb3" style="width:31%;padding:0 20px;">
					<div class="ui compact selection dropdown" style="width:110px; height:2px;margin-right:38px;">
						  <i class="dropdown icon"></i>
						  <div class="text">추천순</div>
						  <div class="menu transition hidden" >
						   	  <div class="item">추천순</div>
						      <div class="item">랭킹순</div>
						      <div class="item">신규등록순</div>
						  </div>
					</div>
						<script>
		            			$('.ui.dropdown').dropdown();
		        		</script>
				</div>
			</div>
			
			<div class="scontent">
				<div class="left-menu">
					<div class="accordion" style="padding:10px 30px;">
					<div class="ui vertical accordion menu" style="float:left; width:160px;font-family: 'Noto Sans KR', sans-serif;">
					  <div class="item">
					    <%if(t.getTalent1().equals("디자인")){ %>
					    	<a class="active title">
					    <%}else{%>
					    	<a class="title">
					    <%} %>
					      <i class="dropdown icon"></i>
					      	<b>디자인</b>
					    </a>
					    <%if(t.getTalent1().equals("디자인")){ %>
					    	<div class="active content">
					    <%}else{%>
					    	<div class="content">
					    <%} %>
					      <div class="ui form">
					        <div class="grouped fields">
					          <div class="field">
					            <div class="ui radio checkbox">
					              <a href="/semi/selectList.bo?cCode=10&code=11">로고디자인</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					               <a href="/semi/selectList.bo?cCode=10&code=12">의류디자인</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="/semi/selectList.bo?cCode=10&code=13"> 간판디자인</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="/semi/selectList.bo?cCode=10&code=14">일러스트</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="/semi/selectList.bo?cCode=10&code=15">웹툰</a>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
					 
					 <div class="item">
					    <%if(t.getTalent1().equals("IT/프로그래밍")){ %>
					    	<a class="active title">
					    <%}else{%>
					    	<a class="title">
					    <%} %>
					      <i class="dropdown icon"></i>
					      	<b>IT/프로그래밍</b>
					    </a>
					    <%if(t.getTalent1().equals("IT/프로그래밍")){ %>
					    	<div class="active content">
					    <%}else{%>
					    	<div class="content">
					    <%} %>
					      <div class="ui form">
					        <div class="grouped fields">
					          <div class="field">
					            <div class="ui radio checkbox">
					              <a href="/semi/selectList.bo?cCode=20&code=21">웹사이트 개발</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					               <a href="/semi/selectList.bo?cCode=20&code=22">프로그램 개발</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="/semi/selectList.bo?cCode=20&code=23">서버 및 기술지원</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="/semi/selectList.bo?cCode=20&code=24">게임</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="/semi/selectList.bo?cCode=20&code=25">모바일앱/웹</a>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="item">
					    <%if(t.getTalent1().equals("마케팅")){ %>
					    	<a class="active title">
					    <%}else{%>
					    	<a class="title">
					    <%} %>
					      <i class="dropdown icon"></i>
					      	<b>마케팅</b>
					    </a>
					    <%if(t.getTalent1().equals("마케팅")){ %>
					    	<div class="active content">
					    <%}else{%>
					    	<div class="content">
					    <%} %>
					      <div class="ui form">
					        <div class="grouped fields">
					          <div class="field">
					            <div class="ui radio checkbox">
					              <a href="/semi/selectList.bo?cCode=30&code=31">sns마케팅</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					               <a href="/semi/selectList.bo?cCode=30&code=32">종합광고대행</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="/semi/selectList.bo?cCode=30&code=33">블로그</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="/semi/selectList.bo?cCode=30&code=34">마케팅 노하우</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="/semi/selectList.bo?cCode=30&code=35">유튜브 크리에이터</a>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="item">
					    <%if(t.getTalent1().equals("콘텐츠제작")){ %>
					    	<a class="active title">
					    <%}else{%>
					    	<a class="title">
					    <%} %>
					      <i class="dropdown icon"></i>
					      	<b>콘텐츠제작</b>
					    </a>
					    <%if(t.getTalent1().equals("콘텐츠제작")){ %>
					    	<div class="active content">
					    <%}else{%>
					    	<div class="content">
					    <%} %>
					      <div class="ui form">
					        <div class="grouped fields">
					          <div class="field">
					            <div class="ui radio checkbox">
					              <a href="/semi/selectList.bo?cCode=40&code=41">영상</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					               <a href="/semi/selectList.bo?cCode=40&code=42">더빙/녹음</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="/semi/selectList.bo?cCode=40&code=43">음악/사운드</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="/semi/selectList.bo?cCode=40&code=44">엔터테이너</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="/semi/selectList.bo?cCode=40&code=45">사진</a>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="item">
					    <%if(t.getTalent1().equals("번역/통역")){ %>
					    	<a class="active title">
					    <%}else{%>
					    	<a class="title">
					    <%} %>
					      <i class="dropdown icon"></i>
					      	<b>번역/통역</b>
					    </a>
					    <%if(t.getTalent1().equals("번역/통역")){ %>
					    	<div class="active content">
					    <%}else{%>
					    	<div class="content">
					    <%} %>
					      <div class="ui form">
					        <div class="grouped fields">
					          <div class="field">
					            <div class="ui radio checkbox">
					              <a href="/semi/selectList.bo?cCode=50&code=51">번역</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					               <a href="/semi/selectList.bo?cCode=50&code=52">영상번역</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="/semi/selectList.bo?cCode=50&code=53">통역</a>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="item">
					    <%if(t.getTalent1().equals("문서/취업")){ %>
					    	<a class="active title">
					    <%}else{%>
					    	<a class="title">
					    <%} %>
					      <i class="dropdown icon"></i>
					      	<b>문서/취업</b>
					    </a>
					    <%if(t.getTalent1().equals("문서/취업")){ %>
					    	<div class="active content">
					    <%}else{%>
					    	<div class="content">
					    <%} %>
					      <div class="ui form">
					        <div class="grouped fields">
					          <div class="field">
					            <div class="ui radio checkbox">
					              <a href="/semi/selectList.bo?cCode=60&code=61">논문</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					               <a href="/semi/selectList.bo?cCode=60&code=62">타이핑</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="/semi/selectList.bo?cCode=60&code=63">글작성/대본</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="/semi/selectList.bo?cCode=60&code=64">면접/취업코딩</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="/semi/selectList.bo?cCode=60&code=65">자소서/이력서</a>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="item">
					    <%if(t.getTalent1().equals("기프트/커스텀")){ %>
					    	<a class="active title">
					    <%}else{%>
					    	<a class="title">
					    <%} %>
					      <i class="dropdown icon"></i>
					      	<b>기프트/커스텀</b>
					    </a>
					    <%if(t.getTalent1().equals("기프트/커스텀")){ %>
					    	<div class="active content">
					    <%}else{%>
					    	<div class="content">
					    <%} %>
					      <div class="ui form">
					        <div class="grouped fields">
					          <div class="field">
					            <div class="ui radio checkbox">
					              <a href="/semi/selectList.bo?cCode=70&code=71">라이프</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					               <a href="/semi/selectList.bo?cCode=70&code=72">패션</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="/semi/selectList.bo?cCode=70&code=73">푸드</a>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
					 </div>						
						  <script>
						  $('.ui.accordion')
						  .accordion();
						  </script>
				</div>
				</div>
				
				<div class="post">
					<%for(int i = 0; i<3;i++){ %>
						<div class="post-row" style="z-index:0">
						<div class="posting">
						<%for(int j=(4*i);j<(4*(i+1));j++){
							if(j>=list.size()) break;
							SellerBoard b = list.get(j);
							String price = dc.format(b.getPrice());
							
							
							%>
						
						 <div class="ani">
						 	<div class="ui card" style="margin:0;height:331px;overflow:hidden;">
							  <div class="image" style="height:170px;" onclick='location.href="/semi/listDetail.bo?bno=<%= b.getBno()%>"'>
							    <img src="/semi/resources/selleruploadIMG/<%=b.getImages() %>" style="height:170px;">
							  </div>
							  <div class="content" style="height:120px;" onclick='location.href="/semi/listDetail.bo?bno=<%= b.getBno()%>"'>
							    
							    <div class="meta">
							      <span class="date"><%=b.getNickName() %></span>
							    </div>
							    <div class="description" style="width:182px;height:50px;margin-bottom:5px;overflow:hidden;text-overflow: ellipsis; ">
								   <p style="width:182px;height:50px;overflow:hidden;text-overflow: ellipsis; white-space: nowrap;"><%= b.getBtitle() %></p>    
							    </div>
							    <a class="header" style="float:right"><%=price %>원</a>
							  </div>
							  <div class="extra content">
							    <a>
							      <i class="ui" style="height:33px;"></i>
							      <div class="ui heart rating" data-rating="1" data-max-rating="1"></div>
							      <div class="ui star rating" data-rating="5" style="float:right;"></div>
							    </a>
							  </div>
							</div>
							<script>
							$('.special.cards .image').dimmer({
								  on: 'hover'
								});
							$('.ui.rating')
							  .rating({
							    initialRating: 3,
							    maxRating: 5
							  })
							;
							</script>
						 </div>
						
						<%} %>
						</div>
					</div>
					<%} %>
				</div>
				
				<div class="paging">
 
				  <a href="<%=request.getContextPath()%>/selectList.bo?currentPage=1&cCode=<%=t.getTalent1code()%>&code=<%=t.getTalent2code() %>" class="btn_arr first"><span class="hide">처음페이지</span></a>
				  <%if(currentPage<=1){ %>
				  	<a class="btn_arr prev"><span class="hide">이전페이지</span></a>  
				  <%} else{ %>          
				  	<a href="<%= request.getContextPath() %>/selectList.bo?currentPage=<%=currentPage - 1 %>&cCode=<%=t.getTalent1code()%>&code=<%=t.getTalent2code() %>" class="btn_arr prev"><span class="hide">이전페이지</span></a>  
				  <%} %>   
				  <%for(int p = startPage; p <= endPage; p++){
						if(p==currentPage){  
					%>
				  	<a class="on"><%= p %></a>
				  	<%}else{ %>
				  	<a href="<%=request.getContextPath()%>/selectList.bo?currentPage=<%=p%>&cCode=<%=t.getTalent1code()%>&code=<%=t.getTalent2code() %>"><%=p%></a>
				  	<%}
				  	}	
				  	%>
				  <%if(currentPage>=maxPage){ %>
				  	<a class="btn_arr next"><span class="hide">다음페이지</span></a>
				  <%}else{ %>
				 	<a href="<%= request.getContextPath() %>/selectList.bo?currentPage=<%=currentPage + 1 %>&cCode=<%=t.getTalent1code()%>&code=<%=t.getTalent2code() %>" class="btn_arr next"><span class="hide">다음페이지</span></a> 
				  <%} %>           
				  <a href="<%=request.getContextPath()%>/selectList.bo?currentPage=<%=maxPage %>&cCode=<%=t.getTalent1code()%>&code=<%=t.getTalent2code() %>" class="btn_arr last"><span class="hide">마지막페이지</span></a>
				             
				</div>
			</div>			
		</div>
	</div>
		


<%@include file= "/views/common/footer.jsp"%>
</body>
</html>