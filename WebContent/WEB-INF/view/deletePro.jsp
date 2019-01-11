<%@page import="bb2.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>



<c:if test="${x==1 }">
	<meta http-equiv = "Refresh" content = "0;url=<%= request.getContextPath() %>/bb2/list">
</c:if>
<c:if test="${x==0 }">
	<script>
		alert("비밀번호 X");
		history.go(-1);
	</script>
</c:if>
<c:if test="${x==-1 }">
	<script>
		alert("번호 X");
		history.go(-1);
	</script>
</c:if>