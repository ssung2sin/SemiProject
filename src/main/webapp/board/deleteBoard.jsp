<%@page import="data.dao.BoardDao"%>
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
</head>
<body>
<%
	String root=request.getContextPath();
	
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	System.out.println(currentPage);
	
	//db로부터 저장된 이미지명 얻기
	BoardDao dao=new BoardDao();
	
	//db삭제
	dao.deleteBoard(num);
	
	//실제경로
	String realPath=getServletContext().getRealPath("/save");
	
	//보던페이지로 이동
	response.sendRedirect(root+"/subPage.jsp?main=board/freeBoard.jsp?currentPage="+currentPage);
%>
</body>
</html>