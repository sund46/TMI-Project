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





<style>

<style>
*{
   font-family: 'Noto Sans KR', sans-serif;
}
.logo{
   width: 500px;
   text-align:center;
   margin:0 auto;
}
.section1{
   margin:0 auto;
}
.section2{
   width : 1200px;
   margin:0 auto;
   margin-top: 50px;
}
.section3{
   margin:0 auto;
   padding:30px;
   position: relative; 
}
.section3>div{
   display:inline-block;
}
.join1{
  width:420px;
  border-right:2px solid #BDD4F2;
  margin-left:150px;
}
.join2{
  width:470px;
}
.email>div{
   width :300px; 
   height:40px; 
   display:inline-block;
}
.join1>form>p{
   font-size:15px;
   margin-top:14px;
   margin-bottom:3px;
   font-family: 'Noto Sans KR', sans-serif;
}
.check{
    margin-bottom: 132px;

}
input{margin-bottom: 9px;}
.term-box{
 font-family: 'Noto Sans KR', sans-serif;
   width:350px;
   height:160px;
   margin-left:15px;
   border-radius:3px;
}
   
   
</style>
<title>TMI - 회원가입 </title>
</head>


<body>
<div class="Wrapper" style="margin: 0 auto; border-bottom: 4px solid #BDD4F2!important;">
   <div class="logo">
      <img src="/semi/resources/images/KakaoTalk_20190606_164601739.png" style="width:125px; cursor:pointer; margin-bottom: -9px;" onclick="toMain();">   
   </div>
</div>

<div class="section1">
   <div class="section2">
      <div class="section3">
         <div class="join1">
            <form action="/semi/mInsert.do" method="post" onsubmit="return validate();" style="margin-top:-10px;">
            
               <p><b>이메일</b></p>
               <input type="email" name="email" id="email" style="width :268px; height:40px; display:inline-block;" required="required" placeholder="이메일을 입력해주세요" class="form-control"/>
               <input type="button" value="중복확인" id="emailDupCheckBtn" style="margin: -2px 0px 0px 7px; height:40px; background:#364559;" class="btn btn-primary"> 
               <input type="hidden" name="isSNS" id="isSNS" value="N">
               
               <p><b>비밀번호</b></p>
               <input type="password" name="userPwd" id="userPwd" style="width : 268px;  height:40px;" required="required" placeholder="비밀번호를 입력해주세요" class="form-control"/>
               
               <p><b>비밀번호 확인</b></p>
               <input type="password" name="userPwd2" id="userPwd2" style="width : 268px;  height:40px; margin-bottom:10px;" required="required" placeholder="비밀번호를 재입력해주세요" class="form-control"/>
               <label id="pwdResult" style="font-size:12px;  display:block;"></label>
               
               <p><b>이름</b></p>
               <input type="text" name="userName" style="width : 268px; height:37px;" required="required" class="form-control"/>
               
                 <p><b>주민등록번호</b></p>
                <input type="text" name="memberSSN1" id="memberSSN1" style="width :125px; height:37px; display:inline; margin-bottom:0px;" required="required" class="form-control"/>&nbsp; - &nbsp;<input type="password" name="memberSSN2" id="memberSSN2" style="width : 124px; height:37px; display:inline; margin-bottom:0px;" required="required" class="form-control"/>
                <label id="ssnResult"></label>
                
                <p><b>닉네임</b></p>
                <input type="text" name="nickName" id="nickName" class="form-control" required="required" style="width:268px;height:37px; display:inline-block;"/>
                <input type="button" value="중복확인" id="nickNameDupCheckBtn" style="margin: -2px 0px 0px 7px; height:40px; background:#364559;" class="btn btn-primary">
               <p><b>연락처</b></p>
               <input type="tel" name="phone1" required="required" style="width:77px; height:37px; display:inline;" class="form-control"/>&nbsp - &nbsp<input type="tel" name="phone2" required="required" style="width:77px; height:37px; display:inline;" class="form-control"/>&nbsp; - &nbsp;<input type="tel" name="phone3" required="required" style="width:76px; height:37px; display:inline;" class="form-control"/>
                <input type="submit" id="submitBtn" value=" 동의 후 회원 가입" class="btn btn-primary" style="text-align:center;width: 351px; height:45px; margin-left: 56px; margin-top:-10px;background:#364559;left:601px;position:absolute" disabled/> 
            </form>
            
         </div>
         <div class="join2">
            <div class="check" style="position:absolute;top:39px">
               <div class="custom-control custom-checkbox" style="margin-left:40px;font-family: 'Noto Sans KR', sans-serif;">
                  <input type="checkbox" class="custom-control-input" id="term1" onchange="isChecked();">
                   <label class="custom-control-label" for="term1">서비스 이용약관 동의 (필수)</label><br>   
                    <textarea class="term-box" readonly>제1조 (목적)
이 약관은 주식회사 TMI(이하 “회사”라고 합니다) 가 “TMI” 인터넷 서비스 마켓플레이스 사이트 (http://www.TMI.com, 이하 "TMI 사이트”라고 합니다)와 스마트폰 등 이동통신기기를 통해 제공되는 “TMI” 모바일 애플리케이션(이하 “모바일 TMI”이라고 합니다)을 통하여 제공하는 중개서비스 및 기타 정보서비스(이하 "서비스"라고 합니다)와 관련하여 회사와 회원간의 권리와 의무, 책임사항 및 회원의 서비스이용절차에 관한 사항을 규정함을 목적으로 합니다.

제2조 (약관의 명시, 효력 및 변경)

가. 회사는 본 약관의 내용과 상호, 회사소재지, 대표자의 성명, 사업자등록번호, 연락처 등을 서비스를 이용하고자 하는 자와 회원이 알 수 있도록 서비스가 제공되는 TMI 사이트의 초기화면(이하 연결화면 포함)에 게시합니다.

나. 회사가 이 약관을 개정하는 경우에는 개정된 약관의 적용일자 및 개정사유를 명시하여 현행 약관과 

함께 그 적용일자 7일(다만, 제5조 가. 2)의 회원에게 불리한 내용으로 변경하는 경우에는 30일) 이전부터 적용일자 전일까지 위 가항의 방법으로 공지합니다. 개정된 약관은 개정약관에서 소급효를 부여하지 않는 이상 적용일자 이전으로 소급하여 적용되지 아니합니다.

다. 이 약관은 회사와 회원간에 성립되는 서비스이용계약의 기본약정입니다. 회사는 필요한 경우 특정 서비스에 관하여 적용될 사항(이하 "개별약관"이라고 합니다)을 정하여 미리 공지할 수 있습니다. 회원이 이러한 개별약관에 동의하고 특정 서비스를 이용하는 경우에는 개별약관이 우선적으로 적용되고, 이 약관은 보충적인 효력을 갖습니다. 개별약관의 게시·변경에 관해서는 위 가항, 나항을 준용합니다. 단, 회사는 개별약관을 TMI 사이트의 판매관리 화면에 게시할 수 있습니다.

라. 회사는 특정 전문가와 개별적으로 이 약관 및 개별약관(이하 “약관 등”이라고 합니다)에 규정된 내용과 다른 내용의 계약(이하 “개별계약”이라고 합니다)을 체결할 수 있습니다. 이 경우 개별계약이 약관 등에 우선하여 적용됩니다. 회사는 개별계약을 체결한 전문가에게 계약내용을 서면(전자문서 포함)교부하거나 판매관리 화면에서 확인할 수 있도록 합니다.

제3조 (관련법령과의 관계)

가. 회사는 수수료(제29조의 판매서비스이용료 등 회사가 전문가에게 서비스를 제공한 대가로 전문가로부터 받는 일체의 금원을 말함) 및 판매촉진서비스이용료의 결정과 관련하여 다른 서비스 마켓 플레이스(오픈마켓 형태의 모든 서비스 포함) 사업자와 담합 등 불공정행위를 하지 않습니다.

나. 회사는 전문가에게 가격인하, 기획전 참여 등을 부당하게 강요하지 않습니다.

다. 회사는 전문가가 다른 서비스 마켓플레이스(오픈마켓 형태의 모든 서비스 포함) 사업자와 거래하지 못 하게 하거나 다른 서비스 마켓플레이스(오픈마켓 형태의 모든 서비스 포함) 사업자와 거래한다는 이유로 전문가에게 불이익을 제공하지 아니합니다.

제4조 (서비스의 종류)

회사가 회원에게 제공하는 서비스는 다음과 같습니다.

중개 서비스: 회사가 TMI 사이트와 모바일 TMI을 통하여 회원 상호간에 물품매매거래가 이루어질 수 있는 사이버 거래장소를 온라인으로 제공하는 서비스 및 관련 부가서비스 일체를 말합니다. 회사는 전문가의 물품판매의 촉진을 위한 관련 부가서비스로서 전문가의 상품노출을 위한 전시권 등 판매촉진서비스를 유상으로 제공할 수 있습니다.

제5조 (용어의 정의)

가. 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.

1) 서비스: TMI 사이트와 모바일 TMI에서 판매 가능한 상품으로 유형의 제품 혹은 무형의 서비스를 말합니다.

2) 회원: 이 약관을 승인하고 회사와 서비스이용계약을 체결한 자를 말합니다. 회원은 가입형태에 따라 개인회원과 사업자회원으로, 서비스 이용목적에 따라 의뢰인, 전문가로 각 구분되며 상호간 회사가 정하는 바에 따라 전환할 수 있습니다. 전문가와 의뢰인 모두에게 이 약관이 적용됩니다.

3) 비회원: 회원등록을 하지 않고 회사가 제공하는 서비스를 이용하는 자를 말합니다.    

4) 아이디(ID): 회원의 식별과 서비스 이용을 위하여 메일 주소를 활용하여 회원이 설정하고 회사가 승인합니다. 이때 작성된 이메일에 대해서는 별도의 인증 과정을 거치지 않으며, 작성된 이메일에 오류가 있을 시 (오타, 없는 주소 등 ...) 거래, 공지 등의 중요 알림이 전송되지 않을 수 있습니다. 이메일 작성 오류로 인한 문제 발생 시, 그 책임은 전적으로 회원 본인에게 있습니다.

5) 비밀번호: 회원의 동일성 확인과 회원정보의 보호를 위하여 회원이 설정하고 회사가 승인한 문자 (특수문자 포함)와 숫자의 조합을 말합니다.

6) 닉네임: TMI 사이트와 모바일 TMI에서 아이디와 함께, 또는 아이디를 대신하여 회원을 식별하기 위하여 가입 시 사용한 메일 계정으로 자동 설정되며 최초1회에 한하여 이용자의 신청으로 설정되는 숫자와 문자(특수문자 포함)의 조합으로 변경 사용됩니다.

7) 서비스 마켓플레이스: 무형의 서비스를 사고 팔 수 있는 가상의 온라인 공간을 말합니다.

8) 서비스 마켓플레이스 사업자: 서비스 마켓플레이스 및 그 안에서의 부가서비스(광고서비스 등)를 제공하고, 이에 대한 대가를 받는 사업자 (이하 “회사”라고 합니다)를 말합니다.

9) 중개서비스: 회사가 TMI 사이트와 모바일 TMI을 통하여 회원들에게 제공하는 회원 간의 중개서비스 및 관련 부가서비스 일체를 말합니다.

10) 전문가: 물품을 판매할 의사로 해당 서비스를 회사가 온라인으로 제공하는 양식에 맞추어 회사의 TMI 사이트 또는 모바일 TMI에 등록한 회원을 말합니다.

11) 의뢰인: 전문가의 서비스를 구매한 회원을 말합니다.

12) 바로결제: 전문가가 표시한 가격을 결제방식(신용카드, 실시간 계좌이체, 가상계좌, 휴대폰)을 이용하여 구매 진행하며 에스크로 방식의 서비스를 지원합니다.

13) TMI 캐시: 의뢰인이 서비스를 구매하고 그 대가를 지급하는 데 사용하기 위한 것으로 회사가 발행, 관리하는 선불전자지급수단을 말합니다. TMI캐시는 3가지 성격으로 구분됩니다. 1) 회원이 유상으로 구매하는 ‘충전캐시’ 2) 회사가 무상으로 지급하는 ‘적립 / 보너스 캐시’ 3) 서비스 구매 취소 등의 사유로 환불되는 ‘환불캐시’

14) 전문가 마일리지: 전문가가 서비스를 판매 완료한 경우에 대하여 회사가 발행, 관리하는 선불전자지급수단을 말합니다. 마일리지는 구매확정 시점에 전문가에게 지급되며, 회사가 지정한 범위 내에서 상위노출 광고 상품 등을 구입하는 데에만 사용 가능합니다.

15) TMI안전결제서비스: 전문가와 의뢰인의 사이에 신뢰할 수 있는 중립적인 회사가 중개하여 금전 또는 물품(서비스 포함)을 거래를 하도록 하는 에스크로 방식의 서비스를 말합니다.

16) 직거래: TMI안전결제서비스를 통하지 않고 전문가와 의뢰인이 직접 서비스대금을 주고받는 행위를 말합니다.

17) 수익금: 전문가가 중개서비스를 이용하여 판매한 서비스의 구매확정이 완료된 금액을 의미하며 의뢰인의 결제대금 중 수수료를 제외한 출금요청을 할 수 있는 대금을 말합니다.

18) 마이TMI: 회원의 거래 관련 데이터, 알람 메시지와 함께 회사의 주요 공지사항을 확인할 수 있도록 제공된 서비스 화면을 말합니다.

19) TMI메세지: 판매 중인 서비스 또는 도움 요청에 대해 문의 및 대화를 나눌 수 있는 TMI 내 공간을 말합니다.

20) 거래메시지: 의뢰인의 결제 후 전문가의 주문접수가 된 거래건의 작업진행에 필요한 대화를 나눌 수 있는 회사가 제공하는 서비스를 말합니다.

21) 파트너: 회사와 전략적으로 제휴를 맺은 업체를 말합니다.

22) 해지: 회사 또는 회원이 중개서비스 이용계약을 장래에 대하여 종료시키는 행위를 말합니다.

나. 위 가항에서 정의되지 않은 이 약관상의 용어의 의미는 일반적인 거래관행에 의합니다.

제6조 (중개서비스의 성질과 목적)

중개서비스는 회사가 회원 각자의 자기결정에 의하여 회원 상호간에 서비스 및 물품매매거래가 이루어질 수 있도록 사이버 거래장소(marketplace)를 온라인으로 제공하는 것이며, TMI안전결제서비스는 회원 상호간에 서비스의 매매에 있어서 안전하고 편리하게 결제가 이루어질 수 있는 수단을 제공하는 것입니다. 회사는 회원에게 서비스 혹은 물품을 판매하거나 회원으로부터 서비스 혹은 물품을 구매하지 않으며, 단지 회원간 거래의 안전성 및 신뢰성을 증진시키는 도구만을 제공합니다. 회원간에 성립된 거래와 관련된 책임은 거래당사자인 회원들 스스로가 부담하여야 합니다.
                 </textarea>
                 </div>
                 
                 <div class="custom-control custom-checkbox" style="margin-left:40px;font-family: 'Noto Sans KR', sans-serif;margin-top:30px;">
                  <input type="checkbox" class="custom-control-input" id="term2" onchange="isChecked();">
                   <label class="custom-control-label" for="term2">개인정보 수집 • 이용에 대한 동의 (필수)</label>
                   <textarea class="term-box" readonly>
 주식회사 TMI(이하 “회사”)는 회사가 운영하는 인터넷 사이트(www.TMI.com,이하 “TMI”)를 이용하는 이용자님들의 개인정보를 매우 중요하게 생각하며 아래와 같은 개인정보 처리방침을 가지고 있습니다. 이 개인정보 처리방침은 개인정보와 관련한 법령 또는 지침의 변경이 있는 경우 갱신되고, 정책의 변화에 따라 달라질 수 있으니 이용자께서는 TMI 사이트를 방문 시 수시로 확인하여 주시기 바랍니다. TMI의 개인정보 처리방침은 다음과 같은 내용을 담고 있습니다.

 

1. 개인정보의 수집•이용

2. 개인정보 제3자 제공

3. 개인정보 처리위탁

4. 이용자 개인정보의 보유: 이용기간 및 파기

5. 쿠키(Cookie)의 운용 및 거부

6. 이용자 및 법정대리인의 권리

7. 이용자의 의무

8. 링크 사이트에 대한 책임

9. 개인정보의 기술적/관리적 보호 대책

10. 개인정보보호책임자

11. 고지의 의무

 

1. 개인정보의 수집이용

가. 회사가 개인정보를 수집하는 목적은 이용자의 신분과 서비스 이용의사를 확인하여 최적화되고 맞춤화된 서비스를 제공하기 위함입니다. 회사는 최초 회원가입 시 서비스 제공을 원활하게 하기 위해 필요한 최소한의 정보만을 수집하고 있으며 회사가 제공하는 서비스 이용에 따른 결제, 서비스발송 및 환불 등에 필요한 정보를 추가로 수집할 수 있습니다.

나. 회사는 개인정보를 수집•이용목적 이외에 다른 용도로 이를 이용하거나 이용자의 동의 없이 제3자에게 이를 제공하지 않습니다.

다. 회사는 다음과 같은 목적으로 개인정보를 수집하여 이용할 수 있습니다. 다만, 전자상거래 등에서의 소비자보호에 관한 법률, 국세기본법, 전자금융거래법 등 관련법령에 따라 주민등록번호 및 은행계좌번호의 수집• 보관이 불가피한 경우에는 이용자에게 고지하여 해당 정보를 수집할 수 있습니다.

1) 회원

• 이메일주소, 휴대폰번호: 회사가 제공하는 서비스의 이용에 따르는 본인확인 등

2) 구매회원

• 성명, 생년월일, 성별, 외국인등록번호, 이동전화번호, 아이디(e-mail), 비밀번호, 연계정보(CI), 중복가입정보(DI): 회사가 제공하는 서비스의 이용에 따르는 본인확인, 민원사항처리, 회원의 서비스 이용 통계 및 설문 등

• 기업형태, 회사명, 대표자명, 사업자등록번호, 업태, 종목, 전자세금계산서 발급용 이메일, 사업장 혹은 담당자 연락처: 사업자 회원 서비스 제공, 부가가치세법 제32조에 따른 세금계산서 등의 발행 등

• 이메일 주소, 사업장번호, 이동전화번호: 거래의 원활한 진행, 본인의사의 확인, 불만처리, 새로운 상품, 서비스 정보와 고지사항의 안내, 회원의 서비스 이용 통계 및 설문 등

• 수취인 성명, 주소, 전화번호: 서비스 또는 상품과 경품 발송을 위한 발송이지 확인 등

• 은행계좌정보, 이동전화번호정보: 대금결제서비스의 제공 등 

3) 판매회원

•기업형태, 성명, 생년월일, 성별, 외국인등록번호, 이동전화번호, 아이디(e-mail), 비밀번호, 연계정보(CI), 중복가입정보(DI): 회사가 제공하는 서비스의 이용에 따르는 본인확인, 민원사항처리, 회원의 서비스 이용 통계 및 설문 등

• 주민등록번호: 부가가치세법 제32조에 따른 세금계산서 등의 발행

• 회사명, 대표자명, 사업자등록번호, 업태, 종목, 전자세금계산서 발급용 이메일, 사업자연락처: 사업자 회원 서비스 제공, 부가가치세법 제32조에 따른 세금계산서 등의 발행 등

• 이메일 주소, 전화번호, 이동전화번호: 거래의 원활한 진행, 본인의사의 확인, 불만처리, 새로운 상품, 서비스 정보와 고지사항의 안내, 회원의 서비스 이용 통계 및 설문 등

• 발송인 성명, 주소, 전화번호: 상품과 경품 발송에 대한 발송지 확인 등

• 은행계좌정보, 이동전화번호정보: 거래대금 송금 등 대금결제서비스의 제공 등

4) 부가서비스
• 닉네임, 본인 사진 또는 회사 로고: 본인을 표현 할 수 있는 부가서비스, 계정설정에서 관리

5) 기타

• 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.

• IP Address, 방문일시, 서비스 이용 기록: 부정 이용 방지, 비인가 사용 방지, 신규서비스 개발 및 맞춤서비스 제공 등

라. 회사는 이용자의 개인정보를 수집할 경우 반드시 이용자의 동의를 얻어 수집하며, 이용자의 기본적 인권을 침해할 우려가 있는 인종, 출신지, 본적지, 사상, 정치적 성향, 범죄기록, 건강상태 등의 정보는 이용자의 동의 또는 법령의 규정에 의한 경우 이외에는 수집하지 않습니다.

마. 만 14세 미만 아동의 개인정보는 법정대리인의 동의를 얻은 경우에 수집•이용할 수 있습니다. 이 경우 회사는 법정대리인의 이름, 생년월일, 휴대폰 번호, 이메일주소, 본인확인 값(CI, DI)을 추가로 수집할 수 있습니다.

바. 회사는 다음과 같은 방법으로 개인정보를 수집할 수 있습니다.
1) 홈페이지, 모바일 어플리케이션, 모바일 웹페이지, 서면, 팩스, 전화, 고객센터 문의하기, 이벤트 응모
2) 생성정보 수집 툴을 통한 자동 수집

 

2. 개인정보 제3자 제공

가. 회사는 이용자들의 개인정보를 「개인정보의 수집•이용」에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 제3자에게 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.

① 이용자들이 사전에 공개 또는 제3자 제공에 동의한 경우

② 법령의 규정에 의거하거나, 수사, 조사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관 및 감독당국의 요구가 있는 경우

나. 회사가 제공하는 서비스를 통하여 주문 및 결제가 이루어진 경우 상담 등 거래 당사자간 원활한 의사소통 및 발송 등 거래이행을 위하여 관련된 정보를 필요한 범위 내에서 거래 당사자에게 제공합니다.

다. 그 밖에 개인정보 제3자 제공이 필요한 경우에는 이용자의 동의를 얻는 등 합당한 절차를 통하여 제3자에게 개인정보를 제공할 수 있습니다.

라. 그 밖에 개인정보 제3자 제공이 필요한 경우에는 이용자의 동의를 얻는 등 합당한 절차를 통하여 제3자에게 개인정보를 제공할 수 있습니다.
                 </textarea>
                   </div>
                </div>
                
         </div>      
      </div>
   </div>
</div>


    
   <%@ include file="../common/footer.jsp" %>
</body>

<script>

   var emailDupCheckNum = -1;
   var nickDupCheckNum = 0;
   // SNS 가입 시 이메일 자동 채움 함수
   $(function(){
      var email = "<%=request.getParameter("email")%>";
      // 이메일 입력란 readonly처리
      if(email != 'null'){
          $('#email').attr({
             'value' : email,
             readonly : true
             
          });
          
          // 이메일 중복확인 키 무효화
          $('#emailDupCheckBtn').attr('disabled',true);
           
          $('#isSNS').attr('value','Y');
          
          // 이메일 중복확인 유효성체크
          window.emailDupCheckNum = 0;
      }
      
    });

   // 이메일 중복체크 함수
      function isDupEmail(){
         
         $.ajax({   
            url : "/semi/emailDupCheck.do",
            type : "get",
            data : {email : $("#email").val()},
            success : function(data){
               var isDup = data;
               
               if(isDup == 1){
                  alert("이미 사용 중인 이메일입니다!");
                  $('#email').val("").select();
                  window.emailDupCheckNum = 1;
                  return false;
               }else{
                  window.emailDupCheckNum = 0;
                  alert("사용 가능한 이메일입니다.");
                  return true;
               }
            },

            error : function(data){
               console.log("에러!");
               
            }
         });
      }
   
   
     // 이메일 중복체크 버튼 이벤트
      $("#emailDupCheckBtn").click(function(){
         isDupEmail();
      });
     
   // 닉네임 중복체크 버튼 이벤트
      $("#nickNameDupCheckBtn").click(function(){
         isDupNick();
      });
      
      
   
      // 닉네임 중복 체크 함수
      function isDupNick(){
    	
    	  $.ajax({
    		  url : "/semi/nickDupCheck",
    		  type : "get",
    		  data : {nickName:$('#nickName').val()},
    		  success : function(data){
    			  var isDup = data;
    		
    			  // 중복인 경우
    			  if(isDup == 1){
    				  window.nickDupCheckNum = 0;
    				   alert("이미 사용중인 닉네임입니다.");
    			  }else{
    				   alert("사용가능한 닉네임입니다.")
    				  window.nickDupCheckNum = 1;
    			
    			  }
    		  },
    		  error : function(){
    			  alert("닉네임 중복체크 ajax에러");
    		  }
    		  
    	  });
    	  
    	  
      }
      
      
      
      
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
      $('[name^="userPwd"]').change(function(){
         var pwd1 = $('#userPwd').val();
         var pwd2 = $('#userPwd2').val();
      
         if(!isSamePwd(pwd1,pwd2)){
            $('#pwdResult').html("비밀번호가 일치하지 않습니다.").css('color','red');
         }else if(!pwdRegEx(pwd2)){
            $('#pwdResult').html("");
            $('#pwdResult').html("비밀번호는 숫자,영문 대소문자, 특수문자로 구성된<br> 8자리 이상 20자리 이하이어야 합니다.").css('color','red');
         }else{
            $('#pwdResult').html("사용 가능한 비밀번호입니다.").css('color','green');
         }
         
      });
      
      // 주민등록번호 유효성 체크 정규표현식 함수
      function ssnRegEx(ssn1,ssn2){
         // 선생님 코드
         
         //^\d{2}(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])-//
         var regEx1 = /^\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/
         var regEx2 = /^[1-4][0-9]{6}$/;
         console.log(regEx1.test(ssn1));
         console.log(regEx2.test(ssn2));
         if(regEx1.test(ssn1) && regEx2.test(ssn2)){
            $('#ssnResult').html("");
            return true;
         }else{
            $('#ssnResult').html("유효하지 않은 주민등록번호입니다.").css({
               'color': 'red',
               'font-size' : '11px'
         
            });
            return false;
         }
      }
      
      // 주민등록번호 이벤트 함수
      
      $('[name^="memberSSN"]').change(function(){
         var ssn1 = $('#memberSSN1').val();
         var ssn2 = $('#memberSSN2').val();
         
         ssnRegEx(ssn1,ssn2);
         
      });

      
      
      
      
      
  
      function validate(){
    
         // 비밀번호
         var pwd1 = $('#userPwd').val();
         var pwd2 = $('#userPwd2').val();
         // 주민등록번호 
         var ssn1 = $('#memberSSN1').val();
         var ssn2 = $('#memberSSN2').val();
         
    
         // 이메일 중복 체크
         if(emailDupCheckNum == 1){
            alert("이미 사용 중인 이메일입니다!");
            return false;
         } else if(emailDupCheckNum == -1){
            alert("이메일 중복검사를 해주세요");
            return false;
         }
   	  
   	
         // 비밀번호 체크
         if(!isSamePwd(pwd1,pwd2)){   
          alert("비밀번호가 일치하지 않습니다.");
             return false;
         }
         
         if(!pwdRegEx(pwd2)){
            alert("올바르지 않은 형식의 비밀번호입니다.");
            return false;
         }
	   	
	   
	   	  // 닉네임 중복체크
	       if(nickDupCheckNum == 0){
	      	 alert("이미 사용중인 닉네임입니다!");
	      	 return false;
	       }
         
         
         
         alert("제출시점 nickDupCheckNum :" + nickDupCHeckNum);
         // 주민등록번호 체크
         if(!ssnRegEx(ssn1,ssn2)){
            alert("올바르지 않은 형식의 주민등록번호입니다.");
            return false;
         }

         if(!$('#term1').prop('checked')|| !$('#term2').prop('checked')){
            return false;
         }
        
  
      
         
         
      }
      
      
      
      
      
      function toMain(){
         location.href = "/semi/index.jsp";
      }
      
      function isChecked(){
               if($('#term1').prop('checked') && $('#term2').prop('checked')){
                  $('#submitBtn').attr('disabled', false);
               
               }else{
                  $('#submitBtn').attr('disabled',true);      
               }
      }
      
     
     
</script>


</html>