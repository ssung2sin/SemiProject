<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.ExpressDto"%>
<%@page import="data.dao.ExpressDao"%>
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	System.out.println("id="+id);
	session.setAttribute("idok", id);
	session.setAttribute("loginok", "yes");

	String grade="";
	String name="";
	
	UserDao udao=new UserDao();
	ExpressDao edao=new ExpressDao();
	ShopDao sdao=new ShopDao();

	UserDto udto=udao.getData(id);
	ExpressDto edto=edao.getData(id);
	ShopDto sdto=sdao.getData(id);
	
	if(udto.getNum()!=null){
		grade="user";
		name=udto.getU_name();	
	}
	if(edto.getB_name()!=null){
		grade="express";
		name=edto.getB_name();
	}
	if(sdto.getS_name()!=null){
		grade="shop";
		name=sdto.getS_name();
	}
	JSONObject ob=new JSONObject();
	
	ob.put("grade",grade);
	ob.put("id", id);
	ob.put("name",name);
%>
<%=ob.toString()%>