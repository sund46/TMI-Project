<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="<%= request.getContextPath() %>/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>


<div class="ui segment" id="example1" style="width:80px;left: 1600px; position:fixed; bottom:167px;" >
      <div class="ui sticky">
	      <div style="cursor:pointer;" onclick="triggerChatFn()">
	      <img class="chat" src="/semi/resources/images/chat.png" style="width: 50px !important; height: 50px !important;">
	      </div>
      
 
     </div>
</div>

		<!-- Modal -->
	  <div class="ui small modal">
		 <div class="header" style="font-size:30px;">
			 <b>1:1 문의</b><br>
		 	 <label style="font-size:18px;">제목</label>&nbsp;&nbsp;
		 	 <div class="ui input focus"><input type="text" id="rTitle" style="font-size:18px;width:600px;height:18px;"></div>
		 </div>
		 
		  <div class="content" style="padding-top:10px; padding-bottom:10px;">
		  <label style="font-size:18px;"><b>내용</b></label><br>
		  <textarea id="rContent" style="font-size:18px;width:710px;height:300px;"></textarea>

	     </div>
	     
	     <div class="actions">
   			 <button class="ui blue basic approve button" onclick="submitFn()">완료</button>
		     <button class="ui red basic button cancel ">취소</button>
  		 </div>
	     
	     
	     <br>
	  </div>
	     
	


<script>
	function triggerChatFn(){
			$('.small.modal').modal('show');
	}
	
	$('.cancel').click(function(){
		$('#rTitle').val(" ");
		$('#rContent').val(" ");
	});
	
	function submitFn(){
		$.ajax({
			url : "clientRequest.do",
			type : "post",
			data : {rTitle : $('#rTitle').val(), rContent: $('#rContent').val()},
			success : function(){
				$('#rTitle').val(" ");
				$('#rContent').val(" ");
				alert("문의가 접수되었습니다.");
			},
			error : function(){
				alert("로그인 후 이용가능한 서비스입니다.");
			}
	
		});
			
	}
	

</script>
