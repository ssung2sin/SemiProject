<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="data.dao.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num=request.getParameter("num");
	int time=Integer.parseInt(request.getParameter("time"));
	System.out.println("num="+num+",time="+time);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.0");
	
	MenuDao dao=new MenuDao();
	
	LocalDateTime now=LocalDateTime.now();
	String sdfNow=now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.0"));
	Date today = sdf.parse(sdfNow);
	
	Calendar cal = Calendar.getInstance();
	cal.setTime(today);
	cal.add(Calendar.MINUTE, time);
	Date add=cal.getTime();
	String addTime=sdf.format(add);
	System.out.println("더한시간 : "+addTime);
	dao.updatePrepareTime(addTime, num);
%>