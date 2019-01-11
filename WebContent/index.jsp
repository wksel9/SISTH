<%@page import="java.util.ArrayList"%>
<%@page import="javax.websocket.Session"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bb2.BoardDataBean"%>
<%@page import="java.util.List"%>
<%@page import="bb2.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Material Design Bootstrap</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Bootstrap core CSS -->
  <link href="resources/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="resources/css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="resources/css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	.as{
		margin-top: 20px;
		margin-bottom: 20px;
		margin-left : 5px;
		margin-right : 5px;
	}
	img{
		width: 75%;
		
	}
	
	.ap{
		font-weight: bold;
		font-size : 20px;
	}
 .t{ margin-top:100px;}
</style>
<title>Insert title here</title>
  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="resources/js/popper.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="resources/js/mdb.min.js"></script>
</head>

<body>
<div class="container ap t" >
<table>
<tr>
<td style="padding-right: 50px">
  <p class="ap">야구장 뷰를 확인해보세요!</p>
  <p class="ap ">경기가 한눈에 보이는 좌석은? 응원열기가 뜨거운 좌석은?<br>난간, 기둥, 그물로 인한 시야방해는 없을까요? </p>
	<br>
  <p class="ap">좌석별 사진과 평점, 댓글 팁을 활용해<br>나에게 딱 맞는 자리를 찾아보세요!!!</p> 
</td>
<td style="margin-left: 20px">
<img style="width: 500px" src="<%=request.getContextPath() %>/resources/img/logo/main.png">
</td>
</table>

</div>  
<!-- 이미지버튼 -->
 <center>
 <div style="background-color: #EFF5FB">
<div class="container" style="margin-top:100px">
<div class="ap" style="padding-top: 30px;padding-bottom: 20px;"><p>원하는 구장</p></div>
  <div class="row">
  
    <div class="col-sm as">
    	<div class="view overlay zoom">
    		<img class="img-fluid " alt="smaple image" src="<%= request.getContextPath()%>/resources/img/logo/sklogo.png" >
    		    		<a href = "<%=request.getContextPath() %>/bb2/bbst?bno=1">
    			<div class="mask flex-center">
    			</div>
    		 </a>
    	</div>
    </div>
   
     <div class="col-sm as">
    	<div class="view overlay zoom">
    		<img class="img-fluid " alt="smaple image" src="<%= request.getContextPath()%>/resources/img/logo/doosanlogo.png" >
    			<a href = "<%=request.getContextPath() %>/bb2/bbst?bno=2">
    			<div class="mask flex-center">
    			</div>
    			</a>
    	</div>
    </div>
    
     <div class="col-sm as">
    	<div class="view overlay zoom">
    		<img class="img-fluid " alt="smaple image" src="<%= request.getContextPath()%>/resources/img/logo/hanhwalogo.png" >
    		<a href = "<%=request.getContextPath() %>/bb2/bbst?bno=3">
    			<div class="mask flex-center ">
    			</div>
    			</a>
    	</div>
    </div>
    
     <div class="col-sm as">
    	<div class="view overlay zoom">
    		<img class="img-fluid " alt="smaple image" src="<%= request.getContextPath()%>/resources/img/logo/nexenlogo.png" >
    			<div class="mask flex-center">
    			</div>
    	</div>
    </div>
     <div class="col-sm as">
    	<div class="view overlay zoom">
    		<img class="img-fluid " alt="smaple image" src="<%= request.getContextPath()%>/resources/img/logo/kialogo.png" >
    			<div class="mask flex-center">
    			</div>
    	</div>
    </div>
  </div>
  
  <div class="row">
    <div class="col-sm as">
    	<div class="view overlay zoom">
    		<img class="img-fluid " alt="smaple image" src="<%= request.getContextPath()%>/resources/img/logo/samsunglogo.png" >
    			<div class="mask flex-center">
    			</div>
    	</div>
    </div>
      <div class="col-sm as">
    	<div class="view overlay zoom">
    		<img class="img-fluid " alt="smaple image" src="<%= request.getContextPath()%>/resources/img/logo/lottelogo.png" >
    			<div class="mask flex-center">
    			</div>
    	</div>
    </div>
      <div class="col-sm as">
    	<div class="view overlay zoom">
    		<img class="img-fluid " alt="smaple image" src="<%= request.getContextPath()%>/resources/img/logo/lglogo.png" >
    			<div class="mask flex-center">
    			</div>
    	</div>
    </div>
      <div class="col-sm as">
    	<div class="view overlay zoom">
    		<img class="img-fluid " alt="smaple image" src="<%= request.getContextPath()%>/resources/img/logo/ktlogo.png" >
    			<div class="mask flex-center">
    			</div>
    	</div>
    </div>
      <div class="col-sm as">
    	<div class="view overlay zoom">
    		<img class="img-fluid " alt="smaple image" src="<%= request.getContextPath()%>/resources/img/logo/nclogo.png" >
    			 <div class="mask flex-center">
    			</div>
    	</div>
    </div>
  </div>
  </div>
</div>

</center>

</body>
</html>