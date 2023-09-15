<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.MenuDto"%>
<%@page import="data.dao.MenuDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
div.mt-3 {
	margin-left: -5px;
	margin-top: -110px;
	width: 450px;
}

div.menudiv {
	cursor: pointer;
}

div.new_menudiv {
	cursor: pointer;
}

#category {
	width: 700px;
	border: 1px solid lightgray;
	border-color: lightgray;
	margin-left: 90px;
	margin-top: 20px;
	padding-top: 15px;
	padding-bottom: 15px;
}

.orderBtn {
	font-size: 30px;
	font-family: 'Dongle';
	margin-left: 450px;
	border: 1px solid white;
	width: 150px;
	height: 50px;
	background-color: orange;
	color: white;
}

.orderBtn:active {
	background-color: white;
	color: orange;
}

.orderBox {
	margin-top:50px;
	margin-left:50px;
	width: 350px;
	height: 600px;
	border: 3px solid black;
	border-radius: 30px 30px 30px 30px;
	padding: 30px 30px;
	font-family: 'Dongle';
}
div.allBox{
	display: flex;
}
.cart-table{
	width: 300px;
	font-size:20px;
}
.order-footer{
	position: absolute;
	top: 630px;
	width:300px;
	font-size: 25px;
}
.su{
	width: 30px;
	height: 30px;

}
</style>
<%
	
	String s_id = request.getParameter("s_id");
	String id = (String) session.getAttribute("id");

	MenuDao mdao = new MenuDao();

	List<MenuDto> list = mdao.selectMenu(s_id);

	List<String> categorylist = mdao.getCategory(s_id);

	UserDao udao = new UserDao();
	udao.getData(id);

	UserDto udto = new UserDto();
	udto = udao.getData(id);
	
	NumberFormat nf=NumberFormat.getCurrencyInstance();
%>
<script type="text/javascript">
	$(function(){
		var i=1;
		$(".menudiv").click(function(){
			var sang_num=$(this).attr("sang_num");
			var price=$(this).children().eq(0).val();
			var name=$(this).children().eq(3).text();
			i=$("#idx").val();
			//alert("i="+i);
			for(var j=1;j<i;j++){
				var compSang=$(".td"+j+"first").attr("sang_num");
				//alert(compSang);
				//alert(sang_num);
				if(sang_num==compSang){
					//alert("둘이같다");
					var plus=".plus"+j;
					$(".plusNum").val(plus);
					plusBtn();
					return;
					}
				}
			//alert(name);
				s="";
				s+="<tr><td class='td"+i+" td"+i+"first' id='td+"+i"' sang_num='"+sang_num+"'>"+name+"</td>";
				s+="<td class='td"+i+"'><button type='button' class='minus minus"+i+"'>-</button> <span class='su' name='su"+i+"'>1</span> "; 
				s+="<button type='button' class='plus plus"+i+"'>+</button></td>";
				s+="<td class='td"+i+" price price"+i+"' value='"+price+"'>"+price+"</td>";
				s+="<td class='td"+i+" del'><button class='btn btn-danger sm del' td='td"+i+"'>x</button>";
				s+="</tr>"
			
				$(".cart-table").append(s);
				i++;
				$("#idx").val(i);
				totPrice();
		})
		
		$(document).on("click",".plus",function(){
			var su=$(this).parent().find(".su").text();
			su++;
			$(this).parent().find(".su").text(su);
			
			var price=$(this).parent().parent().find(".price").attr("value");
			//alert("price="+price);
			var modPrice=price*su;
			//alert("modPrice="+modPrice);
			$(this).parent().parent().find(".price").text(modPrice);
			
			totPrice();
		})
		
		$(document).on("click",".minus",function(){
			var su=$(this).parent().find(".su").text();
			if(su==1){
				return;
			}
			else{
				su--;
				$(this).parent().find(".su").text(su);
			
				var price=$(this).parent().parent().find(".price").attr("value");
				//alert("price="+price);
				var modPrice=price*su;
				//alert("modPrice="+modPrice);
				$(this).parent().parent().find(".price").text(modPrice);
			}
			totPrice();
		})
		
		$(document).on("click",".del",function(){
			var td=$(this).attr("td");
			var idx=$("#idx").val();
			if(idx==0){
				idx=1;
			}
			$("#idx").val(idx);
			$("."+td).remove();
			totPrice();
		})
		
		//버튼 클릭하면 db추가
		$("#addCartBtn").click(function(){
			var idx=("#idx").val();
			for(var i=0;i<idx;i++){
				if($(".price"+i).text()==0){
					continue;
				}
			}
		})
	})
	function plusBtn(){
		var plusNum=$(".plusNum").val();
		//alert(plusNum);
		$(plusNum).click();
	}
	
	function totPrice(){
		var idx=$("#idx").val();
		var cnt=1;
		//alert(idx);
		var totPrice=0;
		var j=1;
		for(j=1;j<idx;j++){
			if($(".price"+j).text()==0){
				cnt++;
				continue;
			}
			var price=parseInt($(".price"+j).text());
			totPrice+=price;
			//alert(totPrice);
			$("#total-price").text(totPrice);
		}
		if(cnt==j){
			$("#total-price").text(0);
		}
	}
	
</script>
</head>
<body>
<h5><%=udto.getU_name()%>님 반갑습니다!</h5>
	<input type="hidden" id="idx" value="1">
	<input type="hidden" class="plusNum" value="">
	<div class="allBox">
		<div class="mt-3">
			<img src="../shopimg/shop1.png"
				style="width: 120px; height: 120px; margin-left: 20px;"> <br>
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li class="nav-item"><a class="nav-link active"
					data-bs-toggle="tab" href="#menu1">All</a></li>
				<%
				for (int i = 0; i < categorylist.size(); i++) {
				%>
				<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
					href="#menu<%=(i + 2)%>"><%=categorylist.get(i)%></a></li>
				<%
				}
				%>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div id="menu1" class="container tab-pane active">
					<br>
					<table style="width: 400px;">
						<tr>
							<%
							for (int i = 0; i < list.size(); i++) {
								MenuDto dto = list.get(i);
							%>
							<td>
								<div align="center" class="menudiv"
									sang_num="<%=dto.getSang_num()%>">
									<input type="hidden" name="price" value="<%=dto.getPrice()%>">
									<img src="../save/<%=dto.getM_image()%>"
										style="width: 100px; height: 100px;"><br> <b style="font-size: 15px;"><%=dto.getMenu()%></b>
										<br><b>★<%=dto.getM_score()%></b>
								</div>
							</td>
							<%
							if (i % 3 == 2) {
							%>
						</tr>
						<tr>
							<%
							}
							}
							%>
						</tr>
					</table>
				</div>
				<%
				for (int i = 0; i < categorylist.size(); i++) {
					List<MenuDto> sepList = mdao.seperateCategory(categorylist.get(i));
				%>
				<div id="menu<%=(i + 2)%>" class="container tab-pane fade">
					<br>
					<table style="width: 400px;">
						<tr>
							<%
							for (int j = 0; j < sepList.size(); j++) {
								MenuDto dto = sepList.get(j);
							%>
							<td>
								<div align="center" class="menudiv"
									sang_num="<%=dto.getSang_num()%>">
									<img src="../save/<%=dto.getM_image()%>"
										style="width: 100px; height: 100px;"><br> <b style="font-size: 15px;"><%=dto.getMenu()%></b>
										<br><b>★<%=dto.getM_score()%></b>
								</div>
							</td>
							<%
							if (j % 3 == 2) {
							%>
						</tr>
						<tr>
							<%
							}
							}
							%>
						</tr>
					</table>
				</div>
				<%
				}
				%>
			</div>
		</div>
		<div class="orderBox">
			<h2 class="order-h2">장바구니</h2>
			<hr style="border: 3px solid gray">
			<form action="#" method="post">
				<table class="cart-table">
				
				</table>
				<table class="order-footer">
					<tr>
						<td>
						총금액 : <span id="total-price">0</span>
						</td>
						<td colspan='2' style="float: right">
							<button type="button">전체삭제</button>
							<button type="button" id="addCartBtn">주문하기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>