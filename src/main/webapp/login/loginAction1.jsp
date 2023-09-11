<%@page import="data.dto.ShopDto"%>
<%@page import="data.dto.ExpressDto"%>
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.ExpressDao"%>
<%@page import="data.dao.UserDao"%>
<%@page import="org.json.simple.JSONObject"%>
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
	/* ExpressDao edao=new ExpressDao();
	ShopDao sdao=new ShopDao(); */
	
	UserDto udto=udao.getData(id);
	/* ExpressDto edto=edao.getData(id);
	ShopDto sdto=sdao.getData(id); */
	
	if(udto.getNum()!=null){
		grade="이용객";
		name=udto.getU_name();
		
	}/* else if(edto.getB_id()!=null){
		grade="사업자(휴게소)";
		name=edto.getB_name();
	}
	else{
		grade="가게(음식점주)";
		name=sdto.getS_name();
	}*/
	JSONObject ob=new JSONObject();
	
	ob.put("grade",grade);
	ob.put("id", id);
	ob.put("name",name);
%>
<%=ob.toString()%>