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
   top:8%;
   font-size: 1.2rem;
   cursor: pointer;
}
.container h1{
   font-family:Wallpoet;
   font-size: 6em;
   color:gold;
   position: absolute;
   top:4%;
   bottom:4%;
   left:3%;
}
</style>
<%
String root=request.getContextPath();
%>
<script type="text/javascript">
$(function(){
    
    
    
    $("#register").click(function(){
       
       
        location.href='index.jsp?main=businessRegistration/regiForm.jsp';
        
    });
    
    $("#login").click(function(){
        
   
        location.href='index.jsp?main=userLogin/userLoginForm.jsp';
   });
    

 });



</script>

</head>
<body>
   <section class="container">
      <h5><span id="login">로그인</span>
      <span id="register">회원가입</span><span id="mypage">마이페이지</span><span id="admin">관리자</span></h5>   
      <h1>HG</h1>
   </section>
</body>
</html>