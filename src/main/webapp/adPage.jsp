<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>HG 관리자</title>
 
<%
// 절대경로잡기
String root = request.getContextPath();

//mainPage 경로
String mainPage = "layout-adPage/main.jsp";


//main경로 수정
if (request.getParameter("main")!= null) {
   mainPage = request.getParameter("main");
}
%>
<style type="text/css">
	div.layout{
   		position: absolute;
   		
	}

	div.main{
	margin-top:10vh;
   		width: 70%;
   		height: 100%;
   		font-size: 13pt;
   		margin-left: 15%;
		background-color: orange;
	}
	
	div.menu {
	 margin-top:10vh;
  	 width: 15%;
  	 height: 100vh;
  	 background-color:rgba(0,0,0,0.7);
	}
	div.title {

  	 width: 15%;
  	 height: 10vh;
  	 background-color:blue;
  	 /*background-color:rgba(0,0,0,0.7);*/
	}
</style>
</head>
<body>
<body>
<div class="layout menu">
	<jsp:include page="layout-adPage/menu.jsp"/>
</div>
<div class="layout main">
	<jsp:include page='<%=mainPage %>'/>
</div>
<div class="layout title">
	<jsp:include page="layout-adPage/title.jsp"/>
</div>
</body>
</html>