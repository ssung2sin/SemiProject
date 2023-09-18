<%@page import="java.util.List"%>
<%@page import="data.dto.ExpressDto"%>
<%@page import="data.dao.ExpressDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/style-header-106-33-15937.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Nav Bar</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

span * {
    font-family: 'OAGothic-ExtraBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/OAGothic-ExtraBold.woff2') format('woff2');
    font-style: normal;
}

	.dv1{
	width: 100%;
}
#ttop {
   margin-top: -18px;
   height: 10vh;
   width: 100%;
   
}

.topmenu {
   text-decoration: none;
   color: #696969;
   display: block;
   font-size: 20px;
   font-family: 'Jeju Gothic', sans-serif;
   margin-top: 30px;
}

.submenu a{
   text-decoration: none;
   color: #696969;
   display: block;
   font-size: 20px;
   font-family: 'Jeju Gothic', sans-serif;
   margin-top: 30px;
}

.submenu a:hover{
   background-color: gray;
   color: white;
}
   
#ttop ul li {
   list-style: none;
   float: left;
   line-height: 30px;
   vertical-align: middle;
   text-align: center;
}

.submenu{
   height: 0;
   overflow: hidden;
}

#ttop:hover .submenu {
  height: 500px;
  transition-duration: 1s;
  }


</style>
<%
//절대경로보기
String root = request.getContextPath();

String inherence_HU=request.getParameter("id");
String grade=(String)session.getAttribute("grade");
if(grade==null){
	grade="";
}

if(inherence_HU==null){
	inherence_HU=(String)session.getAttribute("inherence_HU");
}
System.out.println("aaaaaaa"+(String)session.getAttribute("inherence_HU"));

ExpressDao dao=new ExpressDao();
ExpressDto dto=new ExpressDto();

List<ExpressDto> list=dao.getId(inherence_HU);
System.out.println(inherence_HU);



String myimg=null;
String mytitle=null;
for (int i = 0; i < list.size(); i++) {
	dto = list.get(i);
	myimg = dto.getImage();
	mytitle = dto.getB_name();
}
%>
<script type="text/javascript">
$(function(){
	var b_id=$("#b_id").val();
	
	$.ajax({
	      type:"get",
	      url: "layout-subPage/sessionGet.jsp",
	      dataType:"html",
	      data: {"b_id":b_id},
	      success: function(data){
	         //alert("보내짐");
	      }
	   })
	//alert(s_id);
	
	  $("#ttop").mouseout(function(){
	         $(".dv1").css("height","0px").css("background-color","white").css("transition","all 0.5s ease-in-out");
	      });
	      
	$("#ttop").mouseover(function(){
        $(".dv1").css("height","400px").css("background-color","#F5F5F5").css("transition","all 0.5s ease-in-out");
     });
});

</script>
</head>
<body>
	<input type="hidden" id="b_id" value="<%=inherence_HU%>">
<div class="dv1" style="position: fixed; z-index:999; height: 0px;">
   <nav id="ttop" style="">
   <ul class="t1">
      <%-- <li><img src="image/logo.png" style="margin-left: 40px; 
      cursor: pointer;" onclick="location.href='<%=root%>/subPage.jsp'"></li> --%>
      
      
      <li><!-- title 각휴게소 -->
      	<b3 style="margin-left: 40px; cursor: pointer;" onclick="location.href='<%=root%>/subPage.jsp'"><%=mytitle %></b3>
      </li>
      
      <li><!-- menu 시설안내 -->
      	 <a href="#" class="topmenu" style="width: 150px; margin-left: 5px;">시설안내</a>
         <ul class="submenu" style="margin-left: 40px;">
         <a href="#" style="font-size: 15px;">편의시설</a>
         </ul>
      </li>
      
      <li><!-- menu 음식점-->
         <a href="#" class="topmenu" style="width: 150px; margin-left: 20px;">음식점</a>
         <ul class="submenu" style="margin-left: -20px;">
         <a href="<%=root%>/subPage.jsp?main=shop/shopList.jsp" style="font-size: 15px;" class="submenu">음식점</a>
         <%if(grade.equals("shop")){
        	 %>
         <a href="<%=root%>/subPage.jsp?main=shop/shopList.jsp?main=order/orderAddForm.jsp" style="font-size: 15px;">음식추가</a>
         <%
         }
         %>
         </ul>
      </li>
      
      <li><!-- menu 이벤트 -->
         <a href="#" class="topmenu" style="width: 150px; margin-left: 5px;">이벤트</a>
         <ul class="submenu" style="margin-left: -20px;">
         <a href="" style="font-size: 15px;">진행중 이벤트</a>
         <a href="" style="font-size: 15px;">종료 이벤트</a>
         </ul>
      </li>
      
      <li><!-- menu 자유게시판-->
      <a href="#" class="topmenu" style="width: 150px; margin-left: 5px;">게시판</a>
         <ul class="submenu" style="margin-left: -20px;">
         <a href="" style="font-size: 15px;">공지게시판</a>
         <a href="" style="font-size: 15px;">자유게시판</a>
         </ul>
      </li> 
     
   </ul>
    
   </nav>
</div>
	
</body>
</html>