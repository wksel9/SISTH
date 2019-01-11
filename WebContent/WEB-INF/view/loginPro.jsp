
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>

<c:if test="${x==1 }">
	<% 
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	%>
</c:if>

<c:if test="${x==0 }">
<script>
	alert("비밀번호 X");
	history.go(-1);
</script>
</c:if>

<c:if test="${x==-1 }">
<script>
	alert("아이디 X");
	history.go(-1);
</script>
</c:if>
