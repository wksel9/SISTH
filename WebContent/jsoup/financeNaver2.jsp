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
</head>
<%-- <%
	String url ="http://info.finance.naver.com/marketindex/exchangeDetail.nhn?marketindexCd=FX_JPYKRW";
	String line ="";
	try{
		Document doc;
		doc = Jsoup.connect(url).get();
		Elements medial = doc.select("iframe");
		for(Element src : medial){
			String templine = src.toString();
			templine = templine.replace("src=\"","src=\"http://info.finance.naver.com/");
			line+=templine;
		}
	}catch(IOException e){
		e.printStackTrace();
	}

%> --%>
<%-- <%
	String url ="https://sports.news.naver.com/kbaseball/index.nhn";
	String line ="";
	try{
		Document doc;
		doc = Jsoup.connect(url).get();
		Elements medial = doc.select("table.kbo");
		for(Element src : medial){
			String templine = src.toString();
			line+=templine;
		}
	}catch(IOException e){
		e.printStackTrace();
	}

%> --%>

<%
	String url ="http://yagujango.com/yagudjango/5";
	String line ="";
	try{
		Document doc;
		doc = Jsoup.connect(url).get();
		Elements medial = doc.select("div.stadium_price_tbody ");
		for(Element src : medial){
			String templine = src.toString();
			line+=templine;
		}
	}catch(IOException e){
		e.printStackTrace();
	}

%>

<body>
<%=line %>
</body>
</html>