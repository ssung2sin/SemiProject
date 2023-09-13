<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Audiowide&family=Hi+Melody&family=Itim&family=Nanum+Pen+Script&family=Rock+Salt&family=Wallpoet&display=swap" rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
.container h5{
   color:white;
   position:absolute;
   right:3%;
   top:40%;
   font-size: 2vh;
   cursor: pointer;
}
.container h1{
   font-family:Wallpoet;
   font-size: 10vh;
   color:gold;
   position: absolute;
   top:4%;
   bottom:4%;
   left:3%;
   cursor: pointer;
}
</style>
<%
//절대경로잡기
String root=request.getContextPath();

//로그인세션_로그인/로그아웃 표현 위함,개인/사업자 db 접근 위함,아이디얻기
String loginok=(String)session.getAttribute("loginok"); //로그인,로그아웃
System.out.println(loginok);
String grade=(String)session.getAttribute("grade"); //개인,사업자
System.out.println(grade);
String id=(String)session.getAttribute("id"); //아이디
System.out.println(id);

//db에 이름 반환해주는 메소드 사용하기
UserDao udao=new UserDao();

//사용할 변수 선언하기
String name="";
String selectId="";

//첫 페이지 들어가면 로그인하지 않은 상태라 초기값 선언이 필요함
if(grade==null){
	grade="";
}

String allId=(String)session.getAttribute("id");
if(grade.equals("shop"))
{
	selectId="s_id";
	name="s_name";
} else if(grade.equals("express")){
	
	selectId="b_id";
	name="b_name";
} else if(grade.equals("user")){
	
	selectId="u_id";
	name="u_name";
}

String titleName =udao.allSelect(grade, id, name, selectId);



%>
<script type="text/javascript">
$(function(){
    
    
    
    $("#register").click(function(){
       
       
        location.href='index.jsp?main=businessRegistration/regiForm.jsp';
        
    });
    
    $("#login").click(function(){
        
   
        location.href='index.jsp?main=userLogin/userLoginForm.jsp';
   });
    $("#titlepage").click(function(){
    	location.href='index.jsp';
    });

 });



</script>

</head>
<body>
   <section class="container">
	
	<h5>
   	<%
      if(loginok==null){%>
         <span id="login">로그인</span>
      <%
      } else {%>
         <span id="titleName"><i class="bi bi-person-circle" style="font-size:1.3em;"></i>&nbsp;
         <%=titleName %>님 환영합니다&nbsp;&nbsp;
         <input type="button" value="로그아웃" class="btn btn-danger" onclick="location.href='<%=root%>/userLogin/logoutAction.jsp'"></span>
      <%}%>


      <span id="register">회원가입</span><span id="mypage">마이페이지</span><span id="admin">관리자</span>
      </h5>   
      
      <h1 id="titlepage">HG</h1>
   </section>
</body>
</html>