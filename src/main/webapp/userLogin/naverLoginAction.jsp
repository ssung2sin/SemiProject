<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Date"%>
<%@page import="data.dto.UserDto"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="data.dao.UserDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId=request.getParameter("u_id");
	System.out.println(userId);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.0");
	
	LocalDateTime now=LocalDateTime.now();
	String sdfNow=now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.0"));		//현재 시간

	UserDao dao=new UserDao();
	UserDto dto=dao.getData(userId);
	
	String lastLogin=sdf.format(dto.getLl_date());		//lastlogin 시간
	
	Date today=sdf.parse(sdfNow);				//string을 date로 변환
	Date logindate=sdf.parse(lastLogin);
	
	int dif = (int)((today.getTime()-logindate.getTime())/(60*1000));			//date를 int로 변환해서 현재와 마지막로그인 차이 계산
	System.out.println("날짜차이 : "+dif);
	JSONObject ob=new JSONObject();
	if(dif>=1){
		ob.put("userId", userId);
	}else{
		ob.put("userId", userId);
		ob.put("loginok","yes");
	}
%>
<%=ob.toString()%>