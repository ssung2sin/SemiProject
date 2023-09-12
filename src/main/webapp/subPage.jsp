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
	String s_id=request.getParameter("id");
	System.out.println(s_id);
	if(s_id==null || s_id.equals("null")){
		s_id=(String)session.getAttribute("s_id");
		System.out.println("s_id="+s_id);
	}
	String mainPage="layout-"+s_id+"/main.jsp"; //기본페이지
	String header="layout-"+s_id+"/header.jsp";
	String footer="layout-"+s_id+"/footer.jsp";

	//url을 통해서 main값을 얻어서 메인웹페이지에 출력
	if(request.getParameter("main")!=null){
		mainPage=request.getParameter("main");
	}
%> 
<style type="text/css">
	body{
   		background-image: url("<%=root%>/image/visual_01.jpg");
     	background-size :100% 100vh;
    	background-attachment: scroll;
   		background-repeat: no-repeat;
	}
	div.layout {
   		position: absolute;
   		
	}

	div.header {
   		width: 100%;
   		height: 20%;
   		position: fixed;
  		text-align: center;
   		background-color:pink;
	}

	div.main {
   		width: 70%;
   		height: 84%;
   		font-size: 13pt;
   		margin-left: 15%;
   		top: 15%;
		background-color: orange;
	}

	div.info {
   		width:13%;
  		height:30%;
  		line-height: 10px;
  		border-radius: 3%;
  		right: 1%;
  		padding: 20px 10px;
  
  		display: inline-block;   
  		position:fixed;
  		top:30%;
  		background-color: blue;
  
	}
</style>
</head>
<body>
<body>

<div class="layout main">
	<jsp:include page="<%=mainPage %>"/>
</div>
<div class="layout footer">
	<jsp:include page="<%=footer %>"/>
</div>
<div class="layout header">
	<jsp:include page="<%=header %>"/>
</div>
</body>
</html>