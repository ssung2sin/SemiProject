<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId=request.getParameter("userId");
	UserDao dao=new UserDao();
	int count=dao.isUserIdCheck(userId);
	System.out.println("count= "+count);
	
	//이 파일을 json 형식으로 만들기 위해 아래처럼 호출한다
    JSONObject ob=new JSONObject();
	ob.put("count", count);
%>
<%=ob.toString()%> 
 