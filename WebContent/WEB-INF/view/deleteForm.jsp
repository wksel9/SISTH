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

<div class="w3-container">
	<b>�ۻ���</b><br>
	<form method="post" name="delForm" action="<%= request.getContextPath() %>/bb2/delete">
		<input type="hidden" name="num" value="${article.num }">
<%-- 		<input type="hidden" name="pageNum" value="<%=pageNum %>"> --%>
			<table class = "table-bordered" width="360">
				<tr height="30">
					<td align=center><b>��й�ȣ �Է��� �ּ���</b></td>
				</tr>
				<tr height="30">
					<td align=center>��й�ȣ :
					<input type="password" name="passwd" ></td>
				</tr>
				<tr height="30">
					<td align=center>
					<input type="submit" value="�ۻ���">
					<input type="button" value="�۸��" OnClick="window.location='<%= request.getContextPath()%>/bb2/list'">
					</td>
				</tr>				
			</table>
	</form>
</div>

</body>
</html>