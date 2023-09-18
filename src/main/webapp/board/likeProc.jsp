<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//num읽기
	String num=request.getParameter("num");
	//dao
	BoardDao dao=new BoardDao();
	//num에 해당하는 chu증가
	dao.updatelike(num);
	
	//증가된 chu값을 json형식으로 변환 -> 증가가되는 값들을 넘겨주기 위해서
	int likes=dao.getData(num).getLikes(); //num값에 대한 데이터에서 chu값을 가져옴
	
	JSONObject ob=new JSONObject();
	ob.put("likes",likes); //chu값을 증가시킬 num값을 url에 이어서 적어주면 1증 
%>

<%=ob.toString()%>