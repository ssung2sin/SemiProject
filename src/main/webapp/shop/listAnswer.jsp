<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MenuDto"%>
<%@page import="data.dao.MenuDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.dto.MenuAnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MenuAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sang_num=request.getParameter("sang_num");
	MenuAnswerDao dao=new MenuAnswerDao();
	
	List<MenuAnswerDto>list=dao.getAllAnswers(sang_num);
	
	String star="";
	MenuDao mdao=new MenuDao();
	MenuDto mdto=mdao.getData(sang_num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	System.out.println(mdto.getM_score());
	JSONArray arr=new JSONArray();
	
	NumberFormat nf=new DecimalFormat("0.##");
	
	String starScore=nf.format(mdto.getM_score());
	
	for(MenuAnswerDto dto:list){
		if(dto.getU_star_score()==5){
			star="★★★★★";
		}else if(dto.getU_star_score()==4){
			star="★★★★";
		}else if(dto.getU_star_score()==3){
			star="★★★";
		}else if(dto.getU_star_score()==2){
			star="★★";
		}else if(dto.getU_star_score()==1){
			star="★";
		}
		JSONObject ob=new JSONObject();
		ob.put("idx",dto.getIdx());
		ob.put("sang_num",dto.getSang_num());
		ob.put("starScore",star);
		ob.put("content",dto.getContent());
		ob.put("u_id",dto.getU_id());
		ob.put("writeday", sdf.format(dto.getWriteday()));
		ob.put("menuScore",starScore);
		
		arr.add(ob);
	}
%>
<%=arr.toString()%>