<%@page import="data.dao.ExpressDao"%>
<%@page import="data.dto.ExpressDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String root=request.getContextPath();
	request.setCharacterEncoding("utf-8");

	String realPath=getServletContext().getRealPath("/save");
	System.out.println(realPath);
	
	int uploadSize=1024*1024*100;
	
	MultipartRequest multi=null;
	
	try{
		multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
	
		String b_id=multi.getParameter("b_id1")+"-"+multi.getParameter("b_id2")+"-"+multi.getParameter("b_id3");
		String b_pass=multi.getParameter("b_pass");
		String b_name=multi.getParameter("b_name");
		String addr=multi.getParameter("addr");
		String s_hp=multi.getParameter("s_hp1")+"-"+multi.getParameter("s_hp2")+"-"+multi.getParameter("s_hp3");
		String b_hp=multi.getParameter("b_hp1")+"-"+multi.getParameter("b_hp2")+"-"+multi.getParameter("b_hp3");
		String image=multi.getFilesystemName("image");
		System.out.println(addr);
		ExpressDto dto=new ExpressDto();
		dto.setB_id(b_id);
		dto.setB_pass(b_pass);
		dto.setB_name(b_name);
		dto.setAddr(addr);
		dto.setS_hp(s_hp);
		dto.setB_hp(b_hp);
		dto.setImage(image);
		
		ExpressDao dao=new ExpressDao();
		dao.insertExpress(dto);
		
		response.sendRedirect(root+"/index.jsp");
	}catch(Exception e){
		System.out.println("오류:"+e.getMessage());
	}
%>