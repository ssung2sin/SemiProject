<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.UserDto"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String root=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	LocalDateTime now=LocalDateTime.now();
	/* SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm"); */
	String sdfNow=now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.0"));

	//데이터 읽어서 dto 넣기
	UserDto dto=new UserDto();
	String userId=request.getParameter("u_id");
	System.out.println("u_id="+userId);
	String userName=request.getParameter("u_name");
	String userPass="";
	String userHp="";
	String userBirth="";
	String userEmail=request.getParameter("u_email");
	
	
	dto.setU_id(userId);
	dto.setU_pass(userPass);
	dto.setU_name(userName);
	dto.setU_hp(userHp);
	dto.setU_birth(userBirth);
	dto.setU_email(userEmail);

	
	//dao 선언 이후 insert 호출
	UserDao dao=new UserDao();
	dao.insertUser(dto, sdfNow);

%>