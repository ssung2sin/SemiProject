<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<%
	//절대경로보기
	String root=request.getContextPath();
	String mainPage="layout/mainDp.jsp"; //기본페이지

	//url을 통해서 main값을 얻어서 메인웹페이지에 출력
	if(request.getParameter("main")!=null){
		mainPage=request.getParameter("main");
	}
%> 
<style type="text/css">
	div.layout{
		/* border: 2px solid gray; */
	}
	div.footer{
		/* border: 3px solid red; */
		width:1520px;
		height: 500px;
		line-height: 10px;
		font-size: 18px;
	}
	div.header{
		/* border: 2px solid blue; */
		position: fixed;	
		width:1520px;
		height:110px;
		z-index: 10;
	}
	div.main{
		/* border: 2px solid black; */
		position: absolute;
		top:110px;
		width:1520px;
		height:670px;
		z-index: 3;
	}
</style>
</head>
<body>
<body>
<img alt="" src="<%=root%>/image/visual_01.jpg" style="width: 1520px; z-index: 1">
<div class="layout header">
	<jsp:include page="layout/headerDp.jsp"/>
</div>
<div class="layout main">
	<jsp:include page="<%=mainPage %>"/>
</div>
<div class="layout footer">
	<jsp:include page="layout/footerDp.jsp"/>
</div>

</body>
</html>