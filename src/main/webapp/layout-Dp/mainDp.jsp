<%@page import="java.text.SimpleDateFormat"%>
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
<%
	//절대경로보기
	String root=request.getContextPath();
	String loginok=(String)session.getAttribute("loginok");
	String id=(String)session.getAttribute("id");
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

%> 
<style type="text/css">
	.ex-login{
		position: absolute;
		top: 300px;
		left: 200px;
		background-color: white;
	}

</style>
<script type="text/javascript">
	$(function(){
		var id=$(".ex-login").find("#loginId").val();
		var login
			//alert(id);
			var s="데이터보기<br>";
			/* $.ajax({
				type:"get",
				dataType:"json",
				url:"login/loginAction.jsp",
				data:{"id":id},
				success:function(data){
					var grade="";
					if(data.grade=="user"){
						grade="이용객";
					}
					if(data.grade=="express"){
						grade="휴게소관리자"
					}
					if(data.grade=="shop"){
						grade="입점주";
					}
					//alert("이름은: "+data.name);
					s+="<div><span id='idx' value='"+data.id+"'> id : "+data.id+"</span><br>";
					s+="<span>등급: "+grade+"</span><br><br>";
					if(grade=="이용객"){
						s+="<span><button type='button' class='btn btn-outline-info enterShopMenu'>음식점페이지로</button>"
					}
					else if(grade=="입점주"){
						s+="<span><button type='button' class='btn btn-outline-info menuAdd'>음식등록</button>"
						s+="<span><button type='button' class='btn btn-outline-info enterShopMenu'>음식점페이지로</button>"
					}
					/* s+="<span id='gaip' value='"+data.u_rdate+"'>가입일: "+data.u_rdate+"</span>"+"<br>";
					s+="<span id='login' value='"+data.last_date+"'>최근로그인: "+data.last_date+"</span>"+"<br>";
					s+="<span id='login' value='"+data.ll_date+"'>변경(현재시간)로그인: "+data.ll_date+"</span>"+"<br>";
					s+="<span>현재시간과 최근 로그인 시간 차이: "+data.dif+"분 차이</span><br>"
					s+="<span><button id='order-menu' class='btn btn-success' onclick='window.open(\"index.jsp?main=main/orderpage.jsp\",\"PopupWin\",\"width=700px,height=800px,scrollbars=yes\")'>주문하기</button></span>" */
					s+="</div>";
					
					
					$(".my-info").html(s);
					
				}	
			})
		})
	})
	
	$(document).on("click",".menuAdd",function(){
		
		location.href="dpecoland.jsp?main=order/orderAddForm.jsp";
				
		
	})
	
	$(document).on("click",".enterShopMenu",function(){
		
		location.href="dpecoland.jsp?main=shop/shopList.jsp";
				
	})
	
</script>
</head>
<body>
<img alt="" src="<%=root%>/image/visual_01.jpg" style="width: 1520px;">
<div class="ex-login">
	<div class="my-info"></div>
</div>
<div>
</div>
</body>
</html>