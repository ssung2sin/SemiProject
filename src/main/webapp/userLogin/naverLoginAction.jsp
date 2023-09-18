<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="data.dao.UserDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId=request.getParameter("u_id");
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.0");
	
	LocalDateTime now=LocalDateTime.now();
	String sdfNow=now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.0"));		//현재 시간

	request.setCharacterEncoding("utf-8");
	session.setMaxInactiveInterval(60*60*2);  //로그인 지속시간 2시간 설정
	session.setAttribute("loginok", "yes");  //로그인 된 상태인지 다른 페이지에서 볼 수 있도록
	session.setAttribute("id", userId); //로그인 후, 누가 로그인 했는지 표시
	session.setAttribute("grade","user");	
	
	UserDao dao=new UserDao();
	dao.updateLL_date(userId, sdfNow);

%>