<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="data.dao.UserDao"%>
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
	String userId=request.getParameter("userId");
	String uSave=request.getParameter("uSave");
	System.out.println("usave="+uSave);
	
	UserDao dao=new UserDao();
	
		session.setMaxInactiveInterval(60*60*2);  //로그인 지속시간 2시간 설정
		session.setAttribute("loginok", "yes");  //로그인 된 상태인지 다른 페이지에서 볼 수 있도록
		session.setAttribute("id", userId); //로그인 후, 누가 로그인 했는지 표시
		session.setAttribute("saveok", uSave==null?null:"uyes"); //로그인 시, 아이디 저장 체크박스 표시하면 로그인폼에 아이디값 고정
		session.setAttribute("grade","user");	
		request.setCharacterEncoding("utf-8");
		LocalDateTime now=LocalDateTime.now();
		String sdfNow=now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.0"));
		
		dao.updateLL_date(userId, sdfNow);
		response.sendRedirect("../index.jsp");
%>

</body>
</html>