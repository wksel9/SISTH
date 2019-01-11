<%@page import="bb2.BpBean"%>
<%@page import="bb2.BpDBBean"%>
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

<title>Insert title here</title>
</head>
<body>


<header>  
<%
String boardid = request.getParameter("boardid");
if(boardid != null){
session.setAttribute("boardid",boardid); 

} 
boardid = (String)session.getAttribute("boardid");
if(boardid == null){
	boardid = "1"; }

%>  

  <!--Navbar-->
<nav class="navbar navbar-expand-lg elegant-color">

  <!-- Navbar brand -->
  <strong><h3><a  class=" text-white" href="<%=request.getContextPath()%>/index.jsp" style="margin-right:30px">B.B.V</a></h3></strong>

  <!-- Collapse button -->
  
  <button class="navbar-toggler " type="button" data-toggle="collapse" data-target="#basicExampleNav"
    aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon "></span>
  </button>

  <!-- Collapsible content -->
  <div class="collapse navbar-collapse" id="basicExampleNav">

    <!-- Links -->
    <ul class="navbar-nav mr-auto">
       <li class="nav-item dropdown" >
        <a class="nav-link dropdown-toggle text-white" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
          aria-expanded="false" >구장</a>
        <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
        <center>
          <a class="dropdown-item"  href="<%=request.getContextPath()%>/bb2/bbst?bno=1">SK</a>
          <a class="dropdown-item" href="<%=request.getContextPath()%>/bb2/bbst?bno=2">두산</a>
           <a class="dropdown-item" href="<%=request.getContextPath()%>/bb2/bbst?bno=3">한화</a>
          <a class="dropdown-item" href="#">넥센 </a>
          <a class="dropdown-item" href="#">기아</a>
          <a class="dropdown-item" href="#">삼성</a>
          <a class="dropdown-item" href="#">LG</a>
          <a class="dropdown-item" href="#">롯데</a>
          <a class="dropdown-item" href="#">KT</a>
          <a class="dropdown-item" href="#">NC</a>
          </center>
        </div>
      </li>
      
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-white" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
          aria-expanded="false">먹거리</a>
        <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
          <center>
          <a class="dropdown-item"  href="<%=request.getContextPath()%>/bb2/food?bno=1">SK</a>
          <a class="dropdown-item" href="#">두산</a>
           <a class="dropdown-item" href="<%=request.getContextPath()%>/bb2/food?bno=3">한화</a>
          <a class="dropdown-item" href="#">넥센 </a>
          <a class="dropdown-item" href="#">기아</a>
          <a class="dropdown-item" href="#">삼성</a>
          <a class="dropdown-item" href="#">LG</a>
          <a class="dropdown-item" href="#">롯데</a>
          <a class="dropdown-item" href="#">KT</a>
          <a class="dropdown-item" href="#">NC</a>
          </center>
        </div>
      </li>

      <!-- Dropdown -->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-white" id="navbarDropdownMenuLink" href="<%=request.getContextPath()%>/bb2/list">게시판</a>
       <%--  <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
        <center>
          <a class="dropdown-item" href="<%=request.getContextPath()%>/board/list.jsp?borad=1">리 뷰</a>
           <a class="dropdown-item" href="<%=request.getContextPath()%>/board/list.jsp?borad=2">티 켓</a>
        </center>
        </div> --%>
      </li>

    </ul>
    <!-- Links -->

    <form class="form-inline">
      <div class="text-center">
      <c:if test="${id==null }">
  			<a href="" class="nav-link text-white " data-toggle="modal" data-target="#modalLRForm">LogIn</a>
  		</c:if>
  		<c:if test="${id != null }">
  			<a href="<%=request.getContextPath() %>/bb2/logout.jsp" class="nav-link text-white ">  LogOut</a>
		</c:if>
		  </div>
    </form>
  </div>
  <!-- Collapsible content -->

</nav>
<!--/.Navbar-->

</header>
	<!--Modal: Login / Register Form-->
<div class="modal fade" id="modalLRForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog cascading-modal" role="document">
    <!--Content-->
    <div class="modal-content">

      <!--Modal cascading tabs-->
      <div class="modal-c-tabs">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs md-tabs tabs-2 light-blue darken-3" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#panel7" role="tab"><i class="fa fa-user mr-1"></i>
              Login</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#panel8" role="tab"><i class="fa fa-user-plus mr-1"></i>
              Register</a>
          </li>
        </ul>

        <!-- Tab panels -->
        <div class="tab-content">
          <!--Panel 7-->
          <div class="tab-pane fade in show active" id="panel7" role="tabpanel">

            <!--Body-->
            <form action="<%=request.getContextPath()%>/bb2/login" method="post">
            <div class="modal-body mb-1">
              <div class="md-form form-sm mb-5">
                <i class="fa fa-info prefix"></i>
                <input type="text" id="modalLRInput10" class="form-control form-control-sm validate" name="id">
                <label data-error="wrong" data-success="right" for="modalLRInput10">ID</label>
              </div>

              <div class="md-form form-sm mb-4">
                <i class="fa fa-lock prefix"></i>
                <input type="password" id="modalLRInput11" class="form-control form-control-sm validate"name="passwd">
                <label data-error="wrong" data-success="right" for="modalLRInput11" >password</label>
              </div>
              <div class="text-center mt-2">
                <button class="btn btn-info" type="submit" > Login </a><i class="fa fa-sign-in ml-1"></i></button>
              </div>
            </div>
            </form>
            <!--Footer-->
            <div class="modal-footer">
              <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">Close</button>
            </div>

          </div>
          <!--/.Panel 7-->

          <!--Panel 8-->
         
          <div class="tab-pane fade" id="panel8" role="tabpanel">

            <!--Body-->
             <form name="sub1" method="post" action="<%= request.getContextPath() %>/bb2/member">
            <div class="modal-body">
              <div class="md-form form-sm mb-5">
                <i class="fa fa-info prefix"></i>
                <input type="text" id="modalLRInput12" class="form-control form-control-sm validate" name="id">
                <label data-error="wrong" data-success="right" for="modalLRInput12">ID</label>
              </div>
            
              <div class="md-form form-sm mb-5">
                <i class="fa fa-lock prefix"></i>
                <input type="password" id="modalLRInput13" class="form-control form-control-sm validate" name="passwd">
                <label data-error="wrong" data-success="right" for="modalLRInput13"> password</label>
              </div>

              <div class="md-form form-sm mb-4">
                <i class="fa fa-lock prefix"></i>
                <input type="password" id="modalLRInput14" class="form-control form-control-sm validate">
                <label data-error="wrong" data-success="right" for="modalLRInput14">Repeat password</label>
              </div>
              
              <div class="md-form form-sm mb-5">
                <i class="fa fa-user-circle prefix"></i>
                <input type="text" id="modalLRInput15" class="form-control form-control-sm validate" name="name">
                <label data-error="wrong" data-success="right" for="modalLRInput15">Name</label>
              </div>
              
              <div class="md-form form-sm mb-5">
                <i class="fa fa-envelope prefix"></i>
                <input type="email" id="modalLRInput16" class="form-control form-control-sm validate" name="email">
                <label data-error="wrong" data-success="right" for="modalLRInput16">Email</label>
              </div>
              
              <div class="md-form form-sm mb-5">
                <i class="fa fa-mobile-phone prefix"></i>
                <input type="text" id="modalLRInput17" class="form-control form-control-sm validate" name="phone">
                <label data-error="wrong" data-success="right" for="modalLRInput17">Phone</label>
              </div>

              <div class="text-center form-sm mt-2">
              	
                <button class="btn btn-info" OnClick="erchk()">Sign up <i class="fa fa-sign-in ml-1"></i></button>
              
              </div>

            </div>
            <!--Footer-->
            <div class="modal-footer">
              <div class="options text-right">
                <p class="pt-1">Already have an account? <a href="#" class="blue-text">LogIn</a></p>
              </div>
              <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">Close</button>
            </div>
            </form> 
          </div>
         
          <!--/.Panel 8-->
        </div>

      </div>
    </div>
    <!--/.Content-->
  </div>
</div>
<!--Modal: Login / Register Form-->
  <!-- Start your project here-->

 <!-- 이미지버튼 -->
  
  <!-- /Start your project here-->

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/mdb.min.js"></script>

  <script>
  function erchk() {
          if (document.getElementById("modalLRInput12").value == "") {
              alert("ID 입력해주세요");
              $('#modalLRInput12').focus();
              return false;
    }
          if (document.getElementById("modalLRInput13").value == "") {
              alert("password 입력해주세요");
              $('#modalLRInput13').focus();
              return false;
    }
          if (document.getElementById("modalLRInput14").value == "") {
              alert("repassword 입력해주세요");
              $('#modalLRInput14').focus();
              return false;
    }
          if (document.getElementById("modalLRInput15").value == "") {
              alert("name 입력해주세요");
              $('#modalLRInput15').focus();
              return false;
    }
          if (document.getElementById("modalLRInput16").value == "") {
              alert("email 입력해주세요");
              $('#modalLRInput16').focus();
              return false;
    }
          if (document.getElementById("modalLRInput17").value == "") {
              alert("phone 입력해주세요");
              $('#modalLRInput17').focus();
              return false;
    }
     document.sub1.submit();
     alert("가입");
  }
  </script>

</body>
</html>