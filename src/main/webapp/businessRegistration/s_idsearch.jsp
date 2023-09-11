<%@page import="data.dao.ShopDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String s_id=request.getParameter("s_id1")+"-"+request.getParameter("s_id2")+"-"+request.getParameter("s_id3");

	ShopDao dao=new ShopDao();
	
	int check=dao.s_idCheck(s_id);
	
	JSONObject ob=new JSONObject();
	
	ob.put("check", check);
%>

<%=ob.toString()%>