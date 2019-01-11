<%@page import="java.io.Console"%>
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
.form-gradient .header {
  border-top-left-radius: .3rem;
  border-top-right-radius: .3rem; }

.form-gradient input[type=text]:focus:not([readonly]) {
  border-bottom: 1px solid #fd9267;
  box-shadow: 0 1px 0 0 #fd9267; }

.form-gradient input[type=text]:focus:not([readonly]) + label {
  color: #4f4f4f; }

.form-gradient textarea.md-textarea:focus:not([readonly]) {
    border-bottom: 1px solid #fd9267;
    box-shadow: 0 1px 0 0 #fd9267; }

.form-gradient { 
        margin: 0 auto; 
        width:250px;
    }    

 .t{ margin-top:100px;}

</style>

<title>Insert title here</title>
</head>

<script>
function checkboard(){

	var form = document.writeform;

	if(!form.subject.value){
		alert("subject error");
		return false;
	}
	if(!form.content.value){
		alert("content error");
		return false;
	}
	if(!form.passwd.value){
		alert("password error");
		return false;
	}
	return true;
}
</script>
<body>

<form action="<%= request.getContextPath() %>/bb2/write" class="form-gradient w-50"
method="post" name="writeform" onsubmit="return checkboard()" enctype="multipart/form-data">

<input type="hidden" name="num" value='${num }'>
<input type="hidden" name="ref" value='${ref }'>
<input type="hidden" name="re_step" value='${re_step }'>
<input type="hidden" name="re_level" value='${re_level }'>



    <!--Header-->
    <div class="header elegant-color t ">

      <div class="row d-flex justify-content-center">
        <h3 class="text-white">Re View</h3>
      </div>

    </div>
    <!--Header-->

<div class="card-body mx-4 ">
<!--     <div >
        <select class="browser-default custom-select" name="stname">
  			 <option selected>구단</option>
  			 <option value="1">One</option>
 			 <option value="2">Two</option>
 			 <option value="3">Three</option>
 			 <option value="4">Three</option>
 			 <option value="5">Three</option>
 			 <option value="6">Three</option>
 			 <option value="7">Three</option>
 			 <option value="8">Three</option>
 			 <option value="9">Three</option>
 			 <option value="10">Three</option>
		</select>
      </div>  -->

      <div class="md-form">
        <i class="fa fa-envelope prefix grey-text"></i>
        <label for="form104">제 목</label>
        <c:if test="${num == 0 }">
		<input type="text" name="subject" id="form104" class="form-control">
		</c:if>
		<c:if test="${num != 0 }">
		<input type="text" name="subject" value="[답변]"id="form104" class="form-control">
		</c:if>
      </div>

      <div class="md-form">
        <i class="fa fa-user prefix grey-text"></i>
        <input type="text" id="form105" class="form-control" name="id" readonly="readonly" value='${id}'>
        
      </div>
		
	<div class="md-form">
        <i class="fa fa-pencil prefix grey-text"></i>
        	<input type="file" size="40" maxlength="30" name="uploadfile">
      </div>
	
      <div class="md-form">
        <i class="fa fa-pencil prefix grey-text"></i>
        <textarea type="text" id="form107" class="md-textarea form-control" rows="5" name="content"></textarea>
        <label for="form107">내 용</label>
      </div>

  	 <div class="md-form">
        <i class="fa fa-tag prefix grey-text"></i>
        <input type="password" id="form108" class="form-control"  name="passwd">
        <label for="form106">비밀번호</label>
      </div>

      <!--Grid row-->
      <div class="row d-flex align-items-center mb-3 mt-4">

        <!--Grid column-->
        <div class="col-md-12">
          <div class="text-center">
            <button type="submit" class="btn btn-grey btn-rounded z-depth-1a">글쓰기</button>
            <!-- <button type="reset" class="btn btn-grey btn-rounded z-depth-1a">다시작성</button> -->
            <button type="button" OnClick="window.location='<%= request.getContextPath()%>/bb2/list'" class="btn btn-grey btn-rounded z-depth-1a">목록보기</button>
          </div>
        </div>
        <!--Grid column-->

      </div>
      <!--Grid row-->
    </div>

  <!--/Form with header-->

</form>

 <!-- JQuery -->
 
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/popper.min.js"></script>
  
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/mdb.min.js"></script>
  
</body>
</html>