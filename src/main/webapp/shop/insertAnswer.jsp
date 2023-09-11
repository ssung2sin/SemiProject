<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@page import="data.dto.MenuDto"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.MenuDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MenuAnswerDao"%>
<%@page import="data.dto.MenuAnswerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String u_id=request.getParameter("u_id");
	String content=request.getParameter("content");
	int starScore=Integer.parseInt(request.getParameter("starScore"));
	String sang_num=request.getParameter("sang_num");
	System.out.println("sang_num="+sang_num);
	
	LocalDateTime now=LocalDateTime.now();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String sdfNow=now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.0"));
	
	MenuAnswerDto dto=new MenuAnswerDto();
	
	dto.setU_id(u_id);
	dto.setContent(content);
	dto.setSang_num(sang_num);
	dto.setU_star_score(starScore);
	
	MenuAnswerDao dao=new MenuAnswerDao();
	
	dao.insertMenuAnswer(dto,sdfNow);
	
	double avgStarScore=dao.totalStarScore(sang_num);
	
	System.out.println(avgStarScore);
	
	NumberFormat nf=new DecimalFormat("0.##");
	
	
	
	MenuDao mdao=new MenuDao();
	
	mdao.updateStarScore(Double.parseDouble(nf.format(avgStarScore)),sang_num);
%>
