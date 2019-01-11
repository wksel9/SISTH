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
</head>

<body>
<form action="<%= request.getContextPath() %>/bb2/update" 
method="post" name="updateform">
<input type="hidden" name="num" value="${article.num}">
<%-- <input type="hidden" name="pageNum" value="<%=pageNum%>"> --%>

<center>
<div class="w3-container">
<h3>게시판</h3>
	<table class="w3-table-all" style="width:50%;">
	
	<tr>
		<td>제목</td>
		<td><input type="text" name="subject" size="20" value="${article.subject}"></td>
	</tr>
	<tr>
		<td>ID </td>
		<td><input type="text" name="writer" value="${id} " readonly="readonly"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="content" rows="13" cols="40">${article.content}</textarea></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd" size="10" ></td>
	</tr>
	<tr>
		<td colspan="2" style="padding-left:30%">
		<input type="submit" value="수정하기" >
		<input type="reset" value="다시작성">
		<input type="button" value="목록보기" OnClick="window.location='<%= request.getContextPath()%>/bb2/list.jsp'">
		</td>
	</tr>

</table>
</div>
</center>
</form>
</body>
</html>