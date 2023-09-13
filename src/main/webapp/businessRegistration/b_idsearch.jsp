<%@page import="data.dao.ExpressDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String b_id=request.getParameter("b_id1")+"-"+request.getParameter("b_id2")+"-"+request.getParameter("b_id3");

	ExpressDao dao=new ExpressDao();
	
	int check=dao.b_idCheck(b_id);
	
	JSONObject ob=new JSONObject();
	ob.put("check",check);
%>

<%=ob.toString()%>