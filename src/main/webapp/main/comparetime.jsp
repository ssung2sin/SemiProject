<%@page import="java.util.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="javax.print.attribute.standard.DateTimeAtCompleted"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String login=request.getParameter("login");
	System.out.println(login);

	LocalDateTime now=LocalDateTime.now();
	
	//System.out.println(now);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	String sdf_now=now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	
	System.out.println(sdf_now);
	
	
	Date today=sdf.parse(sdf_now);
	Date logindate=sdf.parse(login);
	
	int dif = (int)((today.getTime()-logindate.getTime())/(60*1000));
	
	System.out.println(dif);

%>