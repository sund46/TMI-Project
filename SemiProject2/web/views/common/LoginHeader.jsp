<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<meta charset="UTF-8">

  <!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.4.1.min.js"></script>
</head>



<body>

<body id="page-top">
        <div class="container">
                <!-- 상단 네비게이트 바 -->
                <div class="navbar nav-tabs navbar-fixed-top" style="background-color:white; border-bottom:1px solid white">
                      <div class="container">
                          <!-- 왼쪽 메뉴 버튼 -->
                          <div class="col-xs-3" style="background-color:white">
                                <button type="button" class="btn btn-default" style="margin-top:4px">
                                <span class="glyphicon glyphicon-align-justify" style="font-size:25px"></span>
                                </button>
                          </div>
          
                          <!-- 가문데 로고 -->
                          <div class="col-xs-6" style="background-color:white-space; text-align:center; display:inline-block;">
                                <a class="navbar-brand js-scroll-trigger" href="#page-top">
                                        <img src="<%= request.getContextPath() %>/resources/images/KakaoTalk_20190606_164601739.png" width="120" height="120" style="margin-top:-20px;margin-bottom: -20px;">
                                      </a>
                          </div>
          
                          <!-- 오른쪽 로그인, 회원가입-->
                          <div class="col-xs-3" style="background-color:white">
                                <button type="button" class="btn btn-default" style="margin-top:10px; float:right;">
                                <span class="glyphicon glyphicon-user"> </span>
                                </button>
                          </div>
                      </div>
                </div>
              </div>
          
  
  <div class="wrap"></div>




</body>

</html>