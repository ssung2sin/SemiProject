<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.UserDto"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
   href="https://fonts.googleapis.com/css2?family=Dongle:wght@300;400;700&family=Gaegu:wght@300&family=Noto+Serif+KR:wght@200&family=Single+Day&display=swap"
   rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>	
</head>
<%
	String root=request.getContextPath();
	request.setCharacterEncoding("utf-8");

	String token=request.getParameter("N_token");
	String email=request.getParameter("email");
	String name=request.getParameter("name");
	
	LocalDateTime now=LocalDateTime.now();
	String sdfNow=now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.0"));
	
	//데이터 읽어서 dto 넣기 
	UserDto dto=new UserDto();
	dto.setU_id(token);
	dto.setU_pass("");
	dto.setU_name(name);
	dto.setU_hp("");
	dto.setU_birth("");
	dto.setU_email(email);
	
	UserDao dao=new UserDao();
	dao.insertNaver(dto, sdfNow);
	
	//회원가입이나 로그인 하면 인덱스로 이동
	response.sendRedirect("../index.jsp");
%>
<body>

</body>
</html>