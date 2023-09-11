<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/style-headerDp.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/kit_code.js" crossorigin="anonymous"></script>
<title>Nav Bar</title>
</head>
<%
//절대경로보기
String root = request.getContextPath();
String mainPage = "layout/main.jsp"; //기본페이지
%>
<body>
	<nav class="navbar">

		<h1 class="header-logo">
			<a href="<%=root%>/dpecoland.jsp"> <img src="image/logo.png"
				alt="덕평자연휴게소">
			</a>
		</h1>
		<ul class="navbar__menu">
			<li><a href="#">소개</a></li>
			<li><a href="#">시설안내</a></li>
			<li><a href="#">음식점</a></li>
			<li><a href="#">고객센터</a></li>
		</ul>

		<ul class="navbar__icons">
			<li><i class="fab fa-google"></i></li>
			<li><i class="fab fa-slack"></i></li>
		</ul>

	</nav>
</body>
</html>