
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.map-container-3{
overflow:hidden;
padding-bottom:56.25%;
position:relative;
height:0;
}
.map-container-3 iframe{
left:0;
top:0;
height:100%;
width:100%;
position:absolute;
}

.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-gap: 10px;
	width: 100px;
}

</style>
<title>Insert title here</title>
</head>

<body>


 <div class="container t" style="width: 100%">
 
 <table  ><!--전체 윤곽 테이블 시작-->

    <tr>
     <td>

  	<h4 class="text-danger font-weight-bold ">${bb.stname }</h4>
  	
  	<div style="width:750px; height: 775px; ">
     <img  src="<%= request.getContextPath() %>/resources/img/mapimg/${bb.img1}.png"  usemap="#ma1"  >
   <map name="ma1">
		<area shape="poly" coords="506,416,525,389,566,419,549,444" href="<%= request.getContextPath() %>/bb2/bbstview?bno=${bb.bno }&g=1&r=G&n=17" target="_self" title="1">
	</map>
	</div>
	

     </td>
    
       <div class="table-wrapper-scroll-y">
     <td>
     		 <pre class="font-weight-bold"> 좌석			 주중			 주말</pre>
			<hr>
			<div class="wrapper" style="width:500px">
			<c:forEach var="aaa" items="${str}"    varStatus="status">
			<c:if test="${status.index < 59 }">
			<%-- <% for(int i=0;i<str.length/2;i++) {%> --%>
			 <div> ${aaa}</div>			
			 </c:if>
			</c:forEach>
			</div>
			
	</td>
	</div>
	</tr>
</table>

</div>



  <!--Grid column-->
  <div class="container "style="margin-top:180px; margin-bottom: 150px">



      <!--Card image-->
      <div class="view view-cascade gradient-card-header  blue-text">
      <i class="fa fa-map-marker   fa-2x pb-2" aria-hidden="true" >  찾아오시는 길</i>
        
      </div>
      <!--/Card image-->

      <!--Card content-->
      <div class="card-body card-body-cascade text-center">

        <!--Google map-->
        <div id="map-container-google-8" class="z-depth-1-half map-container-3" style="height: 200px">
          <iframe src="https://maps.google.com/maps?q=${bb.bmap } &t=&z=17&ie=EUC-KR&iwloc=&output=embed"
            frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>

      </div>
      <!--/.Card content-->

 

  </div>


  <!-- /Start your project here-->

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/popper.min.js"></script>
  
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/mdb.min.js"></script>

</body>
</html>