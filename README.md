# TMI_Project
누구나 재능을 판매할 수 있고, 구매할 수 있는 여러 카테고리의 다양한 재능들을 상품으로서 판매, 거래, 공유를 할 수 있는 사이트입니다.
<br>
<br>
![Alt text](images/main.png)
## Overview
![Alt text](images/project_overview.PNG)

## Skills
![Alt text](images/skills.png)
## 회원 관련 기능
### 회원가입
회원가입시 해야하는 기본적인 유효성검사를 하였습니다.
* 이메일, 이름, 비밀번호, 비밀번호 확인, 주민등록번호, 닉네임, 핸드폰번호를 입력받고 해당 데이터가 입력되지 않았을 경우 해당 태그에 포커싱되게 하고 회원가입이 되지 않게 하였습니다.
* 이메일은 ex) test@gmail.com 처럼 @ 앞에 아이디 뒤에 메일주소를 입력하지 않으면 회원가입이 되지 않도록 하였습니다.
* 회원정보 등록시 DB에서 이메일의 중복 여부를 체크하여 중복되어있을 경우 중복된 이메일이라는 경고창과 함께 회원가입이 되지 않도록 하였습니다.
* 이름은 2~10글자 이내로 한글 및 영문만 입력하게 하였습니다.
* 비밀번호와 비밀번호 확인은 영문+숫자+특수문자 조합으로 8~16이내의 정보를 입력하지 않거나 둘의 값이 다를 경우 회원가입이 되지 않도록 하였습니다.
<br><br>
![Alt text](images/join.png)
<pre><code>
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

      // 유효성 
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
         
         // 주민등록번호 체크
         if(!ssnRegEx(ssn1,ssn2)){
            alert("올바르지 않은 형식의 주민등록번호입니다.");
            return false;
         }

         if(!$('#term1').prop('checked')|| !$('#term2').prop('checked')){
            return false;
         } 
      }
</code></pre>
### 로그인
이메일과 비밀번호 조회결과를 체크합니다.
* 아이디, 비밀번호를 입력하였는지 공백여부를 체크합니다.
* 로그인 정보가 DB정보와 일치하지 않는다면 아이디가 틀렸는지 비밀번호가 틀렸는지의 경우를 따로 알려줍니다.
* 로그인을 하지 않을경우 구매,판매 서비스를 이용할 수 없게 하였습니다.
<br><br>
![Alt text](images/login.png)
<pre><code>
// LoginServlet.java
// 로그인 버튼 누를 시 <form>의 데이터를 Servlet에서 받는다.
    String userEmail = request.getParameter("userEmail");
		String userPwd = request.getParameter("userPwd");
		String isSNS = request.getParameter("isSNS");
		int mCount = 0; // 문의 건 수
		int buyCount =0; // 구매 건 수
		int sellCount =0; // 판매 건 수
		
		Member m = new Member(userEmail,userPwd);
		m.setIsSNS(isSNS);
		
		
		MemberService ms = new MemberService();
		
		try {
			m = ms.selectMemeber(m);
			mCount = ms.getMcount(m);
			buyCount = ms.getBuyCount(m);
			sellCount = ms.getSellCount(m);
			
		
			// 관리자 계정일 경우 관리자 페이지로 보낸다.
			if(m.getIsAdmin().equals("Y")) {
				HttpSession session = request.getSession();
				session.setAttribute("admin", m);
				response.sendRedirect("memberSelect.admin");
			}// 관리자가 아닐 경우 메일인증 여부 확인
			else if(m.getEmailVerification().equals("0")) {
				request.setAttribute("errorMsg", "메일인증이 되지않은 계정입니다.");
				request.getRequestDispatcher("views/LoginForm.jsp").forward(request, response);
			}else if(m.getIsValid().equals("N")||m.getIsAlive().equals("N")) {
				request.setAttribute("errorMsg", "관리자에 의해 정지되었거나 탈퇴한 회원입니다.");
				request.getRequestDispatcher("views/LoginForm.jsp").forward(request, response);
			}
			
			else { // 메일인증 된 회원이면 로그인
					
					// 판매자일 경우
				if(m.getIsSeller().equals("Y")) {

					HttpSession session = request.getSession();
					session.setAttribute("member", m);
					
					System.out.println("서블릿에서의 mCount : " + mCount);
					session.setAttribute("mCount", mCount);
					session.setAttribute("buyCount", buyCount);
					session.setAttribute("sellCount", sellCount);
					
					RequestDispatcher view = request.getRequestDispatcher("seller.so");
					view.forward(request, response);
					
					
					// 판매자 아닐경우
				}else {
					HttpSession session = request.getSession();
					session.setAttribute("member", m);
					System.out.println("서블릿에서의 mCount : " + mCount);
					session.setAttribute("mCount", mCount);
					session.setAttribute("buyCount", buyCount);
					session.setAttribute("sellCount", sellCount);
					
					RequestDispatcher view = request.getRequestDispatcher("index.jsp");
					view.forward(request, response);
				}
			}
// 아이디 & 비밀번호가 틀릴 경우 에러메세지
		} catch (Exception e) {
			request.setAttribute("errorMsg", "아이디 또는 비밀번호를 다시 확인하세요.<br> TMI에 등록되지 않은 아이디이거나, 비밀번호를 잘못 입력하셨습니다.");
			request.getRequestDispatcher("views/LoginForm.jsp").forward(request, response);
		
		}
</code></pre>
<br><br>
네이버 및 카카오 아이디로 로그인을 할 수 있도록 하였습니다.
* 가입되어 있지 않다면 회원가입페이지로 이동하여 아이디란은 고정시켜 회원가입하도록 하였습니다.
<br><br>
![Alt text](images/naverkakao.png)
<pre><code>
   // 카카오 로그인
    Kakao.init('cc56a05cae8352b3084c302df2e23e3f');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function() {
   
         Kakao.API.request({ 
              url: '/v2/user/me', 
              success: function(res) { 
                 var email = res.kakao_account.email;
                 
                 $.ajax({
                      url : "/semi/emailDupCheck.do",
                      type : "post",
                      data : {email : email},
                        success : function(data){
                        	 
                              var isDup = data;
                              // 이미 가입된 메일이라는 뜻. 로그인 시켜준다.
                              if(isDup == 1){
                                 location.href = '/semi/login.do?userEmail='+email+ '&userPwd=0&isSNS=Y';
                              } else{ // 가입자가 아니므로 가입절차 후 로그인
                            	 	
                            	  if(email == undefined || email == null){
                            		  alert("카카오 계정에 등록된 이메일이 없습니다.\n 가입에 필요한 정보를 입력해주세요.");
                            		  location.href = '/semi/views/member/memberJoin.jsp?isSNS=N';
                            	  }else{
                            		  alert("카카오에 가입한 이메일로 가입을 진행합니다.\n추가 정보를 입력해주세요.");
                            		  location.href = '/semi/views/member/memberJoin.jsp?email=' + email + '&isSNS=Y';
                            	  }
                            	  
                                 
                              }
                        },
                        error : function(){
                           console.log("카톡 로그인 중복체크에서 에러났어여");
                        }
                 });
                   
                }, 
             fail: function(error) { 
                   console.log(JSON.stringify(error)); 
               } 
  
           //location.href = '/semi/index.jsp';
           });
         
         
        },
         fail: function(err) {
         alert(JSON.stringify(err));
          }
    });
   
   // 네이버 로그인

   var naverLogin = new naver.LoginWithNaverId(
      {
         clientId: "jO850s5j4AkPe49KkkVW",
         callbackUrl: "http://localhost:8088/semi/views/LoginForm.jsp",
         isPopup: false, /* 팝업을 통한 연동처리 여부 */
         loginButton: {color: "green", type: 3, width:350, height: 60} /* 로그인 버튼의 타입을 지정 */
      }
   );
   
   /* 설정정보를 초기화하고 연동을 준비 */
   naverLogin.init();
   
   $('#naverIdLogin').on('click', function () {
      naverLogin.getLoginStatus(function (status) {
         if (status) {
            /* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
             var email = naverLogin.user.getEmail();
            if( email == undefined || email == null) {
               alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
               /* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
               naverLogin.reprompt();
               return;
            }
            
           
            
             $.ajax({
                   url : "/semi/emailDupCheck.do",
                   type : "post",
                   data : {email : email},
                     success : function(data){
                           var isDup = data;
                           // 이미 가입된 메일이라는 뜻. 로그인 시켜준다.
                           if(isDup == 1){
                              location.href = '/semi/login.do?userEmail='+email+ '&userPwd=0&isSNS=Y';
                           } else{ // 가입자가 아니므로 가입절차 후 로그인
                        	   alert("네이버 이메일로 가입을 진행합니다.\n 추가 정보를 입력해주세요.");
                              location.href = '/semi/views/member/memberJoin.jsp?email=' + email + '&isSNS=Y';
                          
                           }
                     },
                     error : function(){
                        console.log("네이버 로그인 중복체크에서 에러");
                     }
               });
   
         } else {
            console.log("callback 처리에 실패하였습니다.");
         }
      });
   });
</code></pre>
### ID / PWD 찾기
이메일과 비밀번호를 입력한 정보와 일치하면 찾을 수 있도록 하였습니다.
* 이메일은 사용자의 이름과 주민등록번호가 DB정보와 일치하다면 Modal로 이메일 정보를 알려줍니다.
* 비밀번호는 사용자의 이메일과 이름, 주민등록번호가 DB정보와 일치하면 Modal로 비밀번호 재설정을 하도록 해줍니다.
<br><br>
![Alt text](images/findid.png)
### 1:1 문의 작성
로그인 후 메인페이지 우측하단 버튼을 통해 문의작성 가능한 Modal을 보여주도록 하였습니다.
* 작성한 문의는 관리자페이지에 등록이 됩니다.
* 답변이 완료된 문의는 마이페이지에서 확인할 수 있도록 하였습니다.
<br><br>
![Alt text](images/qna.png)
* * *
## 서비스 구매
### 서비스 검색 기능
검색바를 통해 일치하는 서비스를 검색하도록 하였습니다.
* 제목과 내용을 기준으로 검색이 되도록 하였습니다.
* 비회원도 랜딩페이지에서 서비스를 검색할 수 있도록 하였습니다.
<br><br>
![Alt text](images/main.png)
![Alt text](images/search.png)
### 서비스 카테고리 별 조회
카테고리 별로 서비스를 확인할 수 있도록 나누었습니다.
* 하나의 JSP페이지로 카테고리 별 지정번호를 쿼리스트링으로 보내 DB에서 일치하는 카테고리의 서비스를 보여주도록 하였습니다.
* 3행 4열로 한 페이지당 12개의 서비스를 보이도록 페이징처리를 하였습니다.
<br><br>
![Alt text](images/category.png)
### 결제
사용자가 서비스를 확인하고 구매할 수 있는 페이지입니다.
* 사용자가 선택한 서비스의 상세정보, 가격, 서비스평가를 볼 수 있습니다.
<br><br>
![Alt text](images/buy1.png)
* 기본 서비스 구매와 옵션항목을 통해 스크립트로 가격이 변동되도록 하였습니다.
* 보유 캐시가 부족할 경우 구매버튼을 누를 시 캐시충전 페이지로 이동하도록 하였습니다.
<br><br>
![Alt text](images/buy2.png)
![Alt text](images/kgbuy.png)
* 구매 완료 후 사용자가 구매한 서비스의 결과를 확인 할 수 있도록 하였습니다.
<br><br>
![Alt text](images/buy3.png)
### 구매 관리
#### 구매관리
서비스를 구매 후 서비스의 진행상황 및 목록을 확인할 수 있습니다.
* 서비스의 진행상태 별 목록확인이 가능하도록 쿼리스트링으로 진행상태 코드를 전달하여 DB에서 일치하는 진행상태 결과를 가져오도록 하였습니다.
<br><br>
![Alt text](images/buyadmin.png)
#### 캐시충전
캐시를 충전하는 페이지입니다.
* 선택한 가격의 캐시를 결제하여 성공하면 사용자의 캐시에 더해주고, 사용내역 페이지로 이동하도록 하였습니다.
<br><br>
![Alt text](images/cashCharge.png)
![Alt text](images/kgbuy.png)
#### 사용내역
캐시를 사용, 충전내역을 확인하는 페이지입니다.
* 내역별로 목록을 확인할 수 있습니다.
<br><br>
![Alt text](images/cashlog.png)
* * *
## 서비스 판매
### 서비스 등록 신청
서비스를 등록하는 페이지입니다.
* 판매자로 등록된 사용자만 서비스를 등록하도록 세션에 판매자정보를 저장하여 판매자 식별을 하였습니다.
* 각 항목별로 유효성검사를 하였습니다.
* 서비스 등록 마지막 단계입력 완료 시 한번에 서비스정보를 DB에 INSERT하도록 페이지이동이 아닌 hidden으로 단계별로 처리하였습니다.
![Alt text](images/service1.png)
![Alt text](images/service2.png)
![Alt text](images/service3.png)
![Alt text](images/service4.png)
### 판매 관리
현재 거래중인 서비스를 관리하는 페이지입니다.
* 판매자가 서비스 진행상황을 업데이트할 수 있도록 하였습니다. 판매자가 서비스 진행상황을 변동할 시 구매자의 구매관리 페이지에서 진행상황을 확인할 수 있습니다.
* 판매자가 아닌 경우 목록은 비워져 있습니다.
![Alt text](images/selladmin.png)
### 수익 관리
판매자의 수익을 관리하는 페이지입니다.
* 출금전, 후, 전체 수익금을 확인 할 수 있습니다.
![Alt text](images/incomeadmin.png)
* 출금 가능한 금액만큼 출금을 할 수 있습니다.
* 구매자가 판매자의 서비스를 구매 시 해당 서비스의 수익과 출금 내역을 확인할 수 있습니다.
![Alt text](images/income.png)
### 서비스 관리
판매자가 등록한 전체 서비스를 관리하는 페이지입니다.
* 제목을 클릭하여 서비스 상세페이지로 이동할 수 있습니다.
* 판매중, 승인대기중, 판매중지, 비승인 상태별로 서비스를 확인할 수 있습니다.
![Alt text](images/myService.png)
* * *
## 관리자
### 회원 관리
관리자가 회원을 관리하는 페이지입니다.
* 회원을 정지 또는 탈퇴 시킬 수 있습니다. 정지된 사용자는 로그인 시 정지기한을 확인할 수 있도록 alert로 보여줍니다.
* 각 사용자의 보기 버튼에 해당하는 <tr>내의 email과 nickName을 전달하여 사용자의 서비스를 확인 할 수 있습니다.
![Alt text](images/admin1.png)
### 서비스 관리
관리자가 서비스를 관리하는 페이지입니다.
* 등록대기중인 서비스를 확인하고, 관리자의 결정을 통해 서비스 등록여부를 결정합니다.
![Alt text](images/admin2.png)
### 1:1 문의 관리
관리자가 문의를 관리하는 페이지입니다.
* 사용자가 등록한 문의들을 답변하거나 삭제가 가능하도록 설정하였습니다. 답변 시 Modal을 띄워 입력할 수 있도록 하였습니다.
* 답변한 문의는 사용자의 마이페이지에서 확인할 수 있도록 하였습니다.
![Alt text](images/admin3.png)
![Alt text](images/admin4.png)
