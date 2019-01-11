<%@page import="java.util.List"%>
<%@page import="bb2.FoodDBBean"%>
<%@page import="bb2.FoodBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Material Design Bootstrap</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="<%=request.getContextPath() %>/resources/css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>

.text-small {
  font-size: 0.75rem;
}

.t{ margin-top:100px;}

</style>
<title>Insert title here</title>
</head>
<body>
  <!-- Start your project here-->
  <!-- Grid row -->
  
  <div class="container t">
     <h3>${f.stname} 내 먹거리</h3>
  <hr style=" border: 2px solid black; ">
  <c:forEach var="fb" items="${foodList }">
<%-- <%
		for(int i=0; i<foodList.size(); i++){
			FoodBean fb = (FoodBean)foodList.get(i);
	%>  --%>
<div class="row "  style=" float: left; border: 2px solid gold; width: 30%;margin-left:8px; margin-right:8px; margin-top:10px;">
  <!-- Grid column -->
  <div>
    <!--Card-->
    <div class="card">
      <!--Card image-->
      <div class="view">
        <img src="<%=request.getContextPath() %>/resources/img/foodimg/${fb.fmg1}.png" 
        class="card-img-top">
      </div>
      <!--Card content-->
      <div class="card-body">
        <!--Title-->
        <h4 class="card-title">${fb.fname}</h4>
        <!--Text-->
        <p class="card-text">장소 :${fb.faddr} </p>
           
      <div class="text-center">
           <a href="" class="nav-link text-black" data-toggle="modal" data-target="#modalLRForm1">구경하기</a>
        </div>
      </div>
    </div>
  </div>
  <!-- Collapsible content -->

   <!--Modal: Login / Register Form-->
<div class="modal fade" id="modalLRForm1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog cascading-modal" role="document">
    <!--Content-->
    <div class="modal-content">

      <!--Modal cascading tabs-->
      <div class="modal-c-tabs">

        <!-- Nav tabs -->
        <ul class="nav  light-blue darken-3" >
          <li class="nav-item">
            <h5 class="nav-link active text-white" >메뉴</h5>
          </li>
        </ul>

        <!-- Tab panels -->
        <div class="tab-content">
          <!--Panel 7-->
          <div class="tab-pane fade in show active" id="panel7" role="tabpanel">

            <!--Body-->
           
            <div class="modal-body mb-1">
              
              <!--Carousel Wrapper-->
<div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">
  <!--Indicators-->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-1z" data-slide-to="1"></li>
    <li data-target="#carousel-example-1z" data-slide-to="2"></li>
  </ol>
  <!--/.Indicators-->
  <!--Slides-->
  
  <div class="carousel-inner" role="listbox">
  	<%-- <div align="center" class="d-block w-100">${fb.fname}</div> --%>
    <!--First slide-->
    <div class="carousel-item active">
      <img class="d-block w-100" src="<%=request.getContextPath() %>/resources/img/foodimg/${fb.fmg2}.png" alt="First slide">
    </div>
    <!--/First slide-->
    <!--Second slide-->
    <div class="carousel-item">
      <img class="d-block w-100" src="<%=request.getContextPath() %>/resources/img/foodimg/${fb.fmg3}.png"alt="Second slide">
    </div>
    <!--/Second slide-->
    <!--Third slide-->
    <div class="carousel-item">
      <img class="d-block w-100" src="<%=request.getContextPath() %>/resources/img/foodimg/${fb.fmg4}.png"alt="Third slide">
    </div>
    <!--/Third slide-->
  </div>
  <!--/.Slides-->
  <!--Controls-->
  <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
  <!--/.Controls-->
</div>
<!--/.Carousel Wrapper-->
              
              <div class="t">
              	<table style="width:300px">
              	<tr>
              	<td > <h5 class=" font-weight-bold">${fb.food1}</h5> </td> <td>  <h5 class=" font-weight-bold">${fb.price1}</h5></td>
              	</tr>
              	<tr>
              	<td>  <h5 class=" font-weight-bold">${fb.food2}</h5> </td> <td>  <h5 class=" font-weight-bold">${fb.price2}</h5></td>
              	</tr>
              	<tr>
              	<td> <h5 class=" font-weight-bold">${fb.food3}</h5> </td> <td> <h5 class=" font-weight-bold">${fb.price3} </h5></td>
              	</tr>
              	
              	</table>
              </div>
              
              
            </div>
            <!--Footer-->
            <div class="modal-footer">
              <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal" >Close</button>
            </div>

          </div>
          <!--/.Panel 7-->
        </div>
      </div>
    </div>
    <!--/.Content-->
  </div>
</div>

  </div>
</c:forEach>
  <div  style="margin-bottom:30px;">


 </div>
  <!-- /Start your project here-->
	</div>
  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/popper.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/mdb.min.js"></script>

</body>
</html>