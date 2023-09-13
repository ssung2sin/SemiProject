<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MenuDao"%>
<%@page import="data.dto.MenuAnswerDto"%>
<%@page import="data.dao.MenuAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx=request.getParameter("idx");
	String content=request.getParameter("content");
	int starScore=Integer.parseInt(request.getParameter("starScore"));
	String sang_num=request.getParameter("sang_num");
	
	MenuAnswerDao dao=new MenuAnswerDao();
	
	MenuAnswerDto dto=new MenuAnswerDto();
	dto.setIdx(idx);
	dto.setContent(content);
	dto.setU_star_score(starScore);
	System.out.println(dto.getU_star_score());
	
	dao.updateAnswer(dto);
	double avgStarScore=dao.totalStarScore(sang_num);
	
	System.out.println(avgStarScore);
	
	NumberFormat nf=new DecimalFormat("0.##");
	MenuDao mdao=new MenuDao();
	
	mdao.updateStarScore(Double.parseDouble(nf.format(avgStarScore)), sang_num);
%>