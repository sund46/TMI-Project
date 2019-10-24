<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TMI 쿠폰</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<style>


	
	.coupontable, .ccount{
		width : auto;
		margin: 0 auto;
		margin-top : 20px;

	}
	
	.cpp1 {
		font-size:20px;
		font-weight:bold;
	}
	
	#cpinput{
		margin-left:35%;
	}
	
	
	
	
	
	
	
	
	
	.listcontent{
		padding:15px;
		padding-left:30px
	}
	
	
	.font-noto{
		font-family: 'Noto Sans KR', sans-serif;
    	font-weight: 400;
	}
	.my-page-buy{
		margin:0 auto;
	}
	.scontainer{

		width : 1024px;
		margin:0 auto;
		overflow : hidden;
	}
	.scontainer1{
		padding-left : 15px;
		padding-right : 15px;
		margin:0 auto;
	}
	.scontainer2{

		margin:0 auto;
		float : left;
	}
	
	.profile{
		margin-top:20px;
	}
	.width-25per{
		width:25%;

	}
	.width-75per{
		width:75%;

	}
	.user-profile-body{
		border: solid #E6E6E6 1px;
		border-bottom:none;
		text-align : center;
		padding-top : 20px;
	}
	.user-profile-box>li{
		border: solid #E6E6E6 1px;
		border-bottom:none;
		list-style : none;
		overflow : hidden;
	}
	
	.buy{
		margin-top : 40px;
	}
	.buyer-check{
		display: inline;
	    border-radius: 10px;
	    padding: 1px 7px 2px 7px;
	    font-size: 75%;
	    line-height: 1;
	    color: #fff;
	    text-align: center;
	    white-space: nowrap;
	    vertical-align: baseline;
	    background : #364559;
	}
	.padding-15{
		padding:0 15px;
	}
	.income-out{
		padding :15px 0;
	}
	.income-out>div{
		display : inline-block;
		
	}
	.income-out-div{
		text-align:left; 
		width:50%;
		padding-left:15px; 
		padding-right: 0px;
		float:left;
		
	}
	.won{
		text-align:right; 
		width:50%;
		padding-right:15px; 
		padding-left:0;
	}
	.menu-line{
		border: solid #E6E6E6 1px;
		border-bottom:none;
		overflow:hidden;
	}
	.menu-line>a{
		display : inline-block;
		width:50%;
		margin-bottom : 0;
		float:left;
	}
	.menu-box img{
		width : 40px;
	}

	.padding-all-15{
		padding : 15px;
	}
	.menu-slot{
		width:100%;
		
	}
	
	.detail-box{
	    border-bottom: solid #E6E6E6 1px !important;
	}
	.detail-list{
		border: solid #E6E6E6 1px !important;
		padding : 85px 0;
		text-align : center;
		margin-top : 20px;
	}
	.buying-history{
	    vertical-align: 1px;
	    font-size: 11px;
	    color: #878787;
	    padding: 1px 6px;
	    background-color: #ddd;
	    border-radius: 500px !important;
	}
	.active{
		background:#E8F0F5;
	}
	.select{
		background-color: #BDD4F2;
		color : #000;
	}
	
	.margin-bottom-15{
		margin-bottom:15px;
	}
	
	.margin-top-5{
		margin-top : 5px;
	}
	
	.link-color-blue{
		color:#FF5050;
	}
	
	.padding-left-20{
		padding-left:20px;
	}
	
	#cplist{
		letter-spacing : -2px;
		font-size : 13px;
	}

</style>

</head>
<body>
	<%@ include file="/views/common/cateheader2.jsp" %>
	
	<%
	DecimalFormat df = new DecimalFormat("###,###");
	int val = m.getCash();
	%>
	
<div class="my-page-buy">
		<div class="scontainer">
			<div class="scontainer1">
				<div class = "buy font-noto">
					<h3>구매</h3>
				</div>
			</div>
			<div class="scontainer2 width-25per">
					<div class="profile">
						<div class="padding-15">
						<div class="user-profile-body">
							<img src="/semi/resources/images/myprofile.png" style="border-radius: 500px;width:100px;height:100px"/>
						</div>
						<ul class="user-profile-box">
							<li style=" border-top:none;"><div style="text-align : center; margin-bottom:20px;">
								<div class="font-noto" style="margin-top:5px;margin-bottom:10px;"><a href="../member/memberUpdateForm.jsp"><%=m.getNickName() %></a></div>
								<br>
								<div class="font-color-lighter font-size-h6 font-noto">TMI캐시</div>
								<h3 class="margin-bottom-15 margin-top-5 link-color-blue NGB"><i class="won sign icon"></i><%=df.format(val)%> 원</h3>
								<div>
									<label class="buyer-check font-noto" style="cursor:pointer;" onclick="lbcash();"><i class="credit card outline icon"></i>캐시충전</label>
									
								</div>
							</div>
							</li>
							
						</ul>
					</div>
					<div class="menu-box">
						<div class="padding-15">
							<div class="menu-line" style="text-align:center">
								<a href="/semi/prging.bo?state=1" style="cursor:pointer"><div class="padding-all-15 menu-slot" style="border-right:solid #E6E6E6 1px;" onclick="nrequest();">							
									<div><img src="/semi/resources/images/buying_active.png" alt="" /></div>
									<h6>구매관리</h6>							
								</div></a>
								<a href="/semi/views/personBUY/cash.jsp"><div class="padding-all-15 menu-slot">
									<div><img src="/semi/resources/images/noun_won.png" alt="" /></div>
									<h6>TMI캐시</h6>			
								</div></a>
							</div>
							<div class="menu-line" style="text-align:center;border-bottom:solid #E6E6E6 1px;">
								<a style="cursor:pointer;"><div class="padding-all-15 menu-slot" style="border-right:solid #E6E6E6 1px;" onclick="billHist();">							
									<div><img src="/semi/resources/images/payment_active.png" alt="" /></div>
									<h6>캐시내역</h6>							
								</div></a>
								<a href="/semi/views/personBUY/coupon.jsp"><div class="padding-all-15 menu-slot active">
									<div><img src="/semi/resources/images/coupon_active.png" alt="" /></div>
									<h6>쿠폰</h6>			
								</div></a>
							</div>
						</div>
					</div>
					
				</div>
				
			</div>
			<div class="scontainer3 width-75per" style="float:left">
				<div class="padding-15">
					<h3 class="font-noto" style="font-weight:700; margin-top:3%">쿠폰</h3>
				</div>

				<div style="margin-top:20px;">
					<div class="padding-15 font-noto">
						
					<div class="ccount">
			<span class="cpp1">보유한 쿠폰 </span><span class="cpp1" style="color:red;">0</span><span class="cpp1">개</span>
				<div style="margin-top:20px">
					<div class="font-noto" style="padding: 0 71.5%;">
							<div class="ui icon input">
  							<input type="text" placeholder="프로모션 코드 입력">
							<i class="inverted circular search link icon"></i>
						</div>
					</div>
				</div>
				<p id="couponerr" style="text-align:right; color:tomato;"></p>
				
			</div>
					</div>
				</div>
					<div class="padding-15" style="margin-top:10px">
						<div class="detail-box">
							<div class="detail-list">
								<!-- 내역이 없을 때 -->
								<div><img src="/semi/resources/images/nothing.png" style="width:50px;vertical-align: middle;border:0" /></div>
								<h5 class="font-noto" style="margin:10px 0;">내역이 없습니다.</h5>

							</div>
						</div>
					</div>




<div class="purchaseListArea padding-15">
				
				<!-- 이 자리에 Arraylist로 반복문 넣어야 결제 내역이 목록화되어 나옴. -->
				<%--
					<div class="container1 clearFix">
			
			<div class="coupontable">
				<table class="ui blue table">
  <thead>
    <tr>
      <th>쿠폰명</th>
      <th>할인액</th>
      <th>적용조건</th>
      <th>유효기간</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>신규 가입 환영 쿠폰</td>
      <td><i class="won sign icon"></i>5,000원</td>
      <td>5,000원 이상 구매 시</td>
      <td>(가입일 + 10일)</td>
    </tr>
    <tr>
      <td>그냥 넣어본 칸</td>
      <td><i class="won sign icon"></i>1,000,000,000,000</td>
      <td>쿠폰의 금액 이상 구매 시</td>
      <td>(가입일 + 365일)</td>
    </tr>
    <tr id="addcoupon" hidden>
      <td>추가쿠폰!!!</td>
      <td><i class="won sign icon"></i>999,000,000,000,000</td>
      <td>쿠폰의 금액 이상 구매 시</td>
      <td>6/30까지</td>
    </tr>
  </tbody>
</table>

</div></div> --%>
					



		<br><br><br>
					
					<div class="row padding-15" style="width:auto;">
                            <div class="col-xs-12">
                                <div class="panel bg-color-main profits-panel-border border-radius-0 border-solid">
                                    <div class="panel-body" style="border:1px solid lightgray; background-color:#dcdcdc; margin-top:30px;">

                                        <h6 class="NGB margin-all-0 padding-bottom-5" style="font-size:17px;">
                                            <i class="bullhorn icon"></i>
                                            <b>꼭 확인해주세요!</b>
                                        </h6>
                                        <ul class="font-color-light margin-top-5 margin-top-5 margin-bottom-0 font-size-h6 padding-left-20">
                                     		<li id="cplist">주문 1회당 쿠폰 1개에 한하여 적용되며, 타 이벤트 할인과 중복 적용되지 않습니다</li>
											<li id="cplist">서비스 구매 시 총 결제 금액에서 할인이 적용되며, 쿠폰 금액 이상 구매 시 적용 가능합니다.</li>
											<li id="cplist">구매 금액에 따라 조건에 맞는 쿠폰을 발급받아 사용할 수 있으며, 할인 쿠폰별로 적용 대상이 다를 수 있습니다.</li>
											<li id="cplist">쿠폰 사용 후 다른 쿠폰으로의 변경은 불가합니다.</li>
										</ul>
                                    </div>
                                </div>
                            </div>
                        </div>
					
					
					
				</div>
				
				
				
			</div>
		</div>
		
		
		
		
		
		
	

	<script>
	
	// 발행 쿠폰 코드
	var couponMagNum = "hi hello";
	console.log("발행쿠폰: " + couponMagNum);
	
	
	// 쿠폰 번호 일치 여부 확인
	$('#couNum').click(function(event){

		
		//  일치하지 않을 때 || 입력하지 않았을 때
		if(($('#couponNumber').val() != couponMagNum)||($('#couponNumber').val() == "")){
			$('#couponerr').text('프로모션 코드를 다시 확인하세요.').show();
			
		}

		
		// 정상 입력 시
		else {
			$('#couponerr').text('알맞은 쿠폰 번호 입력').show();
			document.getElementById("addcoupon").hidden = false;
		}
		
		event.preventDefault();
	});
	
	
	function lbcash(){
		location.href="/semi/views/personBUY/cash.jsp";
	}
	
	function billHist(){
		location.href="/semi/cList.bo"
	}
	
	function nrequest(){
		location.href="/semi/nReq.bo"
	}

	</script>
	
	

	
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>