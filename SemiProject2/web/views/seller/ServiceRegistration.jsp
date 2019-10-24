<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap css 파일 추가하기 -->
<link  	rel="stylesheet" 
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
		crossorigin="anonymous">
<!-- bootstrap js 파일 추가하기 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


<title>SellerServicergration Page</title>
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
	
	
	.ui checkbox{
		text-align: right;
	}
	
	.field textarea {
		 position: relative; 
		 width: 340px; height: 118px; min-height: 118px; 
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
		position: absolute;
		bottom: -600px;
		left: 0;
	}
	
</style>
</head>
<body>
	<%@ include file="/views/common/cateheader1.jsp" %>

<form action="/semi/sellerboard.do" method="post" style="margin-top:100px;" onsubmit="postForm()" enctype="multipart/form-data">
<!-- 대현씨가 만든 방식도 훌륭하지만 이것의 전제는 번호를 제대로 받아온다는 전제다. 하지만 여러가지 방법을 시도해보았을 때 문제점을 파악할수가 없어 창선이 방식대로 하였다. 양해 해주길... -->
	<div id="Servicerg" class="jumbotron" style = "position: absolute; top:100px;left:550px; width:800px; height:auto;" align="center">
	<p class="lead">판매를 시작하여 수익을 올려보세요!!</p>
	<hr class="my-4">
	<h5 class="modal-title">&nbsp;&nbsp;기본사항</h5>
	<div class="ui segment">
		<div class="ui two column very relaxed grid">
			<div class="column">
			    <h5 class="modal-title">서비스 제목</h5>
			    <br><br>
			    <hr class="my-4">
			    
			    <h5 class="modal-title">카테고리</h5>
			</div>
			
			<div class="column">
			    <div class="ui input focus">
					<input type="text" id="mainTitle" name="btitle" placeholder="예) 마음을 담아 재미있고 개성있는 캐리커쳐를 그려 드립니다." style="position: relative; left:-200px; width:500px; height:40px;" value="">
				</div>
				<br><br><br>
			    <h5 class="modal-title" style="position: relative; left:-200px; width:500px; height:40px;">상위카테고리</h5>
			    <div class="col-auto my-1">
					<select class="custom-select mr-sm-2" id="category1" name="category1_code" style="position: relative; left:-200px; width:250px; height:40px;">
						<!-- selected value="0" 으로 둔것은 밑에 유효성 검사를 할때 사용하기 위함이다 -->
						<option selected value="0">선택해주세요</option>
						<option value="10">디자인</option>
						<option value="20">IT/프로그래밍</option>
						<option value="30">마케팅</option>
						<option value="40">콘텐츠 제작</option>
						<option value="50">번역/통역</option>
						<option value="60">문서/취업</option>
						<option value="70">기프트/커스텀</option>
					</select>
					<br><br><br>
				</div>
				
			    <h5 class="modal-title" id=submu style="position: relative; left:-200px; width:500px; height:40px; display: none;">하위카테고리</h5>
			    <div class="col-auto my-1">
					<select class="custom-select mr-sm-2" id="category21" name="category2_code"style="position: relative; left:-200px; width:250px; height:40px; display: none;">
						<option selected value="0">선택해주세요</option>
						<option value="11">로고 디자인</option>
						<option value="12">의류 디자인</option>
						<option value="13">간판 디자인</option>
						<option value="14">일러스트</option>
						<option value="15">웹툰</option>
					</select>
					
					<select class="custom-select mr-sm-2" id="category22" name="category2_code" style="position: relative; left:-200px; width:250px; height:40px; display: none;">
						<option selected value="0">선택해주세요</option>
						<option value="21">웹 사이트 개발</option>
						<option value="22">프로그램 개발</option>
						<option value="23">서버 및 기술지원</option>
						<option value="24">게임</option>
						<option value="25">모바일웹</option>
					</select>
					
					<select class="custom-select mr-sm-2" id="category23" name="category2_code" style="position: relative; left:-200px; width:250px; height:40px; display: none;">
						<option selected value="0">선택해주세요</option>
						<option value="31">sns 마케팅</option>
						<option value="32">종합 광고 대행</option>
						<option value="33">블로그</option>
						<option value="34">마케팅 노하우</option>
						<option value="35">유투브 크리에이터</option>
					</select>
					
					<select class="custom-select mr-sm-2" id="category24" name="category2_code" style="position: relative; left:-200px; width:250px; height:40px; display: none;">
						<option selected value="0">선택해주세요</option>
						<option value="41">영상</option>
						<option value="42">더빙/녹음</option>
						<option value="43">음악/사운드</option>
						<option value="44">엔터테이너</option>
						<option value="45">사진</option>
					</select>
					
					<select class="custom-select mr-sm-2" id="category25" name="category2_code" style="position: relative; left:-200px; width:250px; height:40px; display: none;">
						<option selected value="0">선택해주세요</option>
						<option value="51">번역</option>
						<option value="52">영상번역</option>
						<option value="53">통역</option>
					</select>
					
					<select class="custom-select mr-sm-2" id="category26" name="category2_code" style="position: relative; left:-200px; width:250px; height:40px; display: none;">
						<option selected value="0">선택해주세요</option>
						<option value="61">논문</option>
						<option value="62">타이핑</option>
						<option value="63">글작성/대본</option>
						<option value="64">면접 취업코딩</option>
						<option value="65">자소서/이력서</option>
					</select>
					
					<select class="custom-select mr-sm-2" id="category27" name="category2_code" style="position: relative; left:-200px; width:250px; height:40px; display: none;">
						<option selected value="0">선택해주세요</option>
						<option value="71">라이프</option>
						<option value="72">패션</option>
						<option value="73">푸드</option>
					</select>
					<br><br><br>
				</div>
			</div>
		</div>
		</div>	
		<div align="right">
			<hr class="my-4">
			<a class="btn btn-primary btn-lg" id="next1Button" role="button" href="#" >저장 및 다음단계</a>
		</div>
   
	</div>

	<div id="amount" class="jumbotron" style = "position: absolute; top:100px;left:550px; width:800px; height:auto;" align="center" hidden>
		<p class="lead">판매를 시작하여 수익을 올려보세요!!</p>
		<hr class="my-4">
		<h5 class="modal-title">가격설정</h5>
		<div class="ui segment">
			<div class="ui two column very relaxed grid">
				<div class="column">
				    <h5 class="modal-title">금액</h5>
				    <br><br>
				</div>
				<br>
				<div class="column">
				    <div class="ui input focus" style="position: relative; left:-200px; width:200px; height:40px;">
						₩ &nbsp;&nbsp; <input type="text" id="sellerAmount" name="price" onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" placeholder="예) 1000" value="">
					</div>
				</div>
				<br>
				<div class="column">
				    <h5 class="modal-title">수정횟수</h5>
				    <br><br>
				</div>
				<div class="column">
				    <div class="ui input focus" style="position: relative; left:-180px; width:180px; height:40px;">
						<input type="text" id="editCount" name="editablecount" onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" placeholder="예) 1" value=""> &nbsp;&nbsp;회
					</div>
				</div>
				<br>
				<div class="column">
				    <h5 class="modal-title">작업기간</h5>
				    <br><br>
				</div>
				<div class="column">
				    <div class="ui input focus" style="position: relative; left:-180px; width:180px; height:40px;">
						<input type="text" id="dueDate" name="duedate" onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" placeholder="예) 30" value=""> &nbsp;&nbsp;일
					</div>
				</div>
				
			</div>	
		</div>
		<h5 class="modal-title">&nbsp;&nbsp;추가옵션</h5>
		<div class="ui segment">
			<div class="ui two column very relaxed grid">
				<div class="column">
				    <h5 class="modal-title">빠른작업</h5>
				    <br><br>
				    <h5 class="modal-title">추가수정</h5>
				</div>
				
				<div class="column">
					<div class="col-auto my-1">
						<!-- 빠른작업 -->
						<select class="custom-select mr-sm-2" id="speed" name="speed" style="position: relative; left:-200px; width:150px; height:40px;">
							<option selected value="0">가격선택</option>
							<option value="10000">10,000원</option>
							<option value="20000">20,000원</option>
							<option value="30000">30,000원</option>
							<option value="50000">50,000원 </option>
							<option value="판매자">판매자와 상의하세요</option>
						</select>
						
						
						<div id=speed1 class="column" hidden>
							<label style="position:absolute; top :10px; left:-10px;">추가시</label>
						    <div class="ui input focus" style="position:absolute; top :0px; left:60px; width:140px; height:40px;" >
								<input type="text" id="extradate1" name="extradate1" onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" placeholder="예) 10" value="" > &nbsp;&nbsp;일
							</div>
						</div>
						
						<script type="text/javascript">
						$("#speed").on("change", function(){
							// value 값으로 선택
							var valu1=$('#speed').val();
							console.log("speed : "+valu1);
							if(valu1==0){
								document.getElementById('speed1').hidden = true;
							}else{
								document.getElementById('speed1').hidden = false;
							}
						});
						</script>
			
						<br><br><br><br>
						<!-- 추가수정 부분 -->
						<select class="custom-select mr-sm-2" id="plusedit" name="plusedit" style="position: relative; left:-200px; width:150px; height:40px;">
							<!-- selected value="0" 으로 둔것은 밑에 유효성 검사를 할때 사용하기 위함이다 -->
							<option selected value="0">가격선택</option>
							<option value="10000">10,000원</option>
							<option value="20000">20,000원</option>
							<option value="30000">30,000원</option>
							<option value="50000">50,000원</option>
							<option value="판매자">판매자와 상의하세요</option>
						</select>
						
						<div id="plusedit1" class="column" hidden>
							<label style="position:absolute; top :125px; left:-10px;">추가시</label>
						    <div class="ui input focus" style="position:absolute; top :115px; left:60px; width:140px; height:40px;">
								<input type="text" id="extradate2" name="extradate2" onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" placeholder="예) 3" value=""> &nbsp;&nbsp;회
							</div>
						</div>
						
						<script type="text/javascript">
						$("#plusedit").on("change", function(){
							// value 값으로 선택
							var valu2=$('#plusedit').val();
							console.log("plusedit : "+valu2);
							if(valu2==0){
								document.getElementById('plusedit1').hidden = true;
							}else{
								document.getElementById('plusedit1').hidden = false;
							}
						});
						</script>
						
						
					</div>
					
				</div>
			</div>	
		</div>
		<br><br>
		<a class="btn btn-primary btn-lg" id="backButton1" role="button" href="#">뒤로가기</a>
		<div align="right">
		<hr class="my-4">
		<a class="btn btn-primary btn-lg" id="next2Button" role="button" href="#" >저장 및 다음단계</a>
		</div>
	
	</div>
	
	<!-- 수정 및 재진행 안내와 취소및 환불규정 -->
		<div id="requestbuyer" class="jumbotron" style = "position: absolute; top:100px;left:550px; width:800px; height:auto;" align="center" hidden>
		<p class="lead">판매를 시작하여 수익을 올려보세요!!</p>
		<hr class="my-4">
		<h5 class="modal-title">작업 전 요청사항</h5>
		<div class="ui segment">
			<div class="inline field">
				<textarea rows="2" id="requesttobuyer" name="requesttobuyer" placeholder="작업 전 구매자에게 알려줄 내용을 입력해 주세요~" style="width:700px; height:80px;"></textarea>
				<div align="right" style="position: relative; left:-50px;">
					<label id="textCount1">0</label>/1500
				</div>
				
				<!-- 글자수를 표시하는 텍스트 -->
				<script>
			        $(function(){
			            $('#requesttobuyer').keydown(function(){
			                var inputLength1 = $(this).val().length;
			
			                $('#textCount1').html(inputLength1);
			
			                if(inputLength1 >= 1500){
			                    $('#textCount1').css('color','red');
			                    alert("허용된 글자수를 초과하였습니다.");
			                }else {
			                    $('#textCount1').css('color','black');
			                }
			
			            });
			        });
			    </script>
			</div>
		</div>
		
		<!-- 수정 및 재진행 안내 -->
		<h5 class="modal-title">수정 및 재진행 안내</h5>
		<div class="ui segment">
			<div class="inline field">
				<textarea rows="2" id="erecontent" name="erecontent" placeholder="수정 및 재진행에 관한 규정을 설명해 주세요~" style="width:700px; height:80px;"></textarea>
				<div align="right" style="position: relative; left:-50px;">
					<label id="textCount2">0</label>/1500
				</div>
				
				<!-- 글자수를 표시하는 텍스트 -->
				<script>
			        $(function(){
			            $('#erecontent').keydown(function(){
			                var inputLength2 = $(this).val().length;
			
			                $('#textCount2').html(inputLength2);
			
			                if(inputLength2 >= 1500){
			                    $('#textCount2').css('color','red');
			                    alert("허용된 글자수를 초과하였습니다.");
			                }else {
			                    $('#textCount2').css('color','black');
			                }
			
			            });
			        });
			    </script>
			</div>
		</div>
		<h5 class="modal-title">&nbsp;&nbsp;취소 및 환불 규정</h5>
		<div class="ui segment">
			<div class="ui two column very relaxed grid">
				<div class="column">
				    <h5 class="modal-title">취소규정</h5>
				    <br>
				    <div class="inline field">
			  			<textarea rows="2" readonly>사업자의 상품대금 환급 의무
 인터넷쇼핑몰 사업자는 다음의 어느 하나에 해당하는 날부터 3영업일 이내에 이미 지급 받은 물품 등의 대금을 환급해야 합니다. 만약 물건의 대금 환급을 지연하면 그 지연기간에 대해 연 15％의 지연이자를 별도로 지급해야 합니다(규제「전자상거래 등에서의 소비자보호에 관한 법률」 제18조제2항 및 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제21조의3).
 통신판매업자가 재화를 공급한 경우에는 재화를 반환받은 날
 통신판매업자가 용역 또는 디지털콘텐츠를 공급한 경우에는 청약철회 등을 한 날
 통신판매업자가 재화 등을 공급하지 않은 경우에는 청약철회 등을 한 날
※ 이미 공급받은 상품 등이 용역 또는 디지털콘텐츠인 경우를 제외하고 환불요청을 받으면 소비자는 이미 받은 물건을 반환해야 합니다(규제「전자상거래 등에서의 소비자보호에 관한 법률」 제18조제1항).
신용카드·전자상품권 등으로 결제한 경우
 소비자가 신용카드나 그 밖의 결제수단으로 물품 등의 대금을 지급한 경우 인터넷쇼핑몰 사업자는 그 대금을 환급할 때 지체 없이 해당 결제수단을 제공한 결제업자에게 그 물품 등의 대금 청구를 정지 또는 취소하도록 요청해야 합니다(규제「전자상거래 등에서의 소비자보호에 관한 법률」 제18조제3항 본문).
 인터넷쇼핑몰 사업자가 신용카드사 등의 결제업자로부터 물품 등의 대금을 이미 지급받은 경우에는 지체 없이 이를 결제업자에게 환급하고, 그 사실을 소비자에게 알려야 합니다(규제「전자상거래 등에서의 소비자보호에 관한 법률」 제18조제3항 단서).
 이 경우 사업자가 정당한 사유 없이 결제업자에게 대금을 환급하지 않으면 소비자는 환급받을 금액에 대해 결제업자에게 해당 인터넷쇼핑몰 사업자에 대한 다른 채무와 상계할 것을 요청할 수 있습니다(규제「전자상거래 등에서의 소비자보호에 관한 법률」 제18조제6항).
 만약, 결제업자가 위 상계요청을 정당한 사유 없이 게을리 한다면 소비자는 그 결제업자에 대해 대금의 결제를 거부할 수 있습니다. 이 경우 인터넷쇼핑몰 사업자와 결제업자는 그 결제의 거부를 이유로 해당 소비자를 약정한 기일 이내에 채무를 변제하지 않은 사람(연체자나 신용불량자 등)으로 처리하는 등 소비자에게 불이익을 주는 행위를 해서는 안 됩니다(규제「전자상거래 등에서의 소비자보호에 관한 법률」 제18조제7항).
인터넷쇼핑몰의 휴업기간 및 영업정지기간 중의 반품
 인터넷쇼핑몰 사업자는 휴업기간이나 영업정지기간에도 주문취소 및 반품 등의 업무와 대금 환급과 관련된 업무를 계속해야 합니다(규제「전자상거래 등에서의 소비자보호에 관한 법률」 제22조제1항).
 공정거래위원회는 사업자가 위를 위반하는 행위를 하는 경우에는 해당 사업자에게 그 시정조치를 명할 수 있습니다(규제「전자상거래 등에서의 소비자보호에 관한 법률」 제32조제1항제1호).

  						</textarea>
		  				<div class="ui checkbox">
							<input type="checkbox" id="check1">
							<label>위 내용을 확인하였습니다.</label>
						</div>
	  				</div>
				</div>
				
				<div class="column">
					<div class="col-auto my-1" style="position: relative; left:-20px; top:-5px">
						<h5 class="modal-title">환불규정</h5>
						<br>
						<div class="inline field">
			  				<textarea rows="2" readonly> 일반적으로 소비자는 자신이 체결한 전자상거래 계약에 대해 그 계약의 내용을 불문하고 그 청약철회 및 계약해제의 기간(통상 7일) 내에는 청약철회 등을 자유롭게 할 수 있습니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제1항).
※ 소비자에게 불리한 규정(주문 취소나 반품 금지 등)이 포함된 구매계약은 효력이 없습니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제35조).
 하지만, 다음 어느 하나에 해당하는 경우에는 인터넷쇼핑몰 사업자의 의사에 반(反)해서 주문 취소 및 반품을 할 수 없습니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제2항 본문 및 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제21조).
1. 소비자의 잘못으로 물건이 멸실(물건의 기능을 할 수 없을 정도로 전부 파괴된 상태)되거나 훼손된 경우(다만, 내용물을 확인하기 위해 포장을 훼손한 경우에는 취소나 반품이 가능)
2. 소비자가 사용해서 물건의 가치가 뚜렷하게 떨어진 경우
3. 시간이 지나 다시 판매하기 곤란할 정도로 물건의 가치가 뚜렷하게 떨어진 경우
4. 복제가 가능한 물건의 포장을 훼손한 경우
5. 용역 또는 「문화산업진흥 기본법」 제2조제5호의 디지털콘텐츠의 제공이 개시된 경우. 다만, 가분적 용역 또는 가분적 디지털콘텐츠로 구성된 계약의 경우에는 제공이 개시되지 않은 부분은 제외
6. 소비자의 주문에 따라 개별적으로 생산되는 상품 또는 이와 유사한 상품 등의 청약철회 및 계약해제를 인정하는 경우 인터넷쇼핑몰 사업자에게 회복할 수 없는 중대한 피해가 예상되는 경우로서 사전에 주문 취소 및 반품이 되지 않는다는 사실을 별도로 알리고 소비자의 서면(전자문서 포함)에 의한 동의를 받은 경우
 인터넷쇼핑몰 사업자는 위 2.부터 5.까지의 사유에 해당하여 청약철회 등이 불가능한 상품에 대해 그 사실을 상품의 포장이나 그 밖에 소비자가 쉽게 알 수 있는 곳에 명확하게 적거나 시험 사용 상품을 제공하는 등의 방법으로 청약철회 등의 권리 행사가 방해받지 않도록 조치해야 합니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제6항 본문). 만약 사업자가 이와 같은 조치를 안했다면, 소비자는 청약철회 등의 제한사유에도 불구하고 청약철회 등을 할 수 있습니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제2항 단서).
 다만, 위의 5. 중 디지털콘텐츠에 대하여 소비자가 청약철회 등을 할 수 없는 경우에는 청약철회 등이 불가능하다는 사실의 표시와 함께 다음의 어느 하나의 방법에 따라 시험 사용 상품을 제공하는 등의 방법으로 청약철회 등의 권리 행사가 방해받지 않도록 해야 합니다(「전자상거래 등에서의 소비자보호에 관한 법률」 제17조제6항 단서 및 규제「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제21조의2).
	  						</textarea>
			  				<div class="ui checkbox">
								<input type="checkbox" id="check2">
								<label>위 내용을 확인하였습니다.</label>
							</div>
	  					</div>
						<br>
						
					</div>
				</div>
			</div>
			<div class="ui vertical divider">★</div>
		</div>
		<br><br>
		<a class="btn btn-primary btn-lg" id="backButton2" role="button" href="#">뒤로가기</a>
		<div align="right">
		<hr class="my-4">
		<a class="btn btn-primary btn-lg" id="next3Button" role="button" href="#" >저장 및 다음단계</a>
		</div>
	
	</div>
	
	
	
	<!-- 본문 글 동록부분 -->	
	<div id="board" class="jumbotron" style = "position: absolute; top:100px;left:550px; width:800px; height:auto;" align="center" hidden>
		<p class="lead">판매를 시작하여 수익을 올려보세요!!</p>
		<hr class="my-4">
		<h5 class="modal-title">이미지 등록</h5>
		<div class="ui segment">
			<h5 class="modal-title">메인 이미지 등록</h5>
			<br><br>
			<div id="titleImgArea">
				<img id="titleImg" width="350" height="200" text="">
			</div>
			<div class="fileArea" id="fileArea">
				<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this, 1);" />
			</div>
			<br>
			<label>상자를 눌러 대표 이미지를 등록하세요</label>

			<script>
				// 사진 게시판 미리보기 기능 지원 스크립트 강사님거 가져옴
				$(function(){
					$('#fileArea').hide();
					$('#titleImgArea').click(() => {$('#thumbnailImg1').click();});
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
		<h5 class="modal-title">서비스설명</h5>
		<div class="ui segment">
			<h5 class="modal-title">본문 내용</h5>
			<br><br>
			<textarea name="bcontent" style="display: none;"></textarea>
			<div id="summernote"></div>
		</div>
		<!-- summer note 를 사용하기 위함 -->
		<!-- form에 postForm()을 실행하여 값을 DB에 저장한다.  -->
		<script>
			$(document).ready(function() { $('#summernote').summernote(); });
		
			function postForm() {
			    $('textarea[name="bcontent"]').val($('#summernote').summernote('code'));
			}
		</script>
		
		<br><br>
		<a class="btn btn-primary btn-lg" id="backButton3" role="button" href="#">뒤로가기</a>
		<hr class="my-4">
		<div align="right">
			<input type="submit" value="등록하기" class="btn btn-success" style="width:180px; height:50px; font-size:20px;"/>
		</div>
	</div>
	</form>



	<!--  버튼 구현부분 next버튼 Servicerg 버튼 -->
	<script>
		//유효성 처리를 위해 우선 공백을 넣으면 안되는 것들부터 잡음
		var mainTitle= document.getElementById("mainTitle");
		var sellerAmount = document.getElementById("sellerAmount");
		var editCount = document.getElementById("editCount");
		var dueDate = document.getElementById("dueDate");
		
			//카테고리 선택 선택을 안하면 10,0
			var checkSelectValue = "";
			var checkSubSelectValue = "";
			$('#category1').change(Selectcategory1);
			$('#category21').change(Selectcategory2);
			$('#category22').change(Selectcategory2);
			$('#category23').change(Selectcategory2);
			$('#category24').change(Selectcategory2);
			$('#category25').change(Selectcategory2);
			$('#category26').change(Selectcategory2);
			
			function Selectcategory1(){
				var value1 = $('option:selected').val(); 
				console.log(value1);
				checkSelectValue = value1;

				//선택되었을때 View에 표시해줄것들 for-each구문으로 구현했었는데 문제가 값을 받아오는데 내머리가 터질것같아서 이렇게 구현함
				if(value1 == 10) {
					submu.style.display ="";
					category21.style.display = "";
					category22.style.display = "none";
					category23.style.display = "none";
					category24.style.display = "none";
					category25.style.display = "none";
					category26.style.display = "none";
					category27.style.display = "none";
				} else if(value1 == 20) {
					submu.style.display ="";
					category21.style.display = "none";
					category22.style.display = "";
					category23.style.display = "none";
					category24.style.display = "none";
					category25.style.display = "none";
					category26.style.display = "none";
					category27.style.display = "none";
				} else if(value1 == 30) {
					submu.style.display ="";
					category21.style.display = "none";
					category22.style.display = "none";
					category23.style.display = "";
					category24.style.display = "none";
					category25.style.display = "none";
					category26.style.display = "none";
					category27.style.display = "none";
				} else if(value1 == 40) {
					submu.style.display ="";
					category21.style.display = "none";
					category22.style.display = "none";
					category23.style.display = "none";
					category24.style.display = "";
					category25.style.display = "none";
					category26.style.display = "none";
					category27.style.display = "none";
				} else if(value1 == 50) {
					submu.style.display ="";
					category21.style.display = "none";
					category22.style.display = "none";
					category23.style.display = "none";
					category24.style.display = "none";
					category25.style.display = "";
					category26.style.display = "none";
					category27.style.display = "none";
				} else if(value1 == 60) {
					submu.style.display ="";
					category21.style.display = "none";
					category22.style.display = "none";
					category23.style.display = "none";
					category24.style.display = "none";
					category25.style.display = "none";
					category26.style.display = "";
					category27.style.display = "none";
				} else if(value1 == 70) {
					submu.style.display ="";
					category21.style.display = "none";
					category22.style.display = "none";
					category23.style.display = "none";
					category24.style.display = "none";
					category25.style.display = "none";
					category26.style.display = "none";
					category27.style.display = "";
				} else{
					submu.style.display ="none";
					category21.style.display = "none";
					category22.style.display = "none";
					category23.style.display = "none";
					category24.style.display = "none";
					category25.style.display = "none";
					category26.style.display = "none";
					category27.style.display = "none";
				}
			}
			
			//하위 카테고리의 값을 가져오는 기능 - 나중에 서블릿으로 넘김
			function Selectcategory2() {
				var value2; // $('option:selected').val();
					$('[id*=category2]').each(function(index, item){
						if($(item).css('display') != "none"){
							value2 = $(item);
							// console.log(item);
						}
					});
				console.log(value2.val());
				//category2_code 에 하위 카테고리값을 집어 넣어준다
				$('[name*=category2_code]').val(value2.val());
				checkSubSelectValue = value2;
			}
	
	    document.getElementById("next1Button").addEventListener("click", function() {
	    	if(mainTitle.value==""||mainTitle.value.length==0){
	    		alert("서비스 제목을 입력해 주세요");
				return false;
			} else if(checkSelectValue==0){
				alert("카테고리를 선택해 주세요");
				return false;
			} else if(checkSubSelectValue==0){
				alert("하위 카테고리를 선택해 주세요");
				return false;	
			}else{
	    		document.getElementById("Servicerg").hidden = true;
	        	document.getElementById("amount").hidden = false;}}, false);
	    
	    document.getElementById("next2Button").addEventListener("click", function() {
	    	if(sellerAmount.value==""||sellerAmount.value.length==0){
	    		alert("금액을 입력해 주세요");
				return false;
			} else if(editCount.value==""||editCount.value.length==0){
				alert("작업횟수를 선택해 주세요");
				return false;
			} else if(dueDate.value==""||dueDate.value.length==0){
				alert("작업기간을 선택해 주세요");
				return false;	
			}else{       
	    		document.getElementById("amount").hidden = true;
	        	document.getElementById("requestbuyer").hidden = false;}}, false);
	    
	    document.getElementById("next3Button").addEventListener("click", function() {
	    	if($("#check1").is(":checked") == false){
				alert("취소규정을 확인 해주세요");
				return false;
	    	} else if($("#check2").is(":checked") == false){
				alert("환불규정을 확인 해주세요");
				return false;
			} else{
	    	document.getElementById("requestbuyer").hidden = true;
        	document.getElementById("board").hidden = false;}}, false);
	    
	
	    document.getElementById("backButton1").addEventListener("click", function() {
	    	document.getElementById("Servicerg").hidden = false;
	    	document.getElementById("amount").hidden = true;}, false);   
	    
	    document.getElementById("backButton2").addEventListener("click", function() {
	    	document.getElementById("amount").hidden = false;
	    	document.getElementById("requestbuyer").hidden = true;}, false);
	    
	    document.getElementById("backButton3").addEventListener("click", function() {
	    	document.getElementById("requestbuyer").hidden = false;
	    	document.getElementById("board").hidden = true;}, false);
		
	    
	    // 작성완료 버튼이 눌렸을 때 동작
	    $('form').submit(function(event){
	    	if(bcontent.value==""||bcontent.value.length==0){
	    		alert("본문 내용을 입력해 주세요");
				return false;
			}
	    });
	    
    </script>	
	
	<script>
		$('#summernote').summernote({
			placeholder: '내용을 입력하세요',
			tabsize: 2,
			height: 300
			
		});
	</script>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>