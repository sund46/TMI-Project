<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="member.model.vo.ClientRequest" %>
    
<%
	int rno = Integer.parseInt(request.getParameter("rno"));
    String rTitle = (String)request.getParameter("rTitle");
    String rContent = (String)request.getParameter("rContent");
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="images/favicon.ico" type="image/ico" />

    <title>TMI - Admin Page</title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
	
	 <!-- Datatables -->
    <link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
	
    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
  	<div class="container body">
      <div class="main_container">
  
 
   		<%@ include file="adminHeader.jsp" %>
  
        <!-- page content -->
         <div class="right_col" role="main">
               <div class="row tile_count">
         	 <div class="x_content">
            
          <!-- top tiles -->
       

                   <h3><b>1:1 문의 관리</b></h3>
				 <div class="col-md-12 col-sm-12 col-xs-12">
              	  <div class="x_panel">
	              
	                  <!-- 여기부터 내용 -->
	                  <div class="x_content" style="display:flex; justify-content:center;">
	                 		<div class="card border-primary mb-3" style="width:70%; height:400px;border: 2px solid gray;">
						
							  <div class="card-body text-primary">
							   	 <h3 class="card-title">제목 : <%=rTitle %></h3>
							   	 <p class="card-text" style="border-top : 2px solid gray;"><%=rContent %></p>
						      </div>
						    </div>
						 
						    
	                  </div>
	               
	                   <div>
	                 	<button id="" class="btn btn-info "  data-toggle="modal" data-target="#replyModal" style="margin: 5px 0px 0px 788px;">답변하기</button>
				       </div>     
	                 

	               
                </div>	

          </div>
 		<!-- Modal -->
		<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h3 class="modal-title" id="exampleModalLabel">답변하기</h3>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		        </button>
		      </div>
		      <div class="modal-body">
		        <form>
		          <div class="form-group">
		            <label for="recipient-name" class="col-form-label"><b>제목</b></label>
		            <input type="text" class="form-control" id="replyTitle" value="Re)<%=rTitle%>">
		          </div>
		          <div class="form-group">
		            <label for="message-text" class="col-form-label">내용</label>
		            <textarea class="form-control" id="replyContent" style="height:400px;"></textarea>
		          </div>
		        </form>
		      </div>
		     
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary cancel" data-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" onclick="submitFn();">전송</button>
		      </div>
		      
		    </div>
		  </div>
		</div>
          
          <!-- /top tiles -->

        </div>
        <!-- /page content -->

		</div>
      </div>
    </div>
</div>  

</body>
	
	
   <!-- jQuery -->
  <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="../vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="../vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="../vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="../vendors/Flot/jquery.flot.js"></script>
    <script src="../vendors/Flot/jquery.flot.pie.js"></script>
    <script src="../vendors/Flot/jquery.flot.time.js"></script>
    <script src="../vendors/Flot/jquery.flot.stack.js"></script>
    <script src="../vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="../vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="../vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="../vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="../vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="../vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="../vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="../vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
    
    <script>
		// 답변하기 함수

		
		function submitFn(){
			$.ajax({
				url : "/semi/requestReply.admin",
				type : "post",
				data : {rno : <%=rno%>, replyTitle : $('#replyTitle').val(), replyContent: $('#replyContent').val()},
				success : function(){
					$('#replyTitle').val(" ");
					$('#replyContent').val(" ");
					$('.cancel').trigger('click');
					alert("문의가 접수되었습니다.");
				},
				error : function(){
					alert("전송실패");
				}
		
			});
		}
	</script>
    

</html>
