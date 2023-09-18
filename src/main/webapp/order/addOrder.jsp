<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="data.dao.MenuDao"%>
<%@page import="data.dto.MenuOrderDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String receipt=request.getParameter("receipt");
	String s_id=request.getParameter("s_id");
	String u_id=request.getParameter("u_id");
	String totPrice=request.getParameter("totPrice");
	String num=request.getParameter("num");
	System.out.println("num = "+num);
	
	MenuOrderDto dto=new MenuOrderDto();
	dto.setNum(num);
	dto.setS_id(s_id);
	dto.setReceipt(receipt);
	dto.setU_id(u_id);
	dto.setTotal_price(totPrice);
	
	LocalDateTime now=LocalDateTime.now();
	String sdfNow=now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.0"));		//현재 시간
	
	MenuDao dao=new MenuDao();
	
	dao.insertOrderMenu(dto, sdfNow);
%>