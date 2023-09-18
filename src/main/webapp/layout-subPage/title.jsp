<%@page import="data.dto.MenuOrderDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MenuDao"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<title>Insert title here</title>
<style type="text/css">
.container h5{
	position:absolute;
   color:white;
   font-size: 1.2rem;
   cursor: pointer;
   right:8%;
   top:50%;
   transform: translate(-50%, -50%);
}
.container h1{
	
   font-family:Wallpoet;
   font-size: 5em;
   color:gold;
   cursor: pointer;
  position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);  
}
.notification-panel {
        position: absolute;
        right:8%;
   		top:110px;
        background-color: #ffffff;
        border: 1px solid #ccc;
        padding: 10px;
        width: 350px;
        display: none; /* Hide initially */
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

MenuDao mdao=new MenuDao();

//사용할 변수 선언하기
String name="";
String selectId="";
String titleName="";

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

if(loginok!=null){
	System.out.println("hi");
	titleName=udao.allSelect(grade, id, name, selectId);
}


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
    $(".order-alert").click(function () {
        // Toggle the visibility of the notification panel
        $(".notification-panel").toggle();
    });
    

 });



</script>

</head>
<body>
   <section class="container">
   	<%
      if(loginok==null){%>
         <h5><span id="login">로그인</span></h5>
      <%
      }else{%>
      	<h5><% if((grade.equals("shop")||grade.equals("user"))&&loginok!=null){%>
			<i class="bi bi-bell-fill order-alert" style="width: 50px; height: 50px;"></i>
      		<%
   			}
      	%></h5>
         <h5><span id="titleName"><i class="bi bi-person-circle" style="font-size:1.3em;"></i>&nbsp;
         <%=titleName %>님 환영합니다&nbsp;&nbsp;
         <input type="button" value="로그아웃" class="btn btn-danger" onclick="location.href='<%=root%>/userLogin/logoutAction.jsp'"></span></h5>
      <%}%>
      <h1 id="titlepage">HG</h1>
   </section>
   <%-- <div class="notification-panel">
    	<table>
    	<%
    	List<MenuOrderDto> list=mdao.selectMyOrder(id,selectId);
    	System.out.println(list.size());
    	for(int i=0;i<list.size();i++){
    		MenuOrderDto dto=list.get(i);
    	%>
       		<tr>
    			<td>
    				주문번호 : <%=dto.getNum() %> <span><%=dto.getPrepare_time()==null?"접수 준비중":"메뉴 준비중"%></span>
    			</td>
    		</tr>
    	<%}
    	%>
    	</table>
	</div> --%>
</body>
</html>