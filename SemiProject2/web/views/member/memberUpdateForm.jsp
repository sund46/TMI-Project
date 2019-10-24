<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<title>회원 정보 수정 페이지</title>
<style>
*{
font-family: 'Noto Sans KR', sans-serif;
}
.section1{
	margin: 0 auto;
}
.section2{
	margin: 0 auto;
	width:550px;
}
.section3{
	margin:0 auto;
	margin-left:30px;
	margin-top : 50px;
	margin-bottom: 30px;
}
.section4{
	margin:0 auto;
	padding:25px;
	margin-left:30px;
}
.section3>h3{
font-family: 'Noto Sans KR', sans-serif;
}
.section4>table{
display:inline-block;
}
.edit1>div{
padding:10px 20px;
}

</style>
<script src="/semi/resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
<%@ include file="../common/cateheader2.jsp" %>

<div class="section1">
	<div class="section2">
		<div class="section3">
			<h3>회원정보 수정</h3>
		</div>
		
		<div class="section4" style="width:450px; border: solid #E6E6E6 1px; border-radius: 5px;">
		<form id="mUpdate" action="/semi/mUpdate.do" method="post">
		
			<div class="edit1" style="margin:8px;">
				<div style="font-size:15px;">이메일 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= m.getEmail() %></div>
				<div class="ui input" style="font-size:15px;">변경할 PWD :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="userPwd" id="userPwd" style="width:200px; height:30px; border-radius:5px;"></div>
				<div class="ui input" style="font-size:15px;">변경할 PWD 확인 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="userPwd2" id="userPwd2" style="width:200px; height:30px; border-radius:5px;"></div>
				<div style="font-size:15px;">이름 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= m.getUserName() %></div>
				<div class="ui input" style="font-size:15px;">연락처 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="tel" name="phone" value="<%= m.getPhone()%>" style="width:200px; height:30px; border-radius:5px;"></div>
				<div><button class="ui button"><input type="submit" value="회원 정보 수정" style="border:none;"></button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 <button class="ui button"><input type="button" onclick="memberDel();" value="회원 탈퇴" style="border:none;">
				</div>
			</div>
		
		</form>
		
		</div>
		
	</div>
</div>
	
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		
		// 일반적으로 script 작성 구간은 어디가 되든 큰 문제는 없으나
		// HTML과 CSS가 웹 문서에 로드되는 시점을 고려한다면
		// head 영역이나 body의 최하단에 script를 작성하여
		// 로드된 이후, 로드 시점 에 동작함으로써
		// 웹 문서 표현의 속도를 높이는 방식을 권장한다.
		
		$(function(){
			

			
			$('input:checkbox').each(function(){
				
				if($.inArray($(this).val(), array) > -1)
					$(this).prop('checked', true);

			});
			
			// 변경 비밀번호 일치 여부 확인하기
			$('#mUpdate').submit(function(event){
				
				// 비밀번호가 일치하지 않을 때
				if($('#userPwd').val() != $('#userPwd2').val())
					$('#result').text('비밀번호가 일치하지 않습니다.').show().fadeOut(1000);
				
				// 비밀번호를 입력하지 않았을 때
				else if ($('#userPwd').val() == "")
					$('#result').text('비밀번호를 입력해주세요~').show().fadeOut(1000);
				
				// 정상 입력 시
				else return;
				
				event.preventDefault();
			});
			
			
		});
		
		// '회원 탈퇴' 버튼을 누를 경우 mDelete.do로 이동시키기
		function memberDel(){
			
			location.href = "/semi/mDelete.do";
			
		}
	</script>
</body>
</html>









