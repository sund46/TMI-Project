<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <script src="<%= request.getContextPath() %>/resources/js/jquery-3.4.1.min.js"></script>
 <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
 <style>
 .logo{
   width: 500px;
   text-align:center;
   margin:0 auto;
}
 </style>
 
 
 
<title>아이디 비밀번호 찾기</title>

</head>
<body>
<div class="Wrapper" style="margin: 0 auto; border-bottom: 4px solid #BDD4F2!important;">
   <div class="logo">
      <img src="/semi/resources/images/KakaoTalk_20190606_164601739.png" style="width:125px; cursor:pointer; margin-bottom: -9px;" onclick="toMain();">   
   </div>
</div>

 	
	<div id="serchContainer" style="display:flex;  align-items:center; flex-direction:column; margin-top:6%;">
		 <div class="panel panel-info" style="width:300px; height:240px; margin-bottom:41px;">
	            <div class="panel-heading" style="background:#BDD4F2;">
	              <h3 class="panel-title">아이디 찾기</h3>
	            </div>
	            <div class="panel-body"">
	          	
					<label for="sName">이름</label><br>
		           	<input type ="text" id="userName" name = "sName" class="form-control" style="width:100px; height:30px;margin-bottom:6px;">
		           	<label for="sSsn1">주민등록번호</label><br>
		            <input type = "text" id="userSSN1" name = "sSsn1" class="form-control" style="width:80px; height:30px; display:inline;">&nbsp;-&nbsp;<input type = "password" id="userSSN2"name = "sSsn2" class="form-control" style="width:80px; height:30px; display:inline;">
		            <input type="button" value="아이디 찾기" id="findIdBtn" class="btn btn-info"  data-toggle="modal" data-target=".bd-example-modal-sm" style="margin-top:14px;background:#364559; border:none;" onclick="findId();">
	            </div>
		</div>   
	  
	  
		<div class="panel panel-info" style="width:300px; height:301px;">
	            <div class="panel-heading" style="background:#BDD4F2;">
	              <h3 class="panel-title">비밀번호 찾기</h3>
	            </div>
	            <div class="panel-body">
	          	 
			    	<label for="sName">이메일</label><br>
		           	<input type = "text" name = "sEmail" id="sEmail" class="form-control" style="width:200px; height:30px; margin-bottom:5px;">
		           	<label for="sName">이름</label><br>
		            <input type = "text" name = "sName" id="sName"class="form-control" style="width:100px; height:30px; margin-bottom:5px;">
		            <label for="sName">주민등록번호</label><br>
		            <input type = "text" name = "sSSn1" id="sSSN1"class="form-control" style="width:80px; height:30px; display:inline;">&nbsp;-&nbsp;<input type = "password" name = "sSSN2" id="sSSN2"class="form-control" style="width:80px; height:30px; display:inline;">
		            
		            <input type="button" value="비밀번호 찾기" style="height:33px;margin-top:14px;background:#364559; border:none;" class="btn btn-info" onclick="isRightInfo()">
	      			<button id="popUpSetPwd" data-toggle="modal" data-target="#resetPwdModal" style="display:none;"></button>
	      			<button id="popUpFailMsg" data-toggle="modal" data-target="#myModal" style="display:none;"></button>
	            </div>
	     </div>
	</div>	  
	
	<!-- 숨겨져 있는 메세지 박스 -->
	<div class="modal fade bd-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-sm">
    	
	     	<div class="ui success message" id="idAlert" style="width:350px;height:100px; margin-top:100%; text-align:center; position:absolute; visibility:hidden;">
				 	 <i class="close icon" data-dismiss="modal" aria-label="Close"></i>
				 	 <div class="header">
				 	  	회원님의 이메일 주소 
				 	 </div>
				 	 <p style="font-size : 20px;"><strong id="successText"></strong></p>
				</div>
				
				<div class="ui negative message" id="idFailAlert" style="margin-top:100%; width:430px;height:70px;position:absolute; visibility:hidden;">
				 	 <i class="close icon" data-dismiss="modal" aria-label="Close"></i>
				 	 <div class="header">
						아이디 찾기 실패!
				  	 </div>
				     <p style="font-size : 16px;"><strong id="failText"></strong></p>
			    </div>
      
      			<div class="ui negative message" id="pwdFailAlert" style="margin-top:100%; width:430px;height:70px;position:absolute; visibility:hidden;">
				 	 <i class="close icon" data-dismiss="modal" aria-label="Close"></i>
				 	 <div class="header">
					 	비밀번호 찾기 실패!
				  	 </div>
				     <p style="font-size : 16px;"><strong id="pwdFailText"></strong></p>
			    </div>
      
      
      
       </div>
   </div>
   
	   <!-- Modal -->
	<div class="modal fade" id="resetPwdModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content" style="width:500px;">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalCenterTitle" style="display:inline-block">새 비밀번호 설정</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	       	 <label>새 비밀번호</label><br>
	       	 <input type="password" id="newPwd1" class="form-control" style="width:200px;"><br>
	       	 <label>비밀번호 확인</label><br>
	       	 <input type="password" id="newPwd2" class="form-control" style="width:200px"><br>
	       	 <label id="pwdResult" style="font-size:12px;"></label>
	       	 
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" id="resetPwdBtn">확인</button>
	      </div>
	    </div>
	  </div>
	</div>







	<%-- <%@ include file = "/views/common/footer.jsp" %> --%>
</body>
<script>
	// TMI 로고 클릭시 메인으로 보내는 함수
	function toMain(){
		location.href = "/semi/index.jsp";
	}
	
	// 아이디를 찾아주는 함수
	function findId(){
		$.ajax({
			url : "/semi/searchId.do",
			type : "post",
			data : {userName: $('#userName').val(), userSSN1: $('#userSSN1').val(), userSSN2: $('#userSSN2').val()},
			success : function(data){
		
				var emailRegEx = /@+/;
				
				if(emailRegEx.test(data)){
					
					$('#successText').html(data); 
					$('#idAlert').css('visibility','visible');
				}else{
					
					$('#failText').html(data);
					$('#idFailAlert').css('visibility','visible');
				}
				
			}, error : function(){
				alert("아이디 찾기에서 에러");
			}
	
		});

 }
	
	
	// modal hidden 될 때 기존 팝업메세지들 hidden으로 변경
	$('#myModal').on('hidden.bs.modal', function (e) {
		$('#idAlert').css('visibility','hidden');
		$('#idFailAlert').css('visibility','hidden');
		$('#pwdFailAlert').css('visibility','hidden');
	});
	
	// 비밀번호 재설정 함수
	function isRightInfo(){
		// 입력한 정보의 이메일이 있는지 확인
		$.ajax({
			url : "/semi/searchPwd.do",
			type : "post",
			data : {sEmail : $('#sEmail').val(),sName : $('#sName').val(), sSSN1: $('#sSSN1').val(), sSSN2:$('#sSSN2').val()},
			success : function(data){
				
				var emailRegEx = /@+/;
				// 입력한 정보에 해당하는 이메일이 존재한다면?
				if(emailRegEx.test(data)){
				
					// 새 비번 입력하는 modal창 띄워줌
					$('#popUpSetPwd').trigger('click');
					
				
					$('#resetPwdBtn').on('click',function(){
						if(!isSamePwd($('#newPwd1').val(),$('#newPwd2').val())){
							alert("두 비밀번호가 같지 않습니다.")
						}else if(!pwdRegEx($('#newPwd1').val())){
							alert("규정에 맞지 않는 비밀번호입니다.")
						}else{
								$.ajax({
									url : "/semi/rePwd.do",
									type : "get",
									data : {email: $('#sEmail').val(), userPwd:$('#newPwd1').val()},
									success: function(){
										alert("비밀번호 변경이 완료되었습니다.");
										$('.close').trigger('click');
										location.href="/semi/views/member/memberSearch.jsp";
									},
									error: function(){
										alert("에러!");
									}
								
								}); 	
					      }
					   });
					
					
				}else{ // 그렇지 않다면?
					$('#popUpFailMsg').trigger('click');
					$('#pwdFailText').html(data);
					$('#pwdFailAlert').css('visibility','visible');
				
				}
		
			}, // 1차 success
			 error : function(){
				alert("에러어어");
			 }	// 1차 error
		}); // 1차 ajax
		
	}// 가장큰 함수
	
	// 비밀번호 유효성 체크 정규표현식 함수(영문,숫자,특수문자 8자리 이상 20자리 이하)
	function pwdRegEx(pwd){  
		var pwdRegEx = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
	
		return pwdRegEx.test(pwd);
	}
	
	// 두 비밀번호가 같은지 체크하는 함수
	function isSamePwd(pwd1,pwd2){
		if(pwd1 == pwd2){
			return true;
		}else return false;
		
	}
	
	// 비밀번호 유효성체크 이벤트 함수
	$('[id^="newPwd"]').change(function(){
		var pwd1 = $('#newPwd1').val();
		var pwd2 = $('#newPwd2').val();
	
		if(!isSamePwd(pwd1,pwd2)){
			$('#pwdResult').html("비밀번호가 일치하지 않습니다.").css('color','red');
		}else if(!pwdRegEx(pwd2)){
			$('#pwdResult').html("");
			$('#pwdResult').html("비밀번호는 숫자,영문 대소문자, 특수문자로 구성된 8자리 이상 20자리 이하이어야 합니다.").css('color','red');
		}else{
			$('#pwdResult').html("사용 가능한 비밀번호입니다.").css('color','green');
		}
		
	});
	
</script>


</html>