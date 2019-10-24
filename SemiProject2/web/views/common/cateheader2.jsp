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
<title>cateheader2</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="icon" href="/semi/resources/images/pic.jpg"/>
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
    text-align: left;
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
	width : 120px;
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
.mylog .mynick{
	display:inline-block;
}
.mylog>a>div{
	display:inline-block;
}
.mylogmenu{
	margin:0 auto;
}
.mylogmenu a>div{
	padding:12px 20px;
	text-align:center;
}
.mylogmenu a>div>h5{
	font-family: 'Noto Sans KR', sans-serif;
    font-weight: 400;
    font-size:13px;
}
.downmymenu{
	border : 1px solid #BDD4F2; 
	position: absolute;
	background:#fff;
	display : none;
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
                        <div class="info">
                            <%if(s == null){ %>
                            	<div class="padding-20px"><a href="/semi/views/seller/SellerRegistration.jsp">판매 시작하기</a></div>
                            <%}else{ %>
                            	<div class="padding-20px"><a href="/semi/views/seller/ServiceRegistration.jsp">판매 시작하기</a></div>
                            <%} %>
                            <div class="padding-15px"><a style="cursor:pointer;" onclick="prging();">구매</a></div>
                            <div class="padding-15px"><a href="/semi/messageList">메세지</a></div>
                            <div class="mylog padding-15px"><a href="/semi/views/myPage/myPage.jsp">
                            	<div style="width:30px;height:30px"><img src="/semi/resources/images/myprofile.png" width=30px style="border-radius: 500px !important; vertical-align: middle;"/></div>
                            	<div class="mynick"><h5><%= m.getNickName() %></h5></a></div>
                            	</a>
                            	<div class="downmymenu">
		                           	<ul class="mylogmenu" style="list-style:none;margin:5px 0;">
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
                    </div>
                </div>
            </div>
            <nav>
                <div class="navsize">
                    <ul class='nav_ul'>
                        <li clase="talent-category">
                        	<div class="cate" id="cate0"><a href="/semi/views/myPage/myPage.jsp">나의정보</a></div>
                        </li>
                        <li clase="talent-category">
	                        <div class="cate" id="cate1"><a style="cursor:pointer;" onclick="prging();">구매관리</a></div>
                        	<ul class="downmenu" id="downmenu1">
                        		<li><a style="cursor:pointer;" onclick="prging();">구매관리</a></li>
                        		<li><a style="cursor:pointer;" onclick="billHist();">TMI캐시</a></li>
                            	<li><a href="/semi/views/personBUY/cash.jsp">캐시충전</a></li>
                            	<li><a href="/semi/views/personBUY/coupon.jsp">쿠폰</a></li>
                        	</ul>
                        </li>
                        <li clase="talent-category">
                        	<% if(s!=null){ %>
                        		<div class="cate" id="cate2"><a href="/semi/dSelect.do">판매관리</a></div>
                        	<%}else{ %>
                        		<div class="cate" id="cate2"><a href="/semi/views/myPage/myPageManageSell.jsp">판매관리</a></div>
                        	<%} %>
                        	<ul class="downmenu" id="downmenu2">
                        	<%if(s!=null){ %>
                        		<li><a href="/semi/dSelect.do">판매관리</a></li>
                        	<%} else{ %>
                        		<li><a href="/semi/views/myPage/myPageManageSell.jsp">판매관리</a></li>
                        	<%} %>
	                        	<li><a href="/semi/myboard.bo">나의서비스</a></li>
	                            <li><a href="/semi/list.ic">수익관리</a></li>
	                            <li><a href="/semi/views/myPage/myPageManageAd.jsp">광고등록</a></li>
	                        </ul>
                        </li>
                        
                        <li clase="talent-category">
                        	<div class="cate" id="cate3"><a href="/semi/messageList">메시지</a></div>
                        </li>
                        <li clase="talent-category">
                        	<div class="cate" id="cate4"><a href="/semi/views/member/memberUpdateForm.jsp">계정설정</a></div>
                        </li>
                    </ul>
                </div>
            </nav>

        </header>
    </div>
    
  	    <script>
    	var i = -1;
    	$(".cate").mouseenter(function(){
    		i = $(".cate").index(this);
    		if(i>0&&i<3){
	    		$(this).css({
	    			"border":"2px solid #BDD4F2",
	    			"border-bottom":"none",
	   			    "background" : "#fff"	
	    		});
	    		
	    		$("#downmenu"+i).css("display","block");
    		}
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
    		if(i>0&&i<3){
	    		$(this).css({
	    			"border":"2px solid transparent",
	    			"border-bottom":"none",
	   				"background" : "none"
	    		});
	    		$("#downmenu"+i).css("display","none");
    		}
    	});
    	$(".downmenu").mouseleave(function(){
    		$(this).css("display","none");
    		$("#cate"+i).css({
    			"border":"2px solid transparent",
    			"border-bottom":"none",
   				"background" : "none"
    		});
    	});
    	
    	function billHist(){
			location.href="/semi/cList.bo"
		}
    	
    	function prging(){
    		location.href="/semi/prging.bo?state=1"
    	}
    	
    	function doSearch(){
    		var searchWord = $('#searchWord').val();
    		location.href = "/semi/searchedList.bo?searchWord="+searchWord;
    		
    	}
    	
    	
    </script>
    
    
    
</body>
</html>