<%@page import="java.text.DecimalFormat"%>
<%@page import="data.dao.MenuDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MenuAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx=request.getParameter("idx");
	String sang_num=request.getParameter("sang_num");
	
	MenuAnswerDao dao=new MenuAnswerDao();
	
	dao.deleteAnswer(idx);
	
	double avgStarScore=dao.totalStarScore(sang_num);
	
	System.out.println(avgStarScore);
	
	NumberFormat nf=new DecimalFormat("0.##");
	MenuDao mdao=new MenuDao();
	
	mdao.updateStarScore(Double.parseDouble(nf.format(avgStarScore)), sang_num);


%>