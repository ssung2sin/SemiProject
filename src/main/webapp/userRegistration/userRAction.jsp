<%@page import="data.dao.UserDao"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="data.dto.UserDto"%>
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
	String root=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	LocalDateTime now=LocalDateTime.now();
	/* SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm"); */
	String sdfNow=now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.0"));

	//데이터 읽어서 dto 넣기
	UserDto dto=new UserDto();
	
	String userId=request.getParameter("userId");
	String userPass=request.getParameter("userpass2");
	String userName=request.getParameter("username");
	String userHp=request.getParameter("userhp1")+"-"+request.getParameter("userhp2")+"-"+request.getParameter("userhp3");
	String userBirth=request.getParameter("userbirth");
	String userEmail=request.getParameter("useremail1")+"@"+request.getParameter("useremail2");
	
	
	dto.setU_id(userId);
	dto.setU_pass(userPass);
	dto.setU_name(userName);
	dto.setU_hp(userHp);
	dto.setU_birth(userBirth);
	dto.setU_email(userEmail);

	
	//dao 선언 이후 insert 호출
	UserDao dao=new UserDao();
	dao.insertUser(dto, sdfNow);
	
	//회원가입하면, 로그인 페이지로 이동
	response.sendRedirect(root+"/index.jsp?main=userLogin/userLoginForm.jsp");

%>
</body>
</html>