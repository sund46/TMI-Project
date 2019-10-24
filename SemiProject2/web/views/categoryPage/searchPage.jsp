<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="sellerboard.model.vo.*, java.util.*" %>
<%
	ArrayList<SellerBoard> searchedList = (ArrayList<SellerBoard>)request.getAttribute("searchedList");
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

<link rel="stylesheet" href="../dist/css/swiper.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>

<title>검색 페이지</title>

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
.searchbar{
	width : 1200px;
	margin:0 auto;
	/*background: #f3f4f8;*/
	padding-top:70px;
	text-align:center;
	position: relative;
    display: block;
    overflow: hidden;
}
.search_input{
    border: none;
    border-bottom: 4px solid #BDD4F2!important;
    width: 700px;
    text-align: center;
    margin:0 auto;
    margin-bottom: 50px;
}

.search-input1{
 	font-family: 'Noto Sans KR', sans-serif;
    position: relative;
	color: #333;
    font-size: 38px;
    width: 700px;
    padding: 10px 55px;
    text-align: center;
    border: none;
    outline: none;
    background: none;
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
	padding: 0 20px;
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
.paging {
	margin-top: 15px;
	text-align: center;
	font-size: 0;
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
<%@include file= "/views/common/cateheader1.jsp"%>

<div class="section1">
	<div class="section2">
		
			<div class="searchbar">
			<div class='search_input' >
				<input type="hidden" name="type">
                <input type="text" id="searchWord2" maxlength="15" class="search-input1" placeholder="어떤 서비스를 찾고 계신가요?">
               	 <div class="search-btn" style="top: 88px;right: 270px; cursor: pointer; vertical-align: top;">
                   <img class="cursor1" id="clearX"src="/semi/resources/images/x.png" style="width:23px; height: 23px; margin-right:10px;margin-bottom:5px;">
                   <img class="cursor2" src="/semi/resources/images/searching.png" style="width:33px; height: 33px;" onclick="doSearch2();">
               	 </div>
            </div>

		<div class="scontent">
				<div class="left-menu">
					<div class="accordion" style="padding:10px 30px;">
					<div class="ui vertical accordion menu" style="float:left; width:160px;font-family: 'Noto Sans KR', sans-serif;">
					  <div class="item">
					    <a class="active title">
					      <i class="dropdown icon"></i>
					      	<b>디자인</b>
					    </a>
					    <div class="active content">
					      <div class="ui form">
					        <div class="grouped fields">
					          <div class="field">
					            <div class="ui radio checkbox">
					              <a href="">로고디자인</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					               <a href="">의류디자인</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href=""> 간판디자인</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="">일러스트</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="">웹툰</a>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
					 
					 <div class="item">
					    <a class="title">
					      <i class="dropdown icon"></i>
					      	<b>IT/프로그래밍</b>
					    </a>
					    <div class="content">
					      <div class="ui form">
					        <div class="grouped fields">
					          <div class="field">
					            <div class="ui radio checkbox">
					              <a href="">웹사이트 개발</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					               <a href="">프로그램 개발</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="">서버 및 기술지원</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="">게임</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="">모바일앱/웹</a>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="item">
					    <a class="title">
					      <i class="dropdown icon"></i>
					      	<b>마케팅</b>
					    </a>
					    <div class="content">
					      <div class="ui form">
					        <div class="grouped fields">
					          <div class="field">
					            <div class="ui radio checkbox">
					              <a href="">sns마케팅</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					               <a href="">종합광고대행</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="">블로그</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="">마케팅 노하우</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="">유튜브 크리에이터</a>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="item">
					    <a class="title">
					      <i class="dropdown icon"></i>
					      	<b>콘텐츠제작</b>
					    </a>
					    <div class="content">
					      <div class="ui form">
					        <div class="grouped fields">
					          <div class="field">
					            <div class="ui radio checkbox">
					              <a href="">영상</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					               <a href="">더빙/녹음</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="">음악/사운드</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="">엔터테이너</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="">사진</a>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="item">
					    <a class="title">
					      <i class="dropdown icon"></i>
					      	<b>번역/통역</b>
					    </a>
					    <div class="content">
					      <div class="ui form">
					        <div class="grouped fields">
					          <div class="field">
					            <div class="ui radio checkbox">
					              <a href="">번역</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					               <a href="">영상번역</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="">통역</a>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="item">
					    <a class="title">
					      <i class="dropdown icon"></i>
					      	<b>문서/취업</b>
					    </a>
					    <div class="content">
					      <div class="ui form">
					        <div class="grouped fields">
					          <div class="field">
					            <div class="ui radio checkbox">
					              <a href="">논문</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					               <a href="">타이핑</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="">글작성/대본</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="">면접/취업코딩</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="">자소서/이력서</a>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
					  </div>
					  
					  <div class="item">
					    <a class="title">
					      <i class="dropdown icon"></i>
					      	<b>기프트/커스텀</b>
					    </a>
					    <div class="content">
					      <div class="ui form">
					        <div class="grouped fields">
					          <div class="field">
					            <div class="ui radio checkbox">
					              <a href="">라이프</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					               <a href="">패션</a>
					            </div>
					          </div>
					          <div class="field">
					            <div class="ui radio checkbox">
					            <a href="">푸드</a>
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
							if(j>=searchedList.size()) break;
							SellerBoard b = searchedList.get(j);
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
 
				  <a href="#" class="btn_arr first"><span class="hide">처음페이지</span></a>            
				  <a href="#" class="btn_arr prev"><span class="hide">이전페이지</span></a>     
				  <a href="#" class="on">1</a><!-- D : 활성화페이지일 경우 : on 처리 -->
				  <a href="#">2</a>
				  <a href="#">3</a>
				  <a href="#">4</a>
				  <a href="#">5</a>
				  <a href="#" class="btn_arr next"><span class="hide">다음페이지</span></a>            
				  <a href="#" class="btn_arr last"><span class="hide">마지막페이지</span></a>           
				</div>
			</div>	
		
	</div>
</div>







<%@include file= "/views/common/footer.jsp"%>
</body>
<script>

	function doSearch2(){
		var searchWord = $('#searchWord2').val();
		
		location.href = "/semi/searchedList.bo?searchWord="+searchWord;
		
	}
	$('#clearX').click(function(){
		
		$('#searchWord2').val("");
		$('#searchWord2').select();
	});
	



</script>
 



</html>