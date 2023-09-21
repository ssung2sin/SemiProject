<%@page import="data.dao.MenuDao"%>
<%@page import="data.dto.MenuDto"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	//업로드 경로
	String uploadPath=getServletContext().getRealPath("/save");
	System.out.println(uploadPath);
	
	//업로드 이미지 사이즈
	int uploadSize=1024*1024*5;
	
	MultipartRequest multi=null;
	
	try{
		multi=new MultipartRequest(request,uploadPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
		
		String s_id=multi.getParameter("s_id");
		String menu=multi.getParameter("menu");
		String category=multi.getParameter("category");
		String eng_category=multi.getParameter("eng_category");
		String[] categorySplit = category.split(",");
		String content=multi.getParameter("content");
		int price=Integer.parseInt(multi.getParameter("price"));
		String m_image=multi.getFilesystemName("m_image");
		
		
		MenuDto dto=new MenuDto();
		
		dto.setCategory(category);
		dto.setEng_category(eng_category);
		dto.setM_image(m_image);
		dto.setMenu(menu);
		dto.setPrice(price);
		dto.setS_id(s_id);
		dto.setContent(content);
		
		MenuDao dao=new MenuDao();
		
		dao.insertMenu(dto);
		
		response.sendRedirect("../subPage.jsp?main=order/orderAddForm.jsp");
	}catch(Exception e){
		System.out.println("업로드 오류: "+e.getMessage());
	}
%>
</body>
</html>