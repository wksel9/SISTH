<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Movieless</title>

<%

   String url1 = "http://yagujango.com/yagudjango/5/";
   String line = "";

   try {
      Document doc1, doc2, doc3, doc4;
      doc1 = Jsoup.connect(url1).get();

      Elements media1 = doc1.select("table");
      Elements media2 = doc1.select("td:eq(2)");

      
      List li1 = new ArrayList();
      List li2 = new ArrayList();
      List li3 = new ArrayList();
      List li4 = new ArrayList();
      
      for (Element src : media2) {
         String templine = src.select("td").text();
         li1.add(templine);

      }
     
%>

</head>
<body>

   <div class="row">
   
      <h1>오늘의 환율</h1>
      <div>
         <table class="w3-table-all" width="100%" border="1">
            <thead>
               <tr class="w3-grey">
                  <th>통화명</th>
                  <th>통화 코드</th>
                  <th>오늘 가격 (단위: 원)</th>
                  <th>어제 가격 (단위: 원)</th>
                  <th>전일대비 손익</th>
               </tr>
            </thead>



            <tbody align="center">
               <%
                  for (int i = 0; i < li1.size(); i++) {
               %>
               <tr>
                  <th><%=li3.get(i)%></th>
                  <td><%=li4.get(i)%></td>
                  <td><%=li2.get(i)%></td>
                  <td><%=li1.get(i)%></td>
                  <td>diff</td>
               </tr>
               <%
                  }
               %>

            </tbody>

         </table>

      </div>
   </div>
   <hr>
   <%
      } catch (IOException e) {
         e.printStackTrace();
      }
   %>

</body>
</html>