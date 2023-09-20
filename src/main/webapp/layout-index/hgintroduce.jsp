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
		left: 65vh;
	}
	
	#intro_text1{
		font-size: 30px;
		font-family:Dongle;
	}
	
	#intro_text2{
		font-size: 80px;
		font-family:Wallpoet;
		font-weight: bold;
	}
	
	#intro_text3{
		font-size: 40px;
		font-family: Jalnan;
	}
	
	.introbox h6{
		font-family: Nanum Pen Script;
		font-size:20px;
		color:white;
	}
	
	.icon{
		/* border: 2px solid red; */
		position: absolute;
		top:53vh;
		font-size: 5.5vh;
		font-weight: bold;
		color:white;
		width: auto;
		left:20vh;
	}
	
	.iconbundle1{
		padding-left: 9vh;
		padding-right: 30vh;
	}
	
	.iconbundle2{
		padding-left: 34vh;
		padding-right: 30vh;
	}
	
	.iconbundle3{
		padding-left: 32vh;
	}

	.blackimg{
		position: absolute;
		width: 50vh;
		height: 43vh;
	}
	
	#blackimg1{
		top: 55vh;
		margin-left: 8vh;
	}
	
	#blackimg2{
		top: 55vh;
		margin-left: 79vh;
	}
	
	#blackimg3{
		top: 55vh;
		margin-left: 149vh;
	}
	
	.advantage{
		border-radius: 50%;
		position: absolute;
		width:38vh;  /* 250 */
		height:35vh;
		text-align: center;
		/* margin-top: 4vh; */
		padding-top: 20px;
		font-family: Jalnan;
		animation: bounce2 4s ease infinite;
		font-size: 20vh;
	}
	
	 @keyframes bounce2 {
		0%, 20%, 50%, 80%, 100% {transform: translateY(0);}
		40% {transform: translateY(-4vh);}
		60% {transform: translateY(-15px);}
	}
	
	#advantage1{
		top: 63vh;
		left: 12vh;	
	}
	
	#advantage2{
		top: 63vh;
		left: 83.8vh;
	}
	
	#advantage3{
		top: 63vh;
		left: 154vh;
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
		<h2>휴게소</h2><h2>간편 찾기</h2><h2>기능</h2>
	</div>
	<div class="advantage" id="advantage2">
		<h2>휴게소</h2><h2>시설 확인</h2><h2>기능</h2>
	</div>
	<div class="advantage" id="advantage3">
		<h2>휴게소</h2><h2>음식 주문</h2><h2>예약 기능</h2>
	</div>
	<div class="icon">
		<span class="iconbundle1"><i class="bi bi-search"></i></span>
		<span class="iconbundle2"><i class="bi bi-geo-alt"></i></span>
		<span class="iconbundle3"><i class="bi bi-shop-window"></i></span>
	</div>
<div>
	<img class="blackimg" id="blackimg1" src="<%=root%>/image/IntroImage/blacklaurel.png">
	<img class="blackimg" id="blackimg2" src="<%=root%>/image/IntroImage/blacklaurel.png">
	<img class="blackimg" id="blackimg3" src="<%=root%>/image/IntroImage/blacklaurel.png">
</div>
</body>
</html>