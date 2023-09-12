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


#ttop {
   margin-top: -18px;
   height: 80px;
   width: 1690px;
   background-color: white;
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
String b_id=request.getParameter("id");
if(b_id==null){
	b_id=(String)session.getAttribute("b_id");
}
%>
<script type="text/javascript">
$(function(){
	var b_id=$("#b_id").val();
	//alert(s_id);
	$.ajax({
		type:"get",
		url: "layout-106-33-15937/sessionGet.jsp",
		dataType:"html",
		data: {"b_id":b_id},
		success: function(data){
			//alert("보내짐");
		}
	})
	
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
	<input type="hidden" id="b_id" value="<%=b_id%>">
<div class="dv1" style="position: fixed; z-index:999; height: 0px;">
   <nav id="ttop" style="">
   <ul class="t1">
      <li><img src="image/logo.png" style="margin-left: 40px; 
      cursor: pointer;" onclick="location.href='<%=root%>/subPage.jsp'"></li>
      <li><a href="<%=root%>/subPage.jsp?main=shop/shopList.jsp" 
      class="topmenu" style="width: 200px; margin-left: 80px;">음식점</a>
         <ul class="submenu" style="margin-left: 40px;">
         <a href="<%=root%>/index.jsp?main=about/introduce.jsp" style="font-size: 15px;">제주 소개</a>
         </ul>
      </li>
      <li><a href="#" class="topmenu" style="width: 150px; margin-left: 10px;">추천 코스</a>
         <ul class="submenu" style="margin-left: -20px;">
         <a href="index.jsp?main=search/searchIndex.jsp" style="font-size: 15px;">테마</a>
         <a href="" style="font-size: 15px;">지역</a>
         </ul></li>

      <li><a href="#" class="topmenu" style="width: 150px; margin-left: 10px;">리뷰</a>
         <ul class="submenu" style="margin-left: -10px;">
         <a href="" style="font-size: 15px;">코스 리뷰</a>
         <a href="" style="font-size: 15px;">관광지 리뷰</a>
         </ul>
      </li>
      <li><a href="#" class="topmenu" style="width: 150px; margin-left: 5px;">이벤트</a>
         <ul class="submenu" style="margin-left: -20px;">
         <a href="" style="font-size: 15px;">진행중 이벤트</a>
         <a href="" style="font-size: 15px;">종료 이벤트</a>
         </ul>
      </li>
         
     
   </ul>
    <form class="d-flex" action="index.jsp?main=search/searchIndex.jsp" method="post">
        <input class="form-control me-2" type="text"  style="width: 120px; margin-left: 30px; margin-top: 20px;" name="inputWords" placeholder="Search">
        <button class="btn btn-primary" type="submit" style="margin-top: 20px; background-color: #696969; border-color: #696969;">Search</button>
      </form>
   </nav>
</div>
	
</body>
</html>