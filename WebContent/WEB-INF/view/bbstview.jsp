<%@page import="bb2.StbpBean"%>
<%@page import="bb2.StbpDBBean"%>
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
 
<style>
 .t{ margin-top:100px;}


.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}

</style>
<title>Insert title here</title>
</head>

<body>

<div>
<div align="center">
<div class="row t" style="width:1000px">
	<div class="col-6">
	<div align="left" ><a href="<%=request.getContextPath() %>/bb2/bbst?bno=${st.bno}" ><i class="fa fa-mail-reply fa-2x pb-3 " aria-hidden="true"></i></a></div>
<ul class="nav nav-tabs md-tabs" id="myTabMD" role="tablist" style="width:500px">
  <li class="nav-item ">
    <a class="nav-link active" id="home-tab-md" data-toggle="tab" href="#home-md" role="tab" aria-controls="home-md" aria-selected="true">정면</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="profile-tab-md" data-toggle="tab" href="#profile-md" role="tab" aria-controls="profile-md" aria-selected="false">외야</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="contact-tab-md" data-toggle="tab" href="#contact-md" role="tab" aria-controls="contact-md" aria-selected="false">응원단</a>
  </li>
</ul>
<div class="tab-content card " id="myTabContentMD" style="width:500px">
  <div class="tab-pane fade show active" id="home-md" role="tabpanel" aria-labelledby="home-tab-md">
    <img src="<%=request.getContextPath() %>/resources/img/mapimg/${st.img4 }.png" width="500px">
  </div>
  <div class="tab-pane fade" id="profile-md" role="tabpanel" aria-labelledby="profile-tab-md">
    <img src="<%=request.getContextPath() %>/resources/img/mapimg/${st.img3 }.png" width="500px">
  </div>
  <div class="tab-pane fade" id="contact-md" role="tabpanel" aria-labelledby="contact-tab-md">
    <img src="<%=request.getContextPath() %>/resources/img/mapimg/${st.img2 }.png" width="500px">
  </div>
</div>
</div>

<div class="col-6" style="margin-top:50px">
<div> <h3>${st.g} 구역${st.r } 열 ${st.n }번</h3> </div>
<%-- <input type="hidden" name="r" value='<%=st.getR()%>'>
<input type="hidden" name="n" value='<%=st.getN()%>'> --%>
<img src="<%=request.getContextPath() %>/resources/img/mapimg/${st.img1 }.png" width="355px" style="margin-top:30px"  usemap="#ma2">
<map name="ma2">
		<area shape="rect" coords="89,83,94,91" href="<%= request.getContextPath() %>/bb2/bbstview?bno=1&g=1&r=G&n=17" target="_self">
		<area shape="rect" coords="118,205,124,213" href="<%= request.getContextPath() %>/bb2/bbstview?bno=1&g=1&r=O&n=15" target="_self">
	</map>
</div>
</div>
</div>
 
<%-- <div class="container"style="margin-top:150px">
<div class="classic-tabs mx-2">

  <ul class="nav tabs-orange" id="myClassicTabOrange" role="tablist">
    <li class="nav-item">
      <a class="nav-link waves-light" id="follow-tab-classic-orange" data-toggle="tab" href="#follow-classic-orange" role="tab" aria-controls="follow-classic-orange" aria-selected="false">
      <i class="fa fa-thumbs-up fa-2x pb-2" aria-hidden="true"></i><br>추천</a>
    </li>
  </ul>
    
    <form action=""  method="post">
    <table >
     <tr>
    <td>
    <!--  <div class="starRev" >
  		<span class="starR on">별1</span>
  		<span class="starR on">별2</span>
  		<span class="starR on">별3</span>
  		<span class="starR on">별4</span>
  		<span class="starR on">별5</span>
	</div> -->
	
	</td>
	<td><%=session.getAttribute("id") %></td>
	<td >
	<input type="text"  style="width:100%" name="content"> 
	</td>
	<td><input type="submit" value="등록"></td>
	</table>
	
	
	<table >
	<%
		for(int i=0; i<articleList.size(); i++){
			BoardDataBean article = (BoardDataBean)articleList.get(i);
	%>
	<tr>
	<td ><%= --number %></td>
	<td>	<%=article.getSubject() %></a></center></td>
	</tr>
	
<% } %>
	</table>
	</form>
</div>
</div> --%>
</div>


 
<!-- <script >
$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  return false;
	});
</script> -->
</body>
</html> 