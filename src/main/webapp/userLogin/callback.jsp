<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.UserDto"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Dongle:wght@300;400;700&family=Gaegu:wght@300&family=Noto+Serif+KR:wght@200&family=Single+Day&display=swap"
   rel="stylesheet">
<script type="text/javascript"
   src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
   charset="utf-8"></script>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<title>Insert title here</title>
</head>
<%
//절대경로잡기
String root = request.getContextPath();
%>
<body>
<!-- 네이버아디디로로그인 Callback페이지 처리 Script -->
<script type="text/javascript">
  var naver_id_login = new naver_id_login("mxqUPyw1CadFAnqmOC_4", "http://localhost:8080/SemiProject/userLogin/callback.jsp");
  // 접근 토큰 값 출력
  // alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {

    /* alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('name'));
    alert(naver_id_login.getProfileData('birthday')); */
    
    var N_token= naver_id_login.oauthParams.access_token;
   	var N_email=naver_id_login.getProfileData('email');
   	var N_name=naver_id_login.getProfileData('name');
	
	//$("#token").val(N_token);
	//$("#name").val(N_name);
	//$("#email").val(N_email);
	
	
	//회원가입이나 로그인 하면 창을 닫고 부모창에서 인덱스로 이동
	window.opener.location.href = "../index.jsp";
	window.close();
	
  }
 
  /* function name(){
	  var N_name=naver_id_login.getProfileData('name');
  } */
  
</script>
<!-- //네이버아디디로로그인 Callback페이지 처리 Script -->

<!-- <input type="hidden" name="token" id="token" value="">  -->
<%-- <input type="hidden" name="name" id="name" value=""> 
<input type="hidden" name="email" id="email" value="">
<%response.sendRedirect("callbackAction.jsp"); %> --%>
  </body>
</html>