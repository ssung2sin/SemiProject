<%@page import="data.dao.AdDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Audiowide&family=Hi+Melody&family=Itim&family=Nanum+Pen+Script&family=Rock+Salt&family=Wallpoet&display=swap" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ddc717c4e4cd5fed053858415435334"></script>
<title>Insert title here</title>
</head>
<body>
<%

	//절대경로잡기
	String root=request.getContextPath();

	request.setCharacterEncoding("utf-8");

	String AdId=request.getParameter("AdId");
	String AdPass=request.getParameter("AdPass");
	
	
	
	AdDao dao=new AdDao();
	
	
	boolean b=dao.ADisIdPass(AdId, AdPass);
	if(b){
		//로그인메인으로 이동
		response.sendRedirect(root+"/adPage.jsp");
	}else{%>
		<script type="text/javascript">
			alert("아이디와 비밀번호가 일치하지 않습니다");
			history.back();
		</script>
		<%
	}
	 
%>

</body>
</html>