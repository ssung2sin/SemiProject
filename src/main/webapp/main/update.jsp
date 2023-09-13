<%-- <%@page import="java.util.Date"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.PracticeMemberDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.PracticeMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx=request.getParameter("idx");

	PracticeMemberDao dao=new PracticeMemberDao();
	
	dao.updateloginday(idx);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-
	MM-dd HH:mm");
	PracticeMemberDto dto=dao.selectMember(idx);
	
	Date login_date=sdf.parse(sdf.format(dto.getLast_login_date()));
	
	login_date.setHours(login_date.getHours()+9);
	
	JSONObject ob=new JSONObject();
	//System.out.println(dto.getName());
	ob.put("idx", dto.getIdx());
	ob.put("nick", dto.getNick());
	ob.put("pass", dto.getPass());
	ob.put("name", dto.getName());
	ob.put("signup_date", sdf.format(dto.getSignup_date()));
	ob.put("last_login_date", sdf.format(login_date));
	
%>
<%=ob.toString()%> --%>