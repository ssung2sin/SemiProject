<%@page import="data.dto.ExpressDto"%>
<%@page import="data.dao.ExpressDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Audiowide&family=Hi+Melody&family=Itim&family=Nanum+Pen+Script&family=Rock+Salt&family=Wallpoet&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ddc717c4e4cd5fed053858415435334&libraries=services"></script>

<title>Insert title here</title>
<style type="text/css">
#titlepageasa{
   font-family:Wallpoet;
   font-size: 5vh;
   color:gold;
   cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#titlepageasa").click(function(){
	    	location.href='adPage.jsp';
	    });
	});

</script>

</head>
<body>
	<h1 id="titlepageasa">HG<br>관리자</h1>
</body>
</html>