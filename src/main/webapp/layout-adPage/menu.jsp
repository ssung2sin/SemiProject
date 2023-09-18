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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>Insert title here</title>
<style type="text/css">
	#userlist{
		
		color: white;
	}
	a{
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(function() {
		$('#asd').hide();
		$('#asd3').hide();
		$("#user_information").click(function(){
	    	/* location.href='adPage.jsp'; */
	    	$('#asd').toggle();
	    	$('#circle1').toggle();
	    });
		$("#Payment_details").click(function(){
	    	/* location.href='adPage.jsp'; */
			$('#asd3').toggle();
			$('#circle2').toggle();
	    });
	});

</script>

</head>
<body>
<div id="userlist">
	<li><a id="user_information" >사용자 관리<i class="bi bi-plus-circle" id="circle1"></i></a></li>
	<ul id="asd">
	<li><a id="individual">개인</a></li>
	<li><a id="master">휴게소주</a></li>
	<li><a id="business">입점업주</a></li>
	</ul>
	
	<li><a id="login_history" >로그인기록</a></li>
	
	<li><a id="Payment_details" >결제내역<i class="bi bi-plus-circle" id="circle2"></i></a></li>
	<ul id="asd3">
	<li><a id="individual">음식점</a></li>
	</ul>
</div>
	
</body>
</html>