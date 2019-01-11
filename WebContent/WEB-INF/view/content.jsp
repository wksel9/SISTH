<%@page import="bb2.BoardDataBean"%>
<%@page import="bb2.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
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


</style>
</head>
<body>


<div class="form-gradient w-50">



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
       
        <input type="text" id="form105" class="form-control" name="id" readonly="readonly" value="글번호 : ${no }">
      </div>
		
		<div class="md-form">
       
        <input type="text" id="form105" class="form-control" name="id" readonly="readonly" value="조회수 : ${article.readcount }">
      </div>
      
      <div class="md-form">
        
        <input type="text" id="form105" class="form-control" name="id" readonly="readonly" value="작성자 :${article.id } ">
      </div>
      
      <div class="md-form">
        
        <input type="text" id="form105" class="form-control" name="id" readonly="readonly" value="작성일 :${article.re_date }">
      </div>
      
      <div class="md-form">
       
        <input type="text" id="form105" class="form-control" name="id" readonly="readonly" value="제목 : ${article.subject } ">
      </div>
      
       <div class="md-form">
        <img src="<%=request.getContextPath() %>/fileSave/${article.filename }" style="width:600px">
      </div>
      
          <div class="md-form">
        
        <input type="text" id="form105" class="form-control  mb-0 py-5 font-weight-bold "  readonly="readonly" value=" ${article.content }">
      </div>

      <!--Grid row-->
      <div class="row d-flex align-items-center mb-3 mt-4">

        <!--Grid column-->
        <div class="col-md-12">
          <div class="text-center">
            <button type="button" class="btn btn-grey btn-rounded z-depth-1a" Onclick="window.location='update?num=${article.num }'">글 수정</button>
            <button type="button" class="btn btn-grey btn-rounded z-depth-1a" Onclick="window.location='delete?num=${article.num }'">글 삭제</button>
            <!-- <button type="reset" class="btn btn-grey btn-rounded z-depth-1a">다시작성</button> -->
            <button type="button" OnClick="window.location='<%= request.getContextPath()%>/bb2/list'" class="btn btn-grey btn-rounded z-depth-1a">목록보기</button>
          </div>
        </div>
        <!--Grid column-->

      </div>
      <!--Grid row-->
    </div>
</div>
</body>
</html>