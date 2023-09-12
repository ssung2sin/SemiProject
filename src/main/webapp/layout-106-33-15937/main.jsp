<%@page import="java.text.SimpleDateFormat"%>
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
	String loginok=(String)session.getAttribute("loginok");
	String s_id=request.getParameter("id");
	String id=(String)session.getAttribute("id");
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

%> 
<style type="text/css">
	.ex-login{
		position: absolute;
		top: 300px;
		left: 200px;
		background-color: white;
	}

</style>
<script type="text/javascript">
	
	$(document).on("click",".menuAdd",function(){
		
		location.href="dpecoland.jsp?main=order/orderAddForm.jsp";
				
		
	})
	
	$(document).on("click",".enterShopMenu",function(){
		
		location.href="dpecoland.jsp?main=shop/shopList.jsp";
				
	})
	
</script>
</head>
<body>
<div class="ex-login">
	<div class="my-info"></div>
</div>
<div>
</div>
</body>
</html>