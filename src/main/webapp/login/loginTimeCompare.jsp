<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.UserDto"%>
<%@page import="java.util.Date"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	session.setAttribute("idok", id);
	session.setAttribute("loginok", "yes");

	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
			
	UserDao dao=new UserDao();
	
	UserDto dto=dao.getData(id);
	
	String login=sdf.format(dto.getLl_date());
	
	LocalDateTime now=LocalDateTime.now();
	
	
	
	String sdfNow=now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	
	String updateTime=now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.0"));
	
	Date today=sdf.parse(sdfNow);
	Date logindate=sdf.parse(login);
	
	int dif = (int)((today.getTime()-logindate.getTime())/(60*1000));
	
	
	
	dao.updateLL_date(id, updateTime);
	
	UserDto dto2=dao.getData(id);
	
	
	JSONObject ob=new JSONObject();
	ob.put("num", dto.getNum());
	ob.put("u_id", dto.getU_id());
	ob.put("u_pass", dto.getU_pass());
	ob.put("u_name", dto.getU_name());
	ob.put("u_hp", dto.getU_hp());
	ob.put("u_birth", dto.getU_birth());
	ob.put("u_email", dto.getU_email());
	ob.put("u_rdate", sdf.format(dto.getU_rdate()));
	ob.put("ll_date",sdf.format(dto2.getLl_date()));
	ob.put("dif",dif);
	ob.put("last_date",login);
%>
<%=ob.toString()%>