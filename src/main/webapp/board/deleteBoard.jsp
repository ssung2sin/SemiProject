<%@page import="data.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root=request.getContextPath();
	
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	System.out.println("currentPage"+currentPage);
	
	//db로부터 저장된 이미지명 얻기
	BoardDao dao=new BoardDao();
	
	//db삭제
	dao.deleteBoard(num);
	
	//실제경로
	String realPath=getServletContext().getRealPath("/save");
	
	//보던페이지로 이동
	response.sendRedirect(root+"/subPage.jsp?main=board/freeBoard.jsp&currentPage="+currentPage);
%>
