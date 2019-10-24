<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member"%>
<%@ page import="seller.model.vo.Seller,sellerboard.model.vo.*,java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%DecimalFormat dc = new DecimalFormat("###,###,###,###");					  
%>
<% 
	Member m = (Member)session.getAttribute("member");
	Seller s = (Seller)session.getAttribute("seller");
	ArrayList<Top5> list =(ArrayList<Top5>)request.getAttribute("list");
	Top5 t = (Top5)request.getAttribute("t");
	
	ArrayList<String> str= new ArrayList<String>();
	ArrayList<Integer> num1= new ArrayList<Integer>();
	
	for(Top5 to : list){
		if(to.getCate().equals(t.getTop1())){
			str.add(to.getNickname());
			num1.add(to.getIncome());
		}
	}
	for(Top5 to : list){
		if(to.getCate().equals(t.getTop2())){
			str.add(to.getNickname());
			num1.add(to.getIncome());
		}
	}
	for(Top5 to : list){
		if(to.getCate().equals(t.getTop3())){
			str.add(to.getNickname());
			num1.add(to.getIncome());
		}
	}	
	
	
	
	
	
	
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="icon" href="/semi/resources/images/pic.jpg"/>
<title>메인페이지</title>
<style>
*{
    font-family: 'Noto Sans KR', sans-serif;
    margin: 0;
    padding: 0;
   
}

header{
    margin: 0 auto;
    background-image: url('/semi/resources/images/back3.jpg');
    background-position:center top ;
    background-attachment: scroll;
    /* background-repeat:no-repeat;  */
    min-width : 1200px;
}
.clearFix::after{
    content: '';
    clear: both;
    display: block;
}

.container1{
    width: 1200px;
    height: 538px;
    margin: 0 auto;
}
.container{
    width: 1200px;
    margin: 0 auto;
}
.header{
    width: 100%;
    height: 115px;
}
.mainTitle h1{
    font-family: 'Noto Sans KR', sans-serif;
    color: white;
}
.info div{
    display: inline-block;
}
div a{
    text-decoration: none;
    color: #333;
}
.flex-left{
    width: 40%;
    /* width: 490px; */
    height: 115px;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    position: relative;
    min-height: 1px;
    float: left;
}
.flex-right{
    display: flex;
    justify-content: flex-end;
    align-items: center;
    width: 60%;
    height: 115px;
    float: right;
    
}
.flex-right div{
    font-size: 13px;
    margin: 10px;
    color: white;
}
.flex-right div a{
    font-size: 13px;
    color: white;
}

.joinBtn{
    font-size: 13px;
    padding: 6px 10px !important;
    background-color: #f1c40f;
    border-color: #f1c40f;
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
.search{
    margin: 0 auto;
    text-align: center;
}
.search-input{
   
    position: relative;
    margin-top: 40px;
    width: 570px;
    height:60px;
    border-radius: 10px;
    background-color:whitesmoke;
    font-size: 15px;
    text-align: left;
    border: none;
    outline: none;
    padding-left: 30px; 
   
}
.search-btn{
    margin-left:510px; 
    margin-top: -45px;
    cursor: pointer;
}
.width-30px{
    width:30px !important;
    position: relative;
}
.category{
    width: 1200px;
    height: 130px;
    background-color: white;
    border-radius: 800px;
    margin: 0 auto;
    margin-top: 210px;
    display: inline-block;
    text-align: center;
}


.category ul{
    display: inline-block;
    list-style: none;
    
}
.category ul li{
    
    margin-top: 30px;
    margin-left: 40px;
    margin-right: 40px;
    transition:0.25s;
}
.category ul li a img{
    width: 30px;
    
}

.category ul li:hover{
	transform: scale(1.05);
}

.indexTitle{
    font-size: 16px;
    margin-top: 60px;
    color: #333;
}
.indexTitle1{
    font-size: 16px;
    margin-top: 100px;
    color: #rgba(51, 51, 51, 0.801);

}
.indexTitle1 p{
    font-size: 14px;
    margin-top: 2px;
    margin-bottom:-5px;
    color: #rgba(51, 51, 51, 0.801);

}
.slider1{
    /* border: 1px solid #f00; */
    margin-top: 10px;
    display: inline-block;
}

.sildercon{
    /* border: 1px solid #0f0; */
    float: left;
    margin-right: 20px; 
}
.sildercon1{
    float: left;
    margin:0;
}
.rank{
    float: left;
    background: #f3f4f8;
    margin-top: 15px;
    margin-right: 20px; 
    border-radius: 10px;
    width:384px;
    
}
.rank:hover{
	border:1px solid #BDD4F2;
}
.scontent2:nth-child(6){
    border: none;
}
.rank1{
    float: left;
    background:  #f3f4f8;
    margin-top: 15px;
    border-radius: 10px;
    
    width:384px;
     /* height: 350px; */
     /* border: 1px solid #ccc;#BDD4F2; */
    
}
.scontent1{
	padding-top:14px;
}
.scontent1 p{
    text-align: center;
    font-size: 18px;
    margin-top: 10px;  
    color: #333;  
}
.first{
    margin: 15px 15px;
    background: rgba(255, 255, 255, 0.733);
    border-radius: 10px;
}

.firstimg{
    float: left;
    margin-left: 32px;
}
.firsttext{
    float: left;
    text-align: center;
    margin: 10px;
    margin-left: 33px;
    margin-right: 70px;
    
}
.firsttext>p{
  text-align: center;
  
}

.scontent2{
    background: #fff;
    border-bottom: 1px solid #ccc;
    width: 100%;
    padding: 11px 0;
    /* height:47px; */
    margin: 0 auto;
    
}
.scontent2 p{
    display: inline-block;
    padding-left:40px;
    padding-right: 20px;
    margin-top: 10px; 
}

footer{
    margin-top: 50px;
    background: #2a385b;
    border-top: 1px solid #e6e6e6; 
}
.footer{
    text-align: center;f
    
}
.footer p{
    padding-top: 10px;
    font-size: 12px;
    color: rgba(255, 255, 255, 0.774);
}
.footer p:nth-child(3){
    padding: 10px 0;
    font-size: 12px;
    color: #ccc;
}
.ani:hover{

	cursor:pointer;
	transition: all 0.4s ease-in-out; 
	overflow:hidden;
}
.ani:hover>div>div>a>img{
	 transform:scale(1.2);
	 overflow:hidden;
	 transition: 0.8s;
}
.ani1{
border:5px solid transparent;
}
.ani1:hover{
	cursor:pointer;
	transition: all 0.1s ease-in-out;
	background-color:#BDD4F2;
	border:5px solid #BDD4F2;
}





</style>
<% if(m != null){
  	response.sendRedirect("mainheader2.jsp");
 }%>
</head>
<body>
<!-- 
<script>
	<% if(m == null) {  %>
		
		sessionStorage.setItem('memberLoginChk', '0');
		
	<% } %>
	
 	window.onbeforeunload = function(e) {
	 
	};
	
	window.onload = function() {
		if (sessionStorage.getItem('reloadChk') != 1){
			sessionStorage.setItem('reloadChk', 1);
			if (sessionStorage.getItem('memberLoginChk') != 0) {
			    location.href = 'mainheader2.jsp';
			}
		} else {
			sessionStorage.setItem('reloadChk', 0);
		}
	}
 </script> -->
    <div class="wrap">
        
        <header>
        
            <div class="container1">
                
                <div class="header">
                    <div class="flex-left">
                        <a href="index.jsp">
                            <img src="/semi/resources/images/tmi.png" width="110px">
                        </a>
                    </div>
                   <div class="flex-right">
                            <div class="item1"><a href="views/LoginForm.jsp"><b>판매 시작하기</b></a></div>
                            <div class="item2"><a href="views/LoginForm.jsp"><b>로그인</b></a></div>
                            <div class="item3"><a class="joinBtn" href="views/member/memberJoin.jsp" style="color: black">무료 회원가입</a></div>
                    </div>
                </div>

                <div class="mainTitle">
                    <h1 style="text-align: center; font-size: 40px; 
                    letter-spacing: -0.7px">Talent Makes Income</h1>
                </div>

                <div class="search">
                    <input type="hidden" name="type" value="gigs">
                    <input type="text" id="searchWord" maxlength="15" class="search-input" placeholder="원하는 서비스를 검색하세요!">
                    <div class="search-btn" onclick="doSearch()">
                        <img class="width-30px" src="/semi/resources/images/searching.png">
                    </div>
                </div>

                <div class="category">
                    <ul>
                        <li><a href="/semi/selectList.bo?cate=designCategoryPage&cCode=10&code=0">
                            <img src="/semi/resources/images/edit.png"> <br>
                            <a href="/semi/selectList.bo?cate=designCategoryPage&cCode=10&code=0"><b>디자인</b></a>
                        </a></li>
                    </ul>
                
                    <ul>
                        <li><a href="/semi/selectList.bo?cate=itCategoryPage&cCode=20&code=0">
                            <img src="/semi/resources/images/television.png"><br>
                            <a href="/semi/selectList.bo?cate=itCategoryPage&cCode=20&code=0"><b>IT/프로그래밍</b></a>
                        </a></li>
                    </ul>

                    <ul>
                        <li><a href="/semi/selectList.bo?cate=marketingCategoryPage&cCode=30&code=0">
                            <img src="/semi/resources/images/bar-chart.png"><br>
                            <a href="/semi/selectList.bo?cate=marketingCategoryPage&cCode=30&code=0"><b>마케팅</b></a>
                        </a></li>
                    </ul>

                    <ul>
                        <li><a href="/semi/selectList.bo?cate=contentCategoryPage&cCode=40&code=0">
                            <img src="/semi/resources/images/play-button.png"><br>
                            <a href="/semi/selectList.bo?cate=contentCategoryPage&cCode=40&code=0"><b>콘텐츠 제작</b></a>
                        </a></li>
                    </ul>

                    <ul>
                        <li><a href="/semi/selectList.bo?cate=transCategoryPage&cCode=50&code=0">
                            <img src="/semi/resources/images/microphone.png"><br>
                            <a href="/semi/selectList.bo?cate=transCategoryPage&cCode=50&code=0"><b>번역/통역</b></a>
                        </a></li>
                    </ul>

                    <ul>
                        <li><a href="/semi/selectList.bo?cate=textCategoryPage&cCode=60&code=0">
                            <img src="/semi/resources/images/file.png"><br>
                            <a href="/semi/selectList.bo?cate=textCategoryPage&cCode=60&code=0"><b>문서/취업</b></a>
                        </a></li>
                    </ul>

                    <ul>
                        <li><a href="/semi/selectList.bo?cate=giftCategoryPage&cCode=70&code=0">
                            <img src="/semi/resources/images/gift.png"><br>
                            <a href="/semi/selectList.bo?cate=giftCategoryPage&cCode=70&code=0"><b>기프트/커스텀</b></a>
                        </a></li>
                    </ul>
                </div>
                
            </div>
            
        </header>
    </div>

    <section>

 		   
        <div class="container">
            
            <div class="indexTitle">
                <p><b>디자인 카테고리</b>에서 인기있어요!</p> 
            </div>

            <div class="slider1 clearFix">
                <div class="ani sildercon">
                     <div style="width:224px; margin:-1px;">
                    	
                    	<div class="image" style="height:170px;">
						 	<a href="/semi/selectList.bo?cCode=10&code=11"><img src="/semi/resources/images/logoc.jpg" style="width:224px;height:170px;border-radius:5px;">
						 	<div class="imgTittle" style="font-size:17px;font-family: 'Noto Sans KR', sans-serif;position:absolute; margin-left:15px;top:760px; color:white;"><b>로고디자인</b></div>
						 	</a>
						 	</div>
                    	
                    	
                    </div>
                </div>
                <div class="ani sildercon">
                    <div style="width:224px; margin:-1px;">
                    	<div class="image" style="height:170px;">
						 	<a href="/semi/selectList.bo?cCode=10&code=13"><img src="/semi/resources/images/gan.jpg" style="width:224px;height:170px;border-radius:5px;">
						 	<div class="imgTittle" style="font-size:17px;font-family: 'Noto Sans KR', sans-serif;position:absolute; margin-left:15px;top:760px; color:white;"><b>간판디자인</b></div>
						 	</a>
						 	</div>
                    </div>
                </div>
                <div class="ani sildercon">
                    <div style="width:224px; margin:-1px;">
                    	<div class="image" style="height:170px;" >
						 	<a href="/semi/selectList.bo?cCode=10&code=12"><img src="/semi/resources/images/ot.jpg" style="width:224px;height:170px;border-radius:5px;">
						 	<div class="imgTittle" style="font-size:17px;font-family: 'Noto Sans KR', sans-serif;position:absolute; margin-left:15px;top:760px; color:white;"><b>의류디자인</b></div></a>
						 	</a>
						 	
						 	</div>
                    </div>
                </div>
                <div class="ani sildercon">
                     <div style="width:224px; margin:-1px;">
                    	<div class="image" style="height:170px;">
						 	<a href="/semi/selectList.bo?cCode=10&code=14"><img src="/semi/resources/images/ill.jpg" style="width:224px;height:170px;border-radius:5px;">
						 	<div class="imgTittle" style="font-size:17px;font-family: 'Noto Sans KR', sans-serif;position:absolute; margin-left:15px;top:760px; color:white;"><b>일러스트</b></div>
						 	</a>
						 	</div>
                    </div>
                </div>
                <div class="ani sildercon1">
                     <div style="width:224px; margin:-1px;">
                    	<div class="image" style="height:170px;">
						 	<a href="/semi/selectList.bo?cCode=10&code=15"><img src="/semi/resources/images/toon.jpg" style="width:224px;height:170px;border-radius:5px;">
						 	<div class="imgTittle" style="font-size:17px;font-family: 'Noto Sans KR', sans-serif;position:absolute; margin-left:15px;top:760px; color:white;"><b>웹툰</b></div>
						 	</a>
						 	</div>
                    </div>
                </div>

            </div>
        </div>
        </section>
         <section>
        <div class="container"style="margin-top:-30px;">
            
            <div class="indexTitle">
                 <p><b>IT/프로그래밍 카테고리</b>에서 인기있어요!</p> 
            </div>

            <div class="slider1 clearFix">
                <div class="ani sildercon">
                     <div style="width:224px; margin:-1px;">
                    	<div class="image" style="height:170px;">
						 	<a href="/semi/selectList.bo?cCode=20&code=21"><img src="/semi/resources/images/web.jpg" style="width:224px;height:170px;border-radius:5px;">
						 	<div class="imgTittle" style="font-size:17px;font-family: 'Noto Sans KR', sans-serif;position:absolute; margin-left:15px;top:995px; color:white;"><b>웹사이트개발</b></div></a>
						 	</a>
						 	</div>
                    </div>
                </div>
                <div class="ani sildercon">
                     <div style="width:224px; margin:-1px;">
                    	<div class="image" style="height:170px;">
						 	<a href="/semi/selectList.bo?cCode=20&code=22"><img src="/semi/resources/images/pro.jpg" style="width:224px;height:170px;border-radius:5px;">
						 	<div class="imgTittle" style="font-size:17px;font-family: 'Noto Sans KR', sans-serif;position:absolute; margin-left:15px;top:995px; color:white;"><b>프로그램개발</b></div></a>
						 	</a>
						 	</div>
                    </div>
                </div>
                <div class="ani sildercon">
                     <div style="width:224px; margin:-1px;">
                    	<div class="image" style="height:170px;">
						 	<a href="/semi/selectList.bo?cCode=20&code=25"><img src="/semi/resources/images/mobile.jpg" style="width:224px;height:170px;border-radius:5px;">
						 	<div class="imgTittle" style="font-size:17px;font-family: 'Noto Sans KR', sans-serif;position:absolute; margin-left:15px;top:995px; color:white;"><b>모바일앱/웹</b></div></a>
						 	</a>			
						 </div>
                    </div>
                </div>
                <div class="ani sildercon">
                     <div style="width:224px; margin:-1px;">
						 	<div class="image" style="height:170px;">
						 	<a href="/semi/selectList.bo?cCode=20&code=24"><img src="/semi/resources/images/games.jpg" style="width:224px;height:170px;border-radius:5px;">
						 	<div class="imgTittle" style="font-size:17px;font-family: 'Noto Sans KR', sans-serif;position:absolute; margin-left:15px;top:995px; color:white;"><b>게임</b></div></a>
						 	</a>
						 	</div>
                    </div>
                </div>
                <div class="ani sildercon1">
                     <div style="width:224px; margin:-1px;">
						 	<div class="image" style="height:170px;">
						 	<a href="/semi/selectList.bo?cCode=20&code=23"><img src="/semi/resources/images/sev.jpg" style="width:224px;height:170px;border-radius:5px;">
						 	<div class="imgTittle" style="font-size:17px;font-family: 'Noto Sans KR', sans-serif;position:absolute; margin-left:15px;top:995px; color:white;"><b>서버 및 기술지원</b></div></a>
						 	</a>
						 	</div>
						 	</div>
						
						 </div>
                    </div>
                </div>

            </div>
        </section>
        <section>
            <div class="container" style="margin-top:-80px;">
                <div class="indexTitle1">
                    <b>TOP 카테고리 전문가 랭킹</b> 
                    <p>TMI에서 가장 많이 판매한 인기 전문가 랭킹 입니다.</p> 
                </div>
            <%	
            	ArrayList<String> num = new ArrayList<String>();
		         String income = "0";
			       	if(num1!=null){
			       	  for(int i : num1){
			       		income = dc.format(i);
			       	  	num.add(income);
			       	  }
			       	} 
            %>

            <div class="slider1 clearFix">
            		
                    <div class="ani1 rank">   
                               
                        <div class="sheader2" style="border:2 solid #BDD4F2; ">  
                        <div class="scontent1">
                            <p><b><%=t.getTop1() %></b></p>
                        </div>
 
                        <div class="first clearFix">
                            <div class="firstimg">
                                <img src="/semi/resources/images/medal.png" style="width:70px; height:90px;">
                            </div>
                            <div class="firsttext">
                                <p style="font-size:13px; font-family: 'Noto Sans KR', sans-serif; margin-bottom:8px;float: left;">총 판매 금액</p>
                                <p style="font-size:20px; margin-bottom:6px;"><b><%=num.get(0) %>원</b></p>
                                <p style="font-size:13px;float: left;"><%=str.get(0) %></p>
                            </div>
                        </div>
                        
                            <div class="scontent2">    
                                <p><b>2위</b></p>
                                <p><b><%=num.get(1) %>원</b></p>
                                <p style="float:right;"><%=str.get(1) %></p>                          
                            </div>

                            <div class="scontent2">                            
                               	<p><b>3위</b></p>
                                <p><b><%=num.get(2) %>원</b></p>
                                <p style="float:right;"><%=str.get(2) %></p>                         
                            </div>

                            <div class="scontent2">                            
                                <p><b>4위</b></p>
                                <p><b><%=num.get(3) %>원</b></p>
                                <p style="float:right;"><%=str.get(3) %></p>                     
                            </div>

                            <div class="scontent2">
                                <p><b>5위</b></p>
                                <p><b><%=num.get(4) %>원</b></p>
                                <p style="float:right;"><%=str.get(4) %></p>
                            </div>
                            
                            </div>
                        
                        </div>                                
                   
                    
                    <div class="ani1 rank">
                           <div class="sheader2">
                        <div class="scontent1">
                            <p><b><%=t.getTop2() %></b></p>
                        </div>
 
                        <div class="first clearFix">
                            <div class="firstimg">
                                    <img src="/semi/resources/images/medal.png" style="width:70px; height:90px;">
                            </div>
                            <div class="firsttext">
                                <p style="font-size:13px;font-family: 'Noto Sans KR', sans-serif;margin-bottom:8px;float: left;">총 판매 금액</p>
                                <p style="font-size:20px; margin-bottom:6px;"><b><%=num.get(5) %>원</b></p>
                                <p style="font-size:13px;float: left;"><%=str.get(5) %></p>
                            </div>
                        </div>
                        
                            <div class="scontent2">    
                                <p><b>2위</b></p>
                                <p><b><%=num.get(6) %>원</b></p>
                                <p style="float:right;"><%=str.get(6) %></p>                          
                            </div>

                            <div class="scontent2">                            
                                <p><b>3위</b></p>
                                <p><b><%=num.get(7) %>원</b></p>
                                <p style="float:right;"><%=str.get(7) %></p>                           
                            </div>

                            <div class="scontent2">                            
                                <p><b>4위</b></p>
                                <p><b><%=num.get(8) %>원</b></p>
                                <p style="float:right;"><%=str.get(8) %></p>                        
                            </div>

                            <div class="scontent2">
                                <p><b>5위</b></p>
                                <p><b><%=num.get(9) %>원</b></p>
                                <p style="float:right;"><%=str.get(9) %></p>
                            </div>
                            
                            </div>
                        </div>

                        <div class="ani1 rank1">
                            <div class="sheader2">
                                <div class="scontent1">
                                    <p><b><%=t.getTop3() %></b></p>
                                </div>
            
                                <div class="first clearFix">
                                    <div class="firstimg">
                                            <img src="/semi/resources/images/medal.png" style="width:70px; height:90px;">
                                    </div>
                                    <div class="firsttext">
                                       <p style="font-size:13px;font-family: 'Noto Sans KR', sans-serif;margin-bottom:8px;float: left;">총 판매 금액</p>
                                       <p style="font-size:20px; margin-bottom:6px;"><b><%=num.get(10) %>원</b></p>
                                		<p style="font-size:13px;float: left;"><%=str.get(10) %></p>
                                    </div>
                                </div>
                                
                                    <div class="scontent2">    
                                        <p><b>2위</b></p>
                                        <p><b><%=num.get(11) %>원</b></p>
                                		<p style="float:right;"><%=str.get(11) %></p>                           
                                    </div>
        
                                    <div class="scontent2">                            
                                        <p><b>3위</b></p>
                                        <p><b><%=num.get(12) %>원</b></p>
                                		<p style="float:right;"><%=str.get(12) %></p>                           
                                    </div>
        
                                    <div class="scontent2">                            
                                        <p><b>4위</b></p>
                                        <p><b><%=num.get(13) %>원</b></p>
                                		<p style="float:right;"><%=str.get(13) %></p>                    
                                    </div>
        
                                    <div class="scontent2">
                                        <p><b>5위</b></p>
                                        <p><b><%=num.get(14) %>원</b></p>
                                		<p style="float:right;"><%=str.get(14) %></p>
                                    </div>
                         </div>

                </div>
            </div>
     
		
		
		
	</div>
        </section>

        <footer>
            <div class="footer container">
                <p>TMI는 통신판매중개자 이며 통신판매의 당사자가 아닙니다.</p>
                <p>따라서 개별 판매자가 등록하여 판매한 모든 상품에 대한 거래정보 및 거래에 대한 책임은 각 판매자가 부담하고, 이에 대하여 TMI는 일체 책임지지 않습니다.</p>
                <p>Copyright © 2019 TMI Inc. All rights reserved.</p>
            </div>
        </footer>
        
    	
</body>
<script>
function doSearch(){
	var searchWord = $('#searchWord').val();
	location.href = "/semi/searchedList.bo?searchWord="+searchWord;
	
}

</script>
















</html>