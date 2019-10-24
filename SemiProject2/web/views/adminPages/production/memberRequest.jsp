<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="member.model.vo.ClientRequest" %>
    
<%
	ArrayList<ClientRequest> crList = (ArrayList<ClientRequest>)session.getAttribute("crList");
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
                  <div class="x_title">
                
                    <h2 style="height:22px; margin: 3px 0px 3px 0px;">문의 목록</h2>
                    <ul class="nav navbar-right panel_toolbox">
                     
                      <li><a class="collapse-link" style="margin-left:55px;"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  
                  <!-- 여기부터 테이블 -->
                  <div class="x_content">
                 
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0">
                      <thead>
                        <tr> 
                          <th style="width:5%;">No</th>
                          <th style="width:17%;">제목</th>
                          <th style="width:15%">Email</th>
                          <th style="width:15%;">닉네임</th>
                          <th style="width:12%;">답변여부</th>
                          <th style="width:12%;">관리</th>           
                        </tr>
                      </thead>
                      <tbody>
                    
                      	<%
                      	int num = 1;
                      	for(ClientRequest cr : crList){ %>
                      	  <%System.out.print(cr.getRno());%>
                        <tr id="trId">
                      	  
                          <input type="hidden" id="rno" value="<%=cr.getRno()%>">
                          <input type="hidden" id="rContent" value="<%=cr.getrContent()%>">
                          <td><%=num %></td>
                          <td><%=cr.getrTitle()%></td>
                          <td class="email"><%=cr.getEmail() %></td>
                          <td><%=cr.getNickName()%></td>
                          <td>
                          <%if(cr.getReply().equals("Y")){ %>
                          	    답변 완료
                          <%}else{ %> 
                          	    미답변
                          <% }%>
                          </td>
                          
                          <td class="last">
	                          <a class="btn btn-primary btn-xs replyBtn"><i class="fa fa-send-o"></i>&nbsp;답변</a>
	                          <a class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteModal<%=num%>"><i class="fa fa-trash-o"></i>&nbsp;삭제 </a>
	                       <!-- Modal -->
	                       
							<div class="modal fade" id="deleteModal<%=num%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h3 class="modal-title" id="exampleModalCenterTitle">1:1 문의 삭제</h3>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body">
							      	 <h4>정말로 해당 문의 내용을 삭제하시겠습니까?</h4>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							        <button type="button" class="btn btn-primary deleteBtn">삭제</button>
							      </div>
							    </div>
							  </div>
							</div> 
                          </td>
                     
                        </tr>
                    	
                      <% num++;
                           } 
                   	
                      %>
                      </tbody>
                    </table>
					
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
    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
     <!-- Datatables -->
    <script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="../vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="../vendors/jszip/dist/jszip.min.js"></script>
    <script src="../vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="../vendors/pdfmake/build/vfs_fonts.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
    
    <script>
	
    // 1:1 문의삭제 ajax
    		$('.deleteBtn').each(function(index, item){
        		
    			$(this).click(function(){
        		
					$.ajax({
						url : "/semi/rDelete.admin",
		        		type : "get",
		        		data : {rno : $(this).parents('#trId').find('input').eq(0).val()} ,
		        		success : function(data){
		        			location.href = "/semi/requestList.admin";
		        		},
		        		error : function(){
		        			alert("어드인 회원삭제에서 오류");
		        		}

					});
					
					
        		});
    		
        	});
    
    
    	$('.replyBtn').each(function(index, item){
    		$(this).click(function(){
    			var rno = $(this).parents('#trId').find('input').eq(0).val();
    			var rTitle = $(this).parents('#trId').find('td').eq(1).text();
    			var rContent = $(this).parents('#trId').find('input').eq(1).val();
    			
    			location.href="/semi/views/adminPages/production/memberRequestDetail.jsp?rno="+rno+"&rTitle="+rTitle+"&rContent="+rContent;
    		});
    		
    	});
    	
    	
	</script>
    
    
    
    
    
	
</html>
