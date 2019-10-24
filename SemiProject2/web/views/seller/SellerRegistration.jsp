<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" import="seller.model.service.SellerService" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap css file -->
<link  	rel="stylesheet" 
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
		crossorigin="anonymous">
<!-- bootstrap js file -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<title>SellerRegistration Page</title>
<style type="text/css">
	.jumbotron{
		width:800px;
		height:auto;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
		border: 0px solid #22d;
		padding: 12px;
		text-align: left;
	}

	.field textarea {
		 position: relative; 
		 width: 300px; height: 118px; min-height: 118px; 
		 padding: 3px 3px 3px 6px; 
		 border: 1px solid #ececec; 
		 border-top-color: #e1e1e1; 
		 border-left-color: #e1e1e1; 
		 background: white; 
		 border-radius: 3px;
		-moz-border-radius: 3px; 
		-webkit-border-radius: 3px; 
	}

	footer {
		position : relative;
		
		
		top : 1150px;
		left: 0;
	}

	
</style>
</head>
<body onload="window.resizeTo(300,300)" onresize="window.resizeTo(300,300)">
	<%@ include file="/views/common/cateheader1.jsp" %>
	
	<!-- summit버튼이 눌렸을때 처리하기 위하여 seller.do 라는 경로를 설정한 서블릿을 호출 -->
	<form action="/semi/seller.do" method="post" style="margin-top:100px;">

		<div id="regist" class="jumbotron" style = "position: absolute; top:100px;left:20%; width:800px; height:auto;" align="center">
			<p class="lead">판매를 시작하여 수익을 올려보세요!!</p>
			<hr class="my-4">
			
			<div class="ui segment">
				<div class="ui two column very relaxed grid">
					<div class="column">
		    		<h5 class="modal-title">판매자 이미지 등록</h5>
					<br>
						<div id="titleImgArea">
							<img id="titleImg" width="350" height="200" text="">
						</div>
					<div class="fileArea" id="fileArea">
						<input type="file" id="thumbnailImg0" name="thumbnailImg0" onchange="loadImg(this, 1);" />
					</div>
					<br>
					<label>상자를 눌러 대표 이미지를 등록하세요</label>

					<script>
						// 사진 게시판 미리보기 기능 지원 스크립트 강사님거 가져옴
						$(function(){
							$('#fileArea').hide();
							$('#titleImgArea').click(() => {$('#thumbnailImg0').click();});
						});
						
						function loadImg(value, num){
							if(value.files && value.files[0])  {
								var reader = new FileReader();
								reader.onload = function(e){
									switch(num) {
									case 1 : $('#titleImg').attr('src', e.target.result);
										break;
									} 
								}
								reader.readAsDataURL(value.files[0]);
							}
						}
					</script>
				</div>
				
				<!-- phone번호를 받아오기 위하여 만들었다. -->
				<% 
					String email = m.getEmail();
					String phone = null;
					phone = new SellerService().phoneNB(email);
					System.out.println("JSP에서 받아왔나?"+phone);
				%>
				
				<div class="column">
				    <h5 class="modal-title">전화번호</h5>
				    <div class="ui input focus">
						<input type="text" id="phone" name="phone" placeholder="번호없음" value="<%= phone %>" readonly>
					</div>
					<h5 class="modal-title">연락가능시간</h5>
				    <div class="ui input focus">
						<input type="text" id="abletime" name="abletime" placeholder="10:00~16:00" value="">
					</div>
					<h5 class="modal-title">전문가소개</h5>
					<div class="inline field">
						<textarea rows="2" id="introtext" name="introtext" placeholder="간단하게 자기소개를 해주세요~" style="width:280px; height:80px;"></textarea>
						<div align="right" style="position: relative; left:-50px;">
							<label id="textCount">0</label>/100
						</div>
						
						<!-- 글자수를 표시하는 텍스트 -->
						<script>
					        $(function(){
					            $('textarea').keydown(function(){
					                var inputLength = $(this).val().length;
					
					                $('#textCount').html(inputLength);
					
					                if(inputLength >= 100){
					                    $('#textCount').css('color','red');
					                    alert("허용된 글자수를 초과하였습니다.");
					                }else {
					                    $('#textCount').css('color','black');
					                }
					
					            });
					        });
					    </script>
					</div>
				</div>
			</div>
		</div>
		
		<!-- career part -->
		<h5 class="modal-title">경력 사항</h5>
		<div class="ui segment">
		<!-- 테이블로 이력 정렬 -->
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">기간</th>
						<th scope="col">내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="ui input focus">
							<input type="text" name="careerdate1" placeholder="예) 2019/01/01~2019/12/31" value="" style="width:230px; height:30px;">
							</div>
						</td>
						<td>
							<div class="ui input focus">
							<input type="text" name="career1" placeholder="예) 주식회사 TMI" value="" style="width:230px; height:30px;">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="ui input focus">
							<input type="text" name="careerdate2" placeholder="예) 2019/01/01~2019/12/31" value="" style="width:230px; height:30px;">
							</div>
						</td>
						<td>
							<div class="ui input focus">
							<input type="text" name="career2" placeholder="예) 주식회사 TMI" value="" style="width:230px; height:30px;">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="ui input focus">
							<input type="text" name="careerdate3" placeholder="예) 2019/01/01~2019/12/31" value="" style="width:230px; height:30px;">
							</div>
						</td>
						<td>
							<div class="ui input focus">
							<input type="text" name="career3" placeholder="예) 주식회사 TMI" value="" style="width:230px; height:30px;">
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	
		<!-- certificate part -->
		<h5 class="modal-title">자격증</h5>
		<div class="ui segment">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">자격증명</th>
					</tr>
				</thead>
				<!-- 테이블로 자격증정렬 -->
				<tbody>
					<tr>
						<td>
							<div class="ui input focus">
							<input type="text" name="certificat1" placeholder="예) 정보처리기사" value="" style="width:230px; height:30px;">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="ui input focus">
							<input type="text" name="certificat2" placeholder="예) 컴퓨터 활용능력 1급" value="" style="width:230px; height:30px;">
							</div>
						</td>
					</tr>
					<tr> 
						<td>
							<div class="ui input focus">
							<input type="text" name="certificat3" placeholder="예) 잔반처리기사" value="" style="width:230px; height:30px;">
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	
		<div align="right">
		<hr class="my-4">
		<!-- next 버튼이 늘렸을때 유효성 검사를 위해 onclick="firstpartValidation(); 삽입 -->
		<a class="btn btn-primary btn-lg" id="nextButton" role="button" href="#">저장 및 다음단계</a>
		</div>
	</div>
	
	<div id="account" class="jumbotron" style = "position: absolute; top:100px;left:20%; width:800px; height:auto;" align="center" hidden>

		<p class="lead">판매를 시작하여 수익을 올려보세요!!</p>
		<hr class="my-4">
		<div class="ui segment">
			<div class="ui two column very relaxed grid">
				<div class="column">
					<h5 class="modal-title">계좌정보</h5>
					<div class="form-row align-items-center">
						<div class="col-auto my-1">
							<select class="custom-select mr-sm-2" id="bankname" name="bankname">
								<option selected value="0">은행명</option>
								<option value="신한은행">신한은행</option>
								<option value="국민은행">국민은행</option>
								<option value="우리은행">우리은행</option>
								<option value="외환은행">외환은행</option>
								<option value="기업은행">기업은행</option>
								<option value="하나은행">하나은행</option>
								<option value="카카오뱅크">카카오뱅크</option>
							</select>
							<br><br><br>
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div>
						<br>
						<div>
							<label>계좌번호</label><br>
							<div class="ui input focus">
								&nbsp;
								<input type="text" id="bankNumber" name="bankNumber" onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" placeholder="-없이 입력해 주세요" value="">
							</div>
						</div>
						<br>
						<div>
							<label>예금주</label><br>
							<div class="ui input focus">
								&nbsp;
								<input type="text" id="bankPerson" name="bankPerson" placeholder="실명을 입력해주세요" value="">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="column">
				<h5 class="modal-title">약관 동의</h5>
				<br>
				<div class="ui form">
					<div class="inline field">
			  			<textarea rows="2" readonly>여러분을 환영합니다.
TMI 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 TMI 서비스의 이용과 관련하여 TMI 서비스를 제공하는 TMI 주식회사(이하 ‘TMI’)와 이를 이용하는 TMI 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 TMI 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
TMI 서비스를 이용하시거나 TMI 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.

다양한 TMI 서비스를 즐겨보세요.
TMI는 www.naver.com을 비롯한 TMI 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다.
여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 TMI 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, TMI 웹고객센터(이하 ‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다.

TMI는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만, '청소년보호법' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.

TMI 서비스에는 기본적으로 본 약관이 적용됩니다만 TMI가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우(예, TMI페이, V LIVE 등)가 있습니다. 그리고 TMI 계열사가 제공하는 특정 서비스의 경우에도(예, LINE, SNOW등) 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다.

회원으로 가입하시면 TMI 서비스를 보다 편리하게 이용할 수 있습니다.
  						</textarea>
		  				<div class="ui checkbox">
							<input type="checkbox" id="check">
							<label>약관에 동의합니다.</label>
						</div>
	  				</div>
				</div>
			</div>
		</div>
		<div class="ui vertical divider">★</div>
		</div>
		
		<br><br>
		<a class="btn btn-primary btn-lg" id="backButton" role="button" href="#">뒤로가기</a>
		<div align="right">
			<hr class="my-4">
			<input type="submit" onclick=lastValidation(); value="등록하기" class="btn btn-success" style="width:180px; height:50px; font-size:20px;"/>
			
		</div>
	</div>
	</form>

	<!--  button part //  next Btn , regist Btn -->
	<script>
		//유효성 처리를 위해 우선 공백을 넣으면 안되는 것들부터 잡음
			var phone = document.getElementById("phone");
			var abletime = document.getElementById("abletime");
			var introtext = document.getElementById("introtext");
			var bankNumber = document.getElementById("bankNumber");
			var bankPerson = document.getElementById("bankPerson");
			
			
			//은행 선택
			var checkSelectValue = "";
			$('#bankname').change(SelectBank);
			function SelectBank(){
				var value = $('option:selected').val(); 
				console.log(value);
				checkSelectValue = value;
				
			}

		// next버튼 눌렸을때 동작	
	    document.getElementById("nextButton").addEventListener("click", function() {
	    	if(phone.value==""||phone.value.length==0){
				alert("전화번호를 입력해 주세요");
				return false;
			} else if(abletime.value==""||abletime.value.length==0){
				alert("연락가능시간을 입력해 주세요");
				return false;
			} else if(introtext.value==""||introtext.value.length==0){
				alert("전문가 소개를 입력해 주세요");
				return false;
			}else{
		        document.getElementById("regist").hidden = true;
		        document.getElementById("account").hidden = false;}}, false);
	    
		//뒤로가기 버튼이 눌렸을때 동작
	    document.getElementById("backButton").addEventListener("click", function() {
		    	document.getElementById("regist").hidden = false;
		    	document.getElementById("account").hidden = true;}, false);  
	    
		// 등록하기 버튼이 눌렸을때 동작
	    $('form').submit(function(event){
	    	if(checkSelectValue==0){
				alert("은행을 선택해주세요");
				return false;
			} else if(bankNumber.value==""||bankNumber.value.length==0){
				alert("계좌번호를 입력해 주세요");
				return false;
			} else if(bankPerson.value==""||bankPerson.value.length==0){
				alert("예금주를 입력해 주세요");
				return false;
			} else if($("#check").is(":checked") == false){
				alert("약관 동의를 해주세요");
				return false;
			}
        });

	</script>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>