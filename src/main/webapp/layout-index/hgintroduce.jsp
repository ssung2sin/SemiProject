<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Audiowide&family=Hi+Melody&family=Itim&family=Nanum+Pen+Script&family=Rock+Salt&family=Wallpoet&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">
<link href="https://webfontworld.github.io/goodchoice/Jalnan.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<title>Login Form</title>
</head>
<%
String root=request.getContextPath();
%>
<body>
<style>
	.introbox{
		/* border: 2px solid green; */
		position: absolute;
		text-align: center;
		top: 3vh;
		left: 25%;
		width: 50%;
	}
	
	#intro_text1{
		font-size: 4vh;
		font-family:Dongle;
	}
	
	#intro_text2{
		font-size: 10vh;
		font-family:Wallpoet;
		font-weight: bold;
	}
	
	#intro_text3{
		font-size: 5vh;
		font-family: Jalnan;
	}
	
	.introbox h6{
		font-family: Nanum Pen Script;
		font-size:2.5vh;
		color:white;
	}
	
	.iconbundle{
		position: absolute;
		top:53vh;
		font-size: 5.5vh;
		font-weight: bold;
		color:white;
	}
	
	#iconbundle1{
		margin-left: 14%;
	}
	#iconbundle2{
		margin-left: 49%;
	}
	
	#iconbundle3{
		margin-left: 83%;
	}

	.blackimg{
		position: absolute;
		width: 25%;
		height: 43vh;
	}
	
	#blackimg1{
		top: 55vh;
		margin-left: 3%;
	}
	
	#blackimg2{
		top: 55vh;
		margin-left: 37.5%;
	}
	
	#blackimg3{
		top: 55vh;
		margin-left: 72%;
	}
	
	.advantage{
		border-radius: 50%;
		position: absolute;
		width:18%;  /* 250 */
		height:35vh;
		text-align: center;
		/* margin-top: 4vh; */
		padding-top: 3vh;
		font-family: Jalnan;
		animation: bounce2 4s ease infinite;
		font-size: 4.5vh;
	}
	
	 @keyframes bounce2 {
		0%, 20%, 50%, 80%, 100% {transform: translateY(0);}
		40% {transform: translateY(-5vh);}
		60% {transform: translateY(-2vh);}
	}
	
	#advantage1{
		top: 63vh;
		left: 6.5%;	
	}
	
	#advantage2{
		top: 63vh;
		left: 41%;
	}
	
	#advantage3{
		top: 63vh;
		left: 75.5%;
	}
</style>
<div class="introbox">
	<h2><span id="intro_text2">HG</span><span id="intro_text3"> 소개</span></h2><br>
	<span id="intro_text1">휴게소에서 휴식만 취하다 갈 수 있도록 휴(休)고(GO)에서 준비했습니다<br>휴게소 간편 찾기부터 음식 주문까지 한 번에</span><br>
	<h6>Welcome to the HG website.</h6>
	<h6>Our site provides the following services for the convenience of rest area users.</h6>
	<h6>We will continue to work hard to provide better services.</h6>
</div>
	<div class="advantage" id="advantage1">
		<a>휴게소</a><br><a>간편 찾기</a><br><a>기능</a>
	</div>
	<div class="advantage" id="advantage2">
		<a>휴게소</a><br><a>시설 확인</a><br><a>기능</a>
	</div>
	<div class="advantage" id="advantage3">
		<a2>휴게소</a><br><a>음식 주문</a><br><a>예약 기능</a>
	</div>
		<div id="iconbundle1" class="iconbundle"><i class="bi bi-search"></i></div>
		<div id="iconbundle2" class="iconbundle"><i class="bi bi-geo-alt"></i></div>
		<div id="iconbundle3" class="iconbundle"><i class="bi bi-shop-window"></i></div>

<div>
	<img class="blackimg" id="blackimg1" src="<%=root%>/image/IntroImage/blacklaurel.png">
	<img class="blackimg" id="blackimg2" src="<%=root%>/image/IntroImage/blacklaurel.png">
	<img class="blackimg" id="blackimg3" src="<%=root%>/image/IntroImage/blacklaurel.png">
</div>
</body>
</html>