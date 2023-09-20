<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="data.dto.BoardDto"%>
<%@page import="data.dao.BoardDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	//db에 저장할 아이디얻기
	String id=(String)session.getAttribute("id");

	//이미지 업로드 실제 경로
	String realPath=getServletContext().getRealPath("/save");
	System.out.println(realPath);
	
	int uploadSize=1024*1024*100;
	
	MultipartRequest multi=null;
	
	try{
	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
	
	//주의 : request가 아닌 multi변수로 모든 폼데이타를 읽어야한다
	String num=multi.getParameter("num");
	String content=multi.getParameter("content");
	String title=multi.getParameter("title");
	String express=multi.getParameter("express");
	String currentPage=multi.getParameter("currentPage");

	System.out.println("num="+num);
	//dao
	BoardDao dao=new BoardDao();	
	
	
	//dto에 저장
	BoardDto dto=new BoardDto();
	
	dto.setNum(num);
	dto.setContent(content);
	dto.setExpress(express);
	dto.setTitle(title);
	
	//dao 선언
	dao.updateBoard(dto);
	
	//방명록 목록으로 이동
	response.sendRedirect("../subPage.jsp?main=board/freeBoard.jsp?currentPage="+currentPage);
	} catch(Exception e){
		System.out.println(e.getMessage());
	}
%>
</body>
</html>