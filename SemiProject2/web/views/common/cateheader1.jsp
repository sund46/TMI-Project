<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member"%>
<%@ page import="seller.model.vo.Seller"%>
<%@ page import="java.text.DecimalFormat"%>
<% 
	Member m = (Member)session.getAttribute("member");
	Seller s = (Seller)session.getAttribute("seller");
	
%>
<%DecimalFormat dc = new DecimalFormat("###,###,###,###");					  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cateheader1</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="icon" href="/semi/resources/images/pic.jpg"/>
<!-- include summernote css/js -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>


<style>
*{
    margin: 0;
    padding: 0;
}
body{
    min-width: 1200px;
}
div{
    display: block;
}
header{
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 500;
    margin: 0 auto;
    width: 100%;
    height: 129px;
    border-bottom: 2px solid  #BDD4F2;
}
.logo{
    float: left !important;
    left:10px;
}
.logo img{
    margin-top: 3px;
    border: 0;
    vertical-align: middle;
}
.head{
    max-width: 1200px;
    margin: auto;
    line-height: 60px;
    height: 80px;
}
.container{
    width: 1200px;
    height: 80px;
    display: flex;
    align-items: center;
}
.paddinghead{
    padding-left: 10px;
    padding-right: 25px;
    
}
.left-head>div{
    padding: 10px;
    padding-bottom: 20px;
}
.left-head{
    width: 41.66667%;
    /* width: 490px; */
    height: 80px;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    position: relative;
    min-height: 1px;
}
div.head_input{
    position: relative;
    width: 390px;
    height: 84px;
    float: left;
}
.search-input{
    font-family: 'Noto Sans KR', sans-serif;
    position: relative;
    margin-top: 10px;
    width: 370px;
    height: 44px;
    border-radius: 4px;
    background-color: #BDD4F2;
    font-size: 14px;
    text-align: left;
    padding-left: 20px;
    padding-top: 12px;
    padding-bottom: 12px;
    border: none;
    outline: none;
}

.search-btn{
    position: absolute;
    right: 23px;
    cursor: pointer;
    vertical-align: top;
    top: 33px;
}
.width-20px{
    width:20px !important;
}
.width-15px{
    width:15px !important;
}

.right-head{
    width: 58.33333%;
    height: 80px;
}

.flex-center{
    display: flex;
    align-items: center;
    justify-content: flex-end;
}

.info{
    font-size: 14px;
	float:right;
}
.info>div{
    display: inline-block;
}
div a{
    text-decoration: none;
    color: #333;
}
.padding-20px{
    padding: 11px;
}
.padding-15px{
    padding-left : 16px;
    padding-right: 16px;
}

.btn{
    font-size: 13px;
    padding: 6px 10px !important;
    background-color: #BDD4F2;
    border-color: #BDD4F2;
    margin-bottom: 0;
    text-align: center;
    vertical-align: middle;
    touch-action: manipulation;
    background-image: none;
    border: 1px solid transparent;
    white-space: nowrap;
    user-select: none;
    border-radius: 4px !important;
}

nav{
    font-size: 15px;
    max-width: 100%;
    height: 50px;
    margin: 0 auto;
    display: flex;
    justify-content: center;
}
.navsize{
    display: block;
    width: 1200px;
    margin-left: 15px;
    margin-right: 15px;
}
.nav_ul{
    width: 1200px;
    height: 50px;
    text-align: center;
    margin : 0 auto;
}

.nav_ul>li{
	margin-top : 2px;	
    padding-left : 20px;
    padding-right : 20px;
    vertical-align : top;
    display: inline-block;
}

.cate{
	text-align : left;
	margin-top : 3px;
    padding: 10px 16px;
    border: 2px solid transparent;
    border-bottom: none;
    display : inline-block;
    position : relative;

   	top : 3px;
}

.cate a{
    font-size: 16px;
    font-weight: 500;
    color: #333;
}

.downmenu{
	margin-top : 2px;
	width : 150px;
	padding: 10px 18px;
	position: absolute;
	border : 2px solid #BDD4F2;
	border-top : none;
	display : none;
	background : #fff;
	z-index:999;
}

.downmenu li{
	text-align:left;
	padding-top : 7px;
	padding-bottom : 7px;
	list-style:none;
}

.downmenu a{
	font-size : 14px;
}

.talent-category{
	background : #fff;
}
.mylog{
	padding-top:10px;
	padding-bottom:10px;
}
.mylog>a>div{
	display:inline-block;
}
.mylogmenu{
	margin:0 auto;
}
.mylogmenu a>div{
	padding:12px 20px;
	
}
.downmymenu{
	border : 1px solid #BDD4F2; 
	position: absolute;
	background:#fff;
	display : none;
	z-index: 100;
}
.downmymenu:after{
	border-top:0 solid transparent;
	border-left:10px solid transparent;
	border-right: 10px solid transparent;
	border-bottom : 10px solid #fff;
	content:"";
	position:absolute;
	top:-10px;
	left:30px;
}
.downmymenu:before{
	border-top:0 solid transparent;
	border-left:10px solid transparent;
	border-right: 10px solid transparent;
	border-bottom : 10px solid #BDD4F2;
	content:"";
	position:absolute;
	top:-11px;
	left:30px;
}
</style>
</head>
<body>
<div id='wrap'>
        <header>
            <div class='head'>
                <div class="container">
                    <div class="left-head paddinghead">
                        <div class="logo">
                        
                        	<a href="/semi/index.jsp">

                                <img class="logoImg" src="/semi/resources/images/TMI1.png" width=80px>
                            </a>
                        </div>
                        <div class='head_input'>
                             <input type="text" id="searchWord" maxlength="15" class="search-input" placeholder="어떤 서비스를 찾고계신가요?">
                            <div class="search-btn">   
                                <img class="width-20px cursor" src="/semi/resources/images/searching.png" style="vertical-align: inherit" onclick="doSearch();">
                            </div>
                        </div>
                    </div>
                    <div class="right-head paddinghead">
                        <% if(m == null){ %>
                        <div class="info flex-center">
                            <div class="padding-20px"><a href="/semi/views/LoginForm.jsp">판매 시작하기</a></div>
                            <div class="padding-15px"><a href="/semi/views/LoginForm.jsp">로그인</a></div>
                            <div class="padding-15px"><a class="btn" href="/semi/views/member/memberJoin.jsp">무료 회원가입</a></div>
                        </div>
                        <%} else{ %>
                        <div class="info">
                        	<%if(s == null){ %>
                            	<div class="padding-20px"><a href="/semi/views/seller/SellerRegistration.jsp">판매 시작하기</a></div>
                            <%}else{ %>
                            	<div class="padding-20px"><a href="/semi/views/seller/ServiceRegistration.jsp">판매 시작하기</a></div>
                            <%} %>
                            <div class="padding-15px"><a style="cursor:pointer" onclick="buyingctrl();">구매</a></div>
                            <div class="padding-15px"><a href="/semi/messageList">메세지</a></div>
                            <div class="mylog padding-15px"><a href="/semi/views/myPage/myPage.jsp">
                            	<div style="width:30px;height:30px"><img src="/semi/resources/images/myprofile.png" width=30px style="border-radius: 500px !important; vertical-align: middle;"/></div>
                            	<div><h5><%= m.getNickName() %></h5></div>
                            	</a>
                            	<div class="downmymenu">
		                           	<ul class="mylogmenu" style="list-style:none;margin:5px 0; z-index:1000;">
		                           		<li><a href="/semi/views/myPage/myPage.jsp"><div><h5>나의TMI</h5></div></a></li>
		                           		<li><a href="/semi/views/member/memberUpdateForm.jsp"><div><h5>정보수정</h5></div></a></li>
		                           		<li><a href="/semi/logout.do"><div><h5>로그아웃</h5></div></a></li>
		                           	</ul>
                       			</div>
                            </div>
                            <script>
                            	$('.mylog,.mylog>a,.downmymenu').mouseenter(function(){
                            		$('.downmymenu').css("display","block");
                            	});
                            	$('.mylog,.downmymenu').mouseleave(function(){
                            		$('.downmymenu').css("display","none");
                            	});
                            	
                            </script>
                        </div>
                        <%} %>
                    </div>
                </div>
            </div>
            <nav>
                <div class="navsize">
                    <ul class='nav_ul'>
                        <li clase="talent-category">
                        	<div class="cate" id="cate0"><a href="/semi/selectList.bo?cCode=10&code=0">디자인</a></div>
                        	<ul class="downmenu" id="downmenu0">
                        		<li><a href="/semi/selectList.bo?cCode=10&code=11">로고디자인</a></li>
                            	<li><a href="/semi/selectList.bo?cCode=10&code=12">의류디자인</a></li>
                            	<li><a href="/semi/selectList.bo?cCode=10&code=13">간판디자인</a></li>
                            	<li><a href="/semi/selectList.bo?cCode=10&code=14">일러스트</a></li>
                            	<li><a href="/semi/selectList.bo?cCode=10&code=15">웹툰</a></li>
                        	</ul>
                        	
                        </li>
                        <li clase="talent-category">
	                        <div class="cate" id="cate1"><a href="/semi/selectList.bo?cCode=20&code=0">IT/프로그래밍</a></div>
	                        <ul class="downmenu" id="downmenu1">
	                        	<li><a href="/semi/selectList.bo?cCode=20&code=21">웹사이트 개발</a></li>
	                            <li><a href="/semi/selectList.bo?cCode=20&code=22">프로그램 개발</a></li>
	                            <li><a href="/semi/selectList.bo?cCode=20&code=23">서버 및 기술지원</a></li>
	                            <li><a href="/semi/selectList.bo?cCode=20&code=24">게임</a></li>
	                            <li><a href="/semi/selectList.bo?cCode=20&code=25">모바일앱/웹</a></li>
	                        </ul>
                        </li>
                        <li clase="talent-category">
                        	<div class="cate" id="cate2"><a href="/semi/selectList.bo?cCode=30&code=0">마케팅</a></div>
                        	<ul class="downmenu" id="downmenu2">
                        		<li><a href="/semi/selectList.bo?cCode=30&code=31">sns마켓팅</a></li>
	                            <li><a href="/semi/selectList.bo?cCode=30&code=32">종합광고대행</a></li>
	                            <li><a href="/semi/selectList.bo?cCode=30&code=33">블로그</a></li>
	                            <li><a href="/semi/selectList.bo?cCode=30&code=34">마케팅 노하우</a></li>
	                            <li><a href="/semi/selectList.bo?cCode=30&code=35">유튜브 크리에이터</a></li>
                        	</ul>
                        </li>
                        <li clase="talent-category">
                        	<div class="cate" id="cate3"><a href="/semi/selectList.bo?cCode=40&code=0">콘텐츠 제작</a></div>
                        	<ul class="downmenu" id="downmenu3">
	                        	<li><a href="/semi/selectList.bo?cCode=40&code=41">영상</a></li>
	                            <li><a href="/semi/selectList.bo?cCode=40&code=42">더빙/녹음</a></li>
	                            <li><a href="/semi/selectList.bo?cCode=40&code=43">음악/사운드</a></li>
	                            <li><a href="/semi/selectList.bo?cCode=40&code=44">엔터테이너</a></li>
	                            <li><a href="/semi/selectList.bo?cCode=40&code=45">사진</a></li>
                        	</ul>
                        </li>
                        <li clase="talent-category">
                        	<div class="cate" id="cate4"><a href="/semi/selectList.bo?cCode=50&code=0">번역/통역</a></div>
	                        <ul class="downmenu" id="downmenu4">
		                        <li><a href="/semi/selectList.bo?cCode=50&code=51">번역</a></li>
	                            <li><a href="/semi/selectList.bo?cCode=50&code=52">영상번역</a></li>
	                            <li><a href="/semi/selectList.bo?cCode=50&code=53">통역</a></li>
	                        </ul>
                        </li>
                        <li clase="talent-category">
                        	<div class="cate" id="cate5"><a href="/semi/selectList.bo?cCode=60&code=0">문서/취업</a></div>
                        	<ul class="downmenu" id="downmenu5">
                        		<li><a href="/semi/selectList.bo?cCode=60&code=61">논문</a></li>
	                            <li><a href="/semi/selectList.bo?cCode=60&code=62">타이핑</a></li>
	                            <li><a href="/semi/selectList.bo?cCode=60&code=63">글작성/대본</a></li>
	                            <li><a href="/semi/selectList.bo?cCode=60&code=64">면접/취업코딩</a></li>
	                            <li><a href="/semi/selectList.bo?cCode=60&code=65">자소서/이력서</a></li>
                        	</ul>
                        </li>
                        <li clase="talent-category">
                        	<div class="cate" id="cate6"><a href="/semi/selectList.bo?cCode=70&code=0">기프트/커스텀</a></div>
                        	<ul class="downmenu"  id="downmenu6">
                        		<li><a href="/semi/selectList.bo?cCode=70&code=71">라이프</a></li>
                            	<li><a href="/semi/selectList.bo?cCode=70&code=72">패션</a></li>
                            	<li><a href="/semi/selectList.bo?cCode=70&code=73">푸드</a></li>
                        	</ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
    </div>
    <script>
    	var i = -1;
    	$(".cate").mouseenter(function(){
    		$(this).css({
    			"border":"2px solid #BDD4F2",
    			"border-bottom":"none",
   			    "background" : "#fff"
    			
    		});
    		i = $(".cate").index(this);
    		$("#downmenu"+i).css("display","block");
    	});
    	$(".downmenu").mouseenter(function(){
    		$(this).css("display","block");
    		$("#cate"+i).css({
    			"border":"2px solid #BDD4F2",
    			"border-bottom":"none",
   				"background" : "#fff"
    		});
    	});
    	$(".cate").mouseleave(function(){
    		$(this).css({
    			"border":"2px solid transparent",
    			"border-bottom":"none",
   				"background" : "none"
    		});
    		$("#downmenu"+i).css("display","none");
    	});
    	$(".downmenu").mouseleave(function(){
    		$(this).css("display","none");
    		$("#cate"+i).css({
    			"border":"2px solid transparent",
    			"border-bottom":"none",
   				"background" : "none"
    		});
    	});
    	
    	function buyingctrl(){
			location.href="/semi/prging.bo?state=1";
		}
    	
    	function doSearch(){
    		var searchWord = $('#searchWord').val();
    		location.href = "/semi/searchedList.bo?searchWord="+searchWord;
    		
    	}
    	
    	
    	
    	
    </script>
</body>
</html>