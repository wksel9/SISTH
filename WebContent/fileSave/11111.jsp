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
<style >
.table-wrapper-scroll-y {
display: block;
max-height: 200px;
overflow-y: auto;
-ms-overflow-style: -ms-autohiding-scrollbar;
}
</style>
</head>
<body>


<div class="table-wrapper-scroll-y">

  <table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">First</th>
        <th scope="col">Last</th>
        <th scope="col">Handle</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th scope="row">1</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
      </tr>
      <tr>
        <th scope="row">2</th>
        <td>Jacob</td>
        <td>Thornton</td>
        <td>@fat</td>
      </tr>
      <tr>
        <th scope="row">3</th>
        <td>Larry</td>
        <td>the Bird</td>
        <td>@twitter</td>
      </tr>
      <tr>
        <th scope="row">4</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
      </tr>
      <tr>
        <th scope="row">5</th>
        <td>Jacob</td>
        <td>Thornton</td>
        <td>@fat</td>
      </tr>
      <tr>
        <th scope="row">6</th>
        <td>Larry</td>
        <td>the Bird</td>
        <td>@twitter</td>
      </tr>
    </tbody>
  </table>
</div>


<input id="input-1-ltr-star-xs" name="input-1-ltr-star-xs" class="kv-ltr-theme-svg-star rating-loading" value="1" dir="ltr" data-size="xs">
<br/>
<input id="input-2-ltr-star-sm" name="input-2-ltr-star-sm" class="kv-ltr-theme-svg-star rating-loading" value="2" dir="ltr" data-size="sm">
<br/>
<input id="input-3-ltr-star-md" name="input-3-ltr-star-md" class="kv-ltr-theme-svg-star rating-loading" value="3" dir="ltr" data-size="md">
<br/>
<input id="input-4-ltr-star-lg" name="input-4-ltr-star-lg" class="kv-ltr-theme-svg-star rating-loading" value="4" dir="ltr" data-size="lg">
<br/>
<input id="input-5-ltr-star-xl" name="input-5-ltr-star-xl" class="kv-ltr-theme-svg-star rating-loading" value="5" dir="ltr" data-size="xl">
<br/>
 
<script>
$(document).on('ready', function(){
    $('.kv-ltr-theme-svg-star').rating({
        hoverOnClear: false,
        theme: 'krajee-svg'
    });
});
</script>

  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/popper.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/mdb.min.js"></script>
</body>
</html>