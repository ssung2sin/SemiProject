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
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
%>

	<jsp:useBean id="dao" class="data.dao.BoardDao"/>
	<jsp:useBean id="dto" class="data.dto.BoardDto"/>
	
	<jsp:setProperty property="*" name="dto"/>
	
<%
	int note=dto.getNote();
	String b_id=(String)session.getAttribute("inherence_HU");
	if(dto.getWriter().equals(b_id))
	{
		
		note=1;
		dao.insertAdminBoard(dto,note);
	}
	else
	{
		dao.insertUserBoard(dto);
	}

	response.sendRedirect(root+"/subPage.jsp?main=board/freeBoard.jsp?note="+note);
%>
</body>
</html>