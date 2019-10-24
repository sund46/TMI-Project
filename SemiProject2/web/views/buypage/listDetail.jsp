<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page
   import="buy.buy.model.vo.* ,buy.comment.model.vo.*, java.util.*, member.model.vo.*"%>

<%
SellerBoard b = (SellerBoard)request.getAttribute("sellerboard");
ArrayList<BoardComment> clist = (ArrayList<BoardComment>)request.getAttribute("clist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.js"></script>

<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
   src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>


<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap"
   rel="stylesheet">

<title><%=b.getBtitle()%></title>

<style>
@charset "UTF-8";

html {
   font-family: 'Noto Sans KR', sans-serif;
}
.font-noto{
		font-family: 'Noto Sans KR', sans-serif;
    	font-weight: 400;
	}
.clearFix::after {
   content: '';
   display: block;
   width: 100%;
   clear: both;
}

/* container 고정레이아웃 */
.container1 {
   width: 1200px;
   margin: 0 auto;
}

.detailbox {
   margin-top: 80px;
}

.detailbox1 {
   width: 550px;
   margin-right: 92px;
   display: inline-block;
   float: left;
}

.detailbox2 {
   width: 550px;
   display: inline-block;
   float: left;
}

.imgbox {
   width: 100%;
   height: 500px;
}

.starbox {
   width: 100%;
   text-align: center;
   margin-top: 10px;
}

.starbox p {
   
}

.detailsTab ul li {
   float: left;
   cursor: pointer;
   padding: 18px 31px;
   border: solid 1px #ccc;
   background: #fff;
}

li {
   list-style: none;
}

.detailTit p:nth-child(1) {
   font-size: 18px;
   font-weight: 700;
   color: #333;
}

.detailTit p:nth-child(2) {
   font-size: 24px;
   color: #4d4d4d;
   font-weight: 900;
   text-align: right;
}

.buybtntext {
   float: left;
   margin-top: 10px;
}

.buybtntext p {
   margin: 10px 0;
}

.pricebox {
   border: 1px solid #e6e6e6;
   padding: 20px;
   margin-top: 30px;
}

.pricebox p {
/*    font-size: 16px; */
   margin : 10px 10px;
}

.pricebox a{
padding: 15px 100px; 
color:#fff;
background: #364559; 
border-radius: 8px;
margin: 20px 10px; 
}
.shildbox {
/*    border: 1px solid #e6e6e6; */
}

.sellerInfobox {
}

.sellerinfo {
   margin-top: 20px;
}

.selleridbox {
   text-align: center;
}

.selleridbox p {
   font-size: 21px;
   font-weight: 700;
}

.sellerwork {
   display: inline-block;
   padding: 0 30px;
   border-right: 1px solid #ccc;
   font-size: 16px;
}

.sellergrade {
   display: inline-block;
   padding: 10px 30px;
   font-size: 16px;
}

.sellerintrodu {
   margin: 20px 0;
   padding-top: 20px;
   border-top: 1px dashed #e6e6e6;
}

.sellerpadding {
  
}

.fixed {
   position: fixed;
   top: 0px;
}
.pricedue{
   display: inline-block;
}

.priceedit{
   display: inline-block;
   margin-left: 20px;
}


.pricedue p{
   float: left;
   margin:0 10px;
   font-size: 12px;
}
.priceedit p{
   float: left;
   margin:0 10px;
   font-size: 12px;
}
.imgbox>img{
   width:550px;
   height:500px;
}
</style>

<script>
   function fnMove(seq) {
      var offset = $(".tabcontent" + seq).offset();
      var winH = $(".tabcontent" + seq).height();
      $('html, body').animate({scrollTop : (offset.top - winH*1.8)}, 400);
   };

   $(document).ready(function() {
      var Offset = $('.tab').offset();

      $(window).scroll(function() {
         if ($(document).scrollTop() > Offset.top) {
            $('.tab').addClass('fixed');
         } else {
            $('.tab').removeClass('fixed');
         }
      });
   });
</script>
</head>
<body>

   <%@ include file="/views/common/cateheader1.jsp"%>

   <section class="detailbox container1 clearFix font-noto">
      <div class="detailbox1">

         <div class="img">
            <div class="imgbox">
               <img src="/semi/resources/selleruploadIMG/<%=b.getImages()%>" alt="" style="width:550px;height:500px;"/>

            </div>

            <div class="starbox" style="margin: 30px 0;">
               <div class="ui huge star rating" data-rating="1"
                  data-max-rating="1"></div>
                  <span style="font-size: 21px; vertical-align: top;"> : &nbsp;&nbsp;<%=b.getBevaluation() %>.0 <span style="font-size: 12px;">점</span></span> 

                <script>
                  $('.ui.rating').rating();
               </script>
            </div>
         </div>
         <div class="detailsTab">
            <ul class="tab clearFix" style="padding: 0;">

               <li onclick="fnMove('1')">

                  <p>서비스설명</p>
               </li>
               <li onclick="fnMove('2')">

                  <p>가격정보</p>
               </li>
               <li onclick="fnMove('3')">

                  <p>수정 및 재진행</p>
               </li>
               <li onclick="fnMove('4')">

                  <p>서비스 평가</p>
               </li>
            </ul>
            <div class="tabcontent1" style="margin-bottom: 200px;">
               <p>
                  <span style="font-size: 18px;display: block; margin: 10px 0; font-weight: bold;">서비스 설명</span>
                  <%=b.getBcontent() %>
               </p>
            </div>

            <div class="tabcontent2" style="margin-bottom: 200px;">
               <p>
               <span style="font-size: 18px; display: block; margin: 10px 0; font-weight: bold;">가격정보</span>
                  <%=b.getErecontent() %>
               </p>
             </div> 
            <div class="tabcontent3" style="margin-bottom: 200px;">
               <p>
               <span style="font-size: 18px; display: block; margin: 10px 0; font-weight: bold;">수정 및 재진행</span>
                  <%=b.getRequest() %>
               </p>
            </div>

            <div class="tabcontent4" >
               <span style="font-size: 18px; display: block; margin: 10px 0; font-weight: bold;">서비스 평가</span>
               <div class="outer">
      <br>
      <% if(m != null){ %>
      <div class="replyArea">
         <div class="replyWriteArea">
            <form action="/semi/insertComment.bo" method="post">
               <input type="hidden" name="writer" value="<%=m.getEmail()%>"/>
               <input type="hidden" name="bno" value="<%=b.getBno() %>" />
               <input type="hidden" name="refcno" value="0" />
               <input type="hidden" name="clevel" value="1" />
               
               <table align="center">
                  <tr>
                   
                     <td><textArea rows="3" cols="60" id="replyContent" name="replyContent" style="resize: none;"></textArea></td>
                     <td><button type="submit" id="addReply" style="cursor:pointer;width:110px;color: #fff;background-color: #364559;border-color: #364559;padding: 15px 5px;border-radius: 4px;">댓글 등록</button></td>
<!--                   </tr> -->
               </table>
            </form>
            <%} %>
          </div>
         <div id="replySelectArea">
            <!-- 게시글의 댓글을 보여주는 부분 -->
            <% if (clist != null){%>
               <% for(BoardComment bco : clist){ %>
                  <table id="replySelectTable"
                style="margin-left : 0px;
                      width : 550px;"
                class="replyList<%=bco.getClevel()%>">
                 <tr>
                    <td rowspan="2"> </td>
                  <td><b><%= bco.getCwriter() %></b></td>
                  <td style="text-align: right;"><%= bco.getCdate() %></td>
                  <td align="center">
                  
                  </td>
               </tr>
               <tr class="comment replyList<%=bco.getClevel()%>">
                   <td colspan="3" style="background : transparent;">
                  <div class="reply-content" cols="105" rows="3"
                   readonly="readonly"><%= bco.getCcontent() %></div>
                  </td>
               </tr>
            </table>
            <% } } else { %>
             <p>현재 등록된 댓글이 없습니다.</p>
            <%} %>
         </div>
      </div>
      
      
   </div>
            </div>


         </div>
      </div>

   <script>
   function updateReply(obj) {
        // 현재 위치와 가장 근접한 textarea 접근하기
        $(obj).parent().parent().next().find('textarea')
        .removeAttr('readonly');
        
        // 수정 완료 버튼을 화면 보이게 하기
        $(obj).siblings('.updateConfirm').css('display','inline');
        
        // 수정하기 버튼 숨기기
        $(obj).css('display', 'none');
     }
     
    <%--  function updateConfirm(obj) {
        // 댓글의 내용 가져오기
        var content
          = $(obj).parent().parent().next().find('textarea').val();
        
        // 댓글의 번호 가져오기
        var cno = $(obj).siblings('input').val();
        
        // 게시글 번호 가져오기
        var bno = '<%=b.getBno()%>';
        
        location.href="/myWeb/updateComment.bo?"
               +"cno="+cno+"&bno="+bno+"&content="+content;
     } --%>
     
    <%--  function deleteReply(obj){
        // 댓글의 번호 가져오기
        var cno = $(obj).siblings('input').val();
        
        // 게시글 번호 가져오기
        var bno = '<%=b.getBno()%>';
        
        location.href="/myWeb/deleteComment.bo"
        +"?cno="+cno+"&bno="+bno;
     } --%>
     
     function reComment(obj){
        // 추가 완료 버튼을 화면 보이게 하기
        $(obj).siblings('.insertConfirm').css('display','inline');
        
        // 클릭한 버튼 숨기기
        $(obj).css('display', 'none');
        
        // 내용 입력 공간 만들기
        var htmlForm = 
           '<tr class="comment"><td></td>'
              +'<td colspan="3" style="background : transparent;">'
                 + '<textarea class="reply-content" style="background : ivory;" cols="105" rows="3"></textarea>'
              + '</td>'
           + '</tr>';
        
        $(obj).parents('table').append(htmlForm);
        
     }
     
     function reConfirm(obj) {
        // 댓글의 내용 가져오기
        
        // 참조할 댓글의 번호 가져오기
        var refcno = $(obj).siblings('input[name="refcno"]').val();
        var level = Number($(obj).siblings('input[name="clevel"]').val()) + 1;
        
        // console.log(refcno + " : " + level);
        
        // 게시글 번호 가져오기
        var bno = '<%=b.getBno()%>';
        
        var parent = $(obj).parent();
        var grandparent = parent.parent();
        var siblingsTR = grandparent.siblings().last();
        
        var content = siblingsTR.find('textarea').val();
        
        // console.log(parent.html());
        // console.log(grandparent.html());
        // console.log(siblingsTR.html());
        
        // console.log(content);

        // writer, replyContent
        // bno, refcno, clevel
       location.href='/semi/insertComment.bo'
                   
                   + '&replyContent=' + content
                   + '&bno=' + bno
                   + '&refcno=' + refcno
                   + '&clevel=' + level; 
     }
   </script>

<%
	String price = dc.format(b.getPrice());
	if(s!=null){
	 price = dc.format(b.getPrice()); 	  
	} 
%>

      <div class="detailbox2">
         <div class="detailTit">
            <p><%=b.getBtitle() %></p>
            <p><%=price %>원</p>
         </div> 
         

         <div class="pricebox" style="border: 1px solid #e6e6e6;">
            <div class="sellerInfobox">
            <div class="sellerpadding" style="padding-bottom:10px;">
               <div class="selleridbox1">
                  <div style="width:100%;text-align : center">
                  	<img src="/semi/resources/images/myprofile.png" alt="" style="border-radius: 100px;border:1px solid #878787"/>
                  </div>
                  <p style="text-align:center; font-size: 21px; font-weight: bold;"><%=b.getNickname() %></p>
               </div>

               <div style="text-align: center;">
                  <div class="sellerinfo clearFix">
                     <div class="sellerwork">
                        <p><%=b.getCpcount() %>건</p>
                        <p>작업갯수</p>
                     </div>
                     <div class="sellergrade">
                        <p><%=b.getSevaluation() %>점</p>
                        <p>평점</p>
                     </div>
                  </div>
               </div>
               <div class="sellerintrodu">
                  <p><%=b.getIntrotext() %></p>
               </div>

            </div>
         </div>
            
            <div class="clearFix" style="margin-bottom: 20px; text-align: center;">
               <div class="pricedue clearFix">
                  <img src="/semi/resources/images/calendar.png" alt="" style="width: 15px; height:15px; float: left;"/>
                  <p>작업일: &nbsp;<%=b.getDuedate() %>일</p>
               </div>
               <div class="priceedit clearFix">
                  <img src="/semi/resources/images/tool.png" alt="" style="width: 15px; height:15px; float: left;"/>
                  <p>수정횟수: &nbsp;<%=b.getEditablecount() %>회</p>
               </div>
            </div>
            
            <% if(m != null) { %>
            <div style="text-align: center;" style="margin: 30px 0 !important;">
            <a href="<%= request.getContextPath() %>/buyPage.bo?bno=<%=b.getBno()%>"
               >구매하기(<%=price %>원)</a>
            </div>
            
            <% } else { %>
            <div style="text-align: center;">
            <a href="<%= request.getContextPath() %>/views/LoginForm.jsp"
               onclick="alert('로그인이 필요한 서비스입니다.')">구매하기(<%=b.getPrice() %>원)</a>
            </div>
            <% } %>
         </div>

      
         <div class="shildbox container2 clearFix" style="margin-top: 20px;">
            <img src="/semi/resources/images/shild.png" alt=""
               style="float: left; margin:10px 10px;">
            <div class="buybtntext">
               <p>TMI는 안전한 거래 환경을 제공합니다.</p>
               <p>TMI를 통해 결제 진행 시 관련 정책에 의해 보호 받을 수 있습니다.</p>
            </div>

         </div>



         
      </div>
   </section>

   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <%@ include file="../common/footer.jsp" %>
</body>
</html>