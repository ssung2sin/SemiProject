<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%><%@page import="data.dao.ShopDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dokdo&family=Nanum+Brush+Script&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	String root=request.getContextPath();
	request.setCharacterEncoding("utf-8");

	String realPath=getServletContext().getRealPath("/save");
	System.out.println(realPath);
	
	int uploadSize=1024*1024*100;
	
	MultipartRequest multi=null;
	
	try{
		multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
	
		String b_id=multi.getParameter("b_id");
		
		
		if(b_id.equals("덕평자연휴게소"))
		{
			b_id="106-33-15937";
		}
		
		String s_id=multi.getParameter("s_id1")+"-"+multi.getParameter("s_id2")+"-"+multi.getParameter("s_id3");
		String s_pass=multi.getParameter("s_pass");
		String s_name=multi.getParameter("s_name");
		String shop_name=multi.getParameter("shop_name1")+" "+multi.getParameter("shop_name2");
		String shop_addr=multi.getParameter("shop_addr");
		String shop_hp=multi.getParameter("shop_hp1")+"-"+multi.getParameter("shop_hp2")+"-"+multi.getParameter("shop_hp3");
		String s_phone=multi.getParameter("s_phone1")+"-"+multi.getParameter("s_phone2")+"-"+multi.getParameter("s_phone3");
		String s_image=multi.getFilesystemName("s_image");
		

		ShopDto dto=new ShopDto();
		dto.setB_id(b_id);
		dto.setS_id(s_id);
		dto.setS_pass(s_pass);
		dto.setS_name(s_name);
		dto.setShop_name(shop_name);
		dto.setShop_addr(shop_addr);
		dto.setShop_hp(shop_hp);
		dto.setS_phone(s_phone);
		dto.setS_image(s_image);
		
		ShopDao dao=new ShopDao();
		dao.insertShop(dto);
		
		response.sendRedirect(root+"/index.jsp");
	}catch(Exception e){
		
	}
%>
</body>
</html>