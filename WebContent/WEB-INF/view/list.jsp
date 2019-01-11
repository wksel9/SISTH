<%@page import="javax.websocket.Session"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bb2.BoardDataBean"%>
<%@page import="java.util.List"%>
<%@page import="bb2.BoardDBBean"%>
  <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
  
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
  <link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="<%=request.getContextPath() %>/resources/css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>

 .t{ margin-top:100px;}

</style>
</head>
<body>

<div class="t">
	<div  align="right" >
	<a href="<%= request.getContextPath() %>/bb2/write">
	<button type="button" class="btn elegant-color px-3" ><i class="fa fa-plus" aria-hidden="true"></i></button></a>
	</div>

<c:if  test="${count==0 }"> 
	<table class="table" width="700">
		<tr class="w3-gray">
			<td align="center">게시판에 저장된 글이 없습니다.</td>
		</tr>
	</table>
</c:if>
<c:if test="${count !=0 }">
<table class="table" width="700">
	<tr class="w3-gray">
		<td align="center" width="100">번호</td>
		<td align="center" width="200">제목</td>
		<td align="center" width="150">작성자</td>
		<td align="center" width="150">작성일</td>
		<td align="center" width="50">조회</td>
	</tr>
	<c:set var="number" value="${number }"/>
	<c:forEach var="article" items="${articleList}">
	<tr>
	<td align="center" width="100">${number }</td>
	<c:set var="number" value="${number }"/>
	<td><center>
	<a href="<%=request.getContextPath() %>/bb2/content?num=${article.num }&no=${number}">
	${article.subject }</a></center></td>
	<td align="center" width="150">${article.id }</td>
	<td align="center" width="150">${article.re_date }</td>
	<td align="center" width="50">${article.readcount }</td>

	</tr>
	</c:forEach>
	

</table>

<div align="center">
<c:if test="${startPage > bottomLine }">
		<a href="<%=request.getContextPath() %>/bb2/list?pageNum=${startPage - bottomLine }">[이전]</a>
</c:if>

<c:forEach var="i" begin="${startPage }" end="${endPage }">
	<a href="<%=request.getContextPath() %>/bb2/list?pageNum=${i}">
	<c:if test="${i==currentPage }">
	<b>${i }</b>
	</c:if>
	<c:if test="${i != currentPage }">
	${i }
	</c:if>
	</a>
</c:forEach>

<c:if test="${endPage < pageCount }">
		<a href="<%=request.getContextPath() %>/bb2/list?pageNum=${endPage + 1 }">[다음]</a>
</c:if>
</div>

</c:if>
</div>

  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/popper.min.js"></script>
  
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/mdb.min.js"></script>
</body>
</html>