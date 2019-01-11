<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-gap: 10px;
	width: 40%;
}

</style>
</head>

<%
	String url ="http://yagujango.com/yagudjango/6";
	String line ="";
	try{
		Document doc;
		doc = Jsoup.connect(url).get();
		Elements medial = doc.select(".stadium_price_tbody ");
		for(Element src : medial){
			String templine = src.text();
			line+=templine;
		}
	}catch(IOException e){
		e.printStackTrace();
	}
  String str[] = line.split(" ");
%>

<body>


<div class="wrapper">
<% for(int i=0;i<str.length/2;i++) {%>
 <div> <%=str[i]%></div>
<%} %>
</div>
</body>
</html>