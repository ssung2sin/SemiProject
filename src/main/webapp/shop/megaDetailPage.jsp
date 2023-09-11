<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.UserDao"%>
<%@page import="data.dto.MenuDto"%>
<%@page import="data.dao.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
.detail{
	margin: 75px 50px;
	width: 720px;
}
.menu-img{
	width: 200px;
	height:250px;
	border: 1px solid
}
.explain{
	padding: 30px 30px 30px 30px;
}
select::-ms-expand { 
	display: none;
}
.select{
  -o-appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}
.backword{
	top:50px;
	left:50px;
	position: absolute;
	top:25px;
	font-size:2.0em;
	cursor: pointer;

}
</style>
<%
	String sang_num=request.getParameter("sang_num");
	String loginok=(String)session.getAttribute("loginok");
	String id=(String)session.getAttribute("idok");
	String s_id=request.getParameter("s_id");
	System.out.println(s_id);
	NumberFormat formatter=new DecimalFormat("0.##");
%>
<script type="text/javascript">
$(function(){
	
	list();
	
	$("#btnadd").click(function(){
		var content=$(".content").val();
		//alert("["+content.trim()+"]");	
		if(content.trim()==null||content.trim()==""){
			alert("값을 입력하시오");
			return false;
		}
		var u_id=$("#u_id").attr("value");
		var starScore=$(".select").val();
		var sang_num=$("#sang_num").attr("value");
		//alert(u_id);
		//alert(starScore);
		//alert(content);
		$.ajax({
			type:"get",
			dataType:"html",
			url:"insertAnswer.jsp",
			data:{"content":content,"u_id":u_id,"starScore":starScore,"sang_num":sang_num},
			success:function(data){
				$(".content").val("");
				list();
			}
		})
	})
	
	$(".backword").click(function(){
		var s_id=$(".s_id").val();
		location.href="shopMenu.jsp?s_id="+s_id;
	})
	
})

function list(){
	var sang_num=$("#sang_num").attr("value");
	//alert(sang_num);
	
	$.ajax({
		type:"get",
		dataType:"json",
		url:"listAnswer.jsp",
		data:{"sang_num":sang_num},
		success:function(data){
			//댓글 갯수 입력
			$("b.acount>span").text(data.length);
			var login="<%=loginok%>";
			var id="<%=id%>";
			//출력
			var s="";
			$.each(data,function(idx,item){
				if(item.menuScore%1==0){
					item.menuScore+=".0";
				}
				s+="<div class='textAnswer"+item.idx+" textAnswer'></div>"
				s+="<table class='answer"+item.idx+" answer' style='width:600px;'><tr><td>"+item.u_id+" ["+item.starScore+"]</td><td><span style='float:right'>";
				s+="<input type='hidden' class='hiddenStar"+item.idx+"' value='"+item.starScore+"'>"
				if(login!=null&&id==item.u_id){
					s+="<i style='color:green; cursor:pointer;' idx="+item.idx+" class='bi bi-pencil-square amod'></i>&nbsp";
					s+="<i style='color:red; cursor:pointer;' idx="+item.idx+" class='bi bi-trash adel'></i></span></td></tr>";
				}
				s+="<tr><td colspan=2 class='content"+item.idx+"'>"+item.content.replace('\n','<br>')+"</td></tr>";
				s+="<tr><td colsapn=2><span style='color:gray'>"+item.writeday+"</span></td></tr>";
				s+="</table>";
				$(".mScore").text(item.menuScore);
				if(idx<(data.length-1)){
					s+="<hr style='width:600px;'>"
				}
				$(".textAnswer"+item.idx).hide();
			})

			$("div.alist").html(s);
		}
	})
}

</script>
</head>
<body>
<%
	UserDao udao=new UserDao();
	
	int idchk=udao.isUserIdCheck(id);
	String root=request.getContextPath();
	
	MenuDao mdao=new MenuDao();
	MenuDto mdto=mdao.getData(sang_num);
	
	NumberFormat nf = NumberFormat.getCurrencyInstance();
	
	%>
	<i class="bi bi-arrow-left backword"></i>
	<input type="hidden" class="s_id" value="<%=s_id%>">
	<%
	if(sang_num.equals("1")){
		%>
		<table class="detail">
			<tr>
				<th style="width: 220px;">
					<img class="img-thumbnail menu-img" alt="" src="<%=root %>/save/<%=mdto.getM_image()%>">
				</th>
				<td rowspan="2">
				<div class="explain">
					One size / 20oz<br>
					1회 제공량 12.2kcal<br>
					[기본2샷]메가MGC커피 블렌드 원두로 추출한<br>
					에스프레소에 물을 더해,<br>
					풍부한 바디감을 느낄 수 있는 스탠다드 커피.<br>
					알레르기 성분 : x<br>
					고카페인 함유<br><br>
					가격 : <%=nf.format(mdto.getPrice()) %><br>
				</div>
				</td>
			</tr>
			<tr>
			 <th>
			 	<b><%=mdto.getMenu() %>&nbsp;&nbsp;★</b><b class="mScore"><%=mdto.getM_score() %></b>
			 </th>
			</tr>
			<tr><div class="selanswer">
        		<td colspan="2">
        			<br><hr style='width:650px; border:2px solid gray; left:20px;'>
        			<b class="acount" id="alist" style="margin-top: 10px; margin-left:10px;">댓글 <span>0</span></b><br>
        			<input type="hidden" name="sang_num" id="sang_num" value=<%=sang_num %>>
         			<input type="hidden" name="u_id" id="u_id" value="<%=id%>">
         			<%
					if(idchk==1){
					%>
        				<select style="width: 95px; margin-top: 10px; margin-left:10px;" class="select">
        					<option name="starScore" value="1">★
        					<option name="starScore" value="2">★★
        					<option name="starScore" value="3">★★★
        					<option name="starScore" value="4">★★★★
        					<option name="starScore" value="5" selected>★★★★★
        				</select>
        			<div class="aform input-group" style="margin-top: 10px; margin-left:10px;">
        				<textarea name="content" class="content" style="width: 550px;" class="form-control" required="required"
        				placeholder="댓글 입력"></textarea>
        				<button type="button" id="btnadd" class="btn btn-outline-info">저장</button>
        			</div>
        			<%
					}
        			%>
        			<div class="alist" style="margin-top: 10px; margin-left:10px;">
        				댓글목록
        			</div>
        		</td>
        		</div>
        	</tr>
		</table>
		<%
	}

	else if(sang_num.equals("2")){
		%>
		<table class="detail">
			<tr>
				<th style="width: 220px;">
					<img class="img-thumbnail menu-img" alt="" src="<%=root %>/save/<%=mdto.getM_image()%>">
				</th>
				<td rowspan="2">
				<div class="explain">
					One size / 20oz<br>
					1회 제공량 175.4kcal<br>
					진한 에스프레소와 부드러운 우유가 어우러져 고소한 풍미를 완성한 라떼.<br>
					알레르기 성분 : 우유<br>
					고카페인 함유<br><br>
					가격 : <%=nf.format(mdto.getPrice()) %><br>
				</div>
				</td>
			</tr>
			<tr>
			 <th>
			 	<b><%=mdto.getMenu() %>&nbsp;&nbsp;★</b><b class="mScore"><%=mdto.getM_score() %></b>
			 </th>
			</tr>
			<tr>
        		<td colspan="2">
        			<br><hr style='width:650px; border:2px solid gray; left:20px;'>
        			<b class="acount" id="alist" style="margin-top: 10px; margin-left:10px;">댓글 <span>0</span></b><br>
        			<input type="hidden" name="sang_num" id="sang_num" value=<%=sang_num %>>
         			<input type="hidden" name="u_id" id="u_id" value="<%=id%>">
         			<%
					if(idchk==1){
					%>
        				<select style="width: 95px; margin-top: 10px; margin-left:10px;" class="select">
        					<option name="starScore" value="1">★
        					<option name="starScore" value="2">★★
        					<option name="starScore" value="3">★★★
        					<option name="starScore" value="4">★★★★
        					<option name="starScore" value="5" selected>★★★★★
        				</select>
        			<div class="aform input-group" style="margin-top: 10px; margin-left:10px;">
        				<textarea name="content" class="content" style="width: 550px;" class="form-control" required="required"
        				placeholder="댓글 입력"></textarea>
        				<button type="button" id="btnadd" class="btn btn-outline-info">저장</button>
        			</div>
        			<%
					}
        			%>
        			<div class="alist" style="margin-top: 10px; margin-left:10px;">
        				댓글목록
        			</div>
        		</td>
        	</tr>
		</table>
		<%
	}

	else if(sang_num.equals("3")){
		%>
		<table class="detail">
			<tr>
				<th style="width: 220px;">
					<img class="img-thumbnail menu-img" alt="" src="<%=root %>/save/<%=mdto.getM_image()%>">
				</th>
				<td rowspan="2">
				<div class="explain">
					One size / 20oz<br>
					1회 제공량 175.4kcal<br>
					진한 에스프레소와 부드러운 우유가 어우러져<br>
					고소한 풍미를 완성한 라떼.<br>
					알레르기 성분 : 우유<br>
					고카페인 함유<br><br>
					가격 : <%=nf.format(mdto.getPrice()) %><br>
				</div>
				</td>
			</tr>
			<tr>
			 <th>
			 	<b><%=mdto.getMenu() %>&nbsp;&nbsp;★</b><b class="mScore"><%=mdto.getM_score() %></b>
			 </th>
			</tr>
			<tr>
        		<td colspan="2">
        			<br><hr style='width:650px; border:2px solid gray; left:20px;'>
        			<b class="acount" id="alist" style="margin-top: 10px; margin-left:10px;">댓글 <span>0</span></b><br>
        			<input type="hidden" name="sang_num" id="sang_num" value=<%=sang_num %>>
         			<input type="hidden" name="u_id" id="u_id" value="<%=id%>">
         			<%
					if(idchk==1){
					%>
        				<select style="width: 95px; margin-top: 10px; margin-left:10px;" class="select">
        					<option name="starScore" value="1">★
        					<option name="starScore" value="2">★★
        					<option name="starScore" value="3">★★★
        					<option name="starScore" value="4">★★★★
        					<option name="starScore" value="5" selected>★★★★★
        				</select>
        			<div class="aform input-group" style="margin-top: 10px; margin-left:10px;">
        				<textarea name="content" class="content" style="width: 550px;" class="form-control" required="required"
        				placeholder="댓글 입력"></textarea>
        				<button type="button" id="btnadd" class="btn btn-outline-info">저장</button>
        			</div>
        			<%
					}
        			%>
        			<div class="alist" style="margin-top: 10px; margin-left:10px;">
        				댓글목록
        			</div>
        		</td>
        	</tr>
		</table>
		<%
	}
	else if(sang_num.equals("5")){
		%>
		<table class="detail">
			<tr>
				<th style="width: 220px;">
					<img class="img-thumbnail menu-img" alt="" src="<%=root %>/save/<%=mdto.getM_image()%>">
				</th>
				<td rowspan="2">
				<div class="explain">
					One size / 24oz<br>
					1회 제공량 278.6kcal<br>
					상큼한 라임과 달콤한 향기의 애플민트가 어우러져<br>
					상쾌함을 한잔에 가득 채운 모히또 음료.<br>
					알레르기 성분 : x<br><br>
					가격 : <%=nf.format(mdto.getPrice()) %><br>
				</div>
				</td>
			</tr>
			<tr>
			 <th>
			 	<b><%=mdto.getMenu() %>&nbsp;&nbsp;★</b><b class="mScore"><%=mdto.getM_score() %></b>
			 </th>
			</tr>
			<tr>
        		<td colspan="2">
        			<br><hr style='width:650px; border:2px solid gray; left:20px;'>
        			<b class="acount" id="alist" style="margin-top: 10px; margin-left:10px;">댓글 <span>0</span></b><br>
        			<input type="hidden" name="sang_num" id="sang_num" value=<%=sang_num %>>
         			<input type="hidden" name="u_id" id="u_id" value="<%=id%>">
         			<%
					if(idchk==1){
					%>
        				<select style="width: 95px; margin-top: 10px; margin-left:10px;" class="select">
        					<option name="starScore" value="1">★
        					<option name="starScore" value="2">★★
        					<option name="starScore" value="3">★★★
        					<option name="starScore" value="4">★★★★
        					<option name="starScore" value="5" selected>★★★★★
        				</select>
        			<div class="aform input-group" style="margin-top: 10px; margin-left:10px;">
        				<textarea name="content" class="content" style="width: 550px;" class="form-control" required="required"
        				placeholder="댓글 입력"></textarea>
        				<button type="button" id="btnadd" class="btn btn-outline-info">저장</button>
        			</div>
        			<%
					}
        			%>
        			<div class="alist" style="margin-top: 10px; margin-left:10px;">
        				댓글목록
        			</div>
        		</td>
        	</tr>
		</table>
		<%
	}
	else if(sang_num.equals("6")){
		%>
		<table class="detail">
			<tr>
				<th style="width: 220px;">
					<img class="img-thumbnail menu-img" alt="" src="<%=root %>/save/<%=mdto.getM_image()%>">
				</th>
				<td rowspan="2">
				<div class="explain">
					One size / 24oz<br>
					1회 제공량 203.8kcal<br>
					자몽의 달콤쌉싸름한 맛과<br>
					탄산의 톡쏘는 목넘김이 어우러진 트로피컬 에이드.<br>
					알레르기 성분 : x<br><br>
					가격 : <%=nf.format(mdto.getPrice()) %><br>
				</div>
				</td>
			</tr>
			<tr>
			 <th>
			 	<b><%=mdto.getMenu() %>&nbsp;&nbsp;★</b><b class="mScore"><%=mdto.getM_score() %></b>
			 </th>
			</tr>
			<tr>
        		<td colspan="2">
        			<br><hr style='width:650px; border:2px solid gray; left:20px;'>
        			<b class="acount" id="alist" style="margin-top: 10px; margin-left:10px;">댓글 <span>0</span></b><br>
        			<input type="hidden" name="sang_num" id="sang_num" value=<%=sang_num %>>
         			<input type="hidden" name="u_id" id="u_id" value="<%=id%>">
         			<%
					if(idchk==1){
					%>
        				<select style="width: 95px; margin-top: 10px; margin-left:10px;" class="select">
        					<option name="starScore" value="1">★
        					<option name="starScore" value="2">★★
        					<option name="starScore" value="3">★★★
        					<option name="starScore" value="4">★★★★
        					<option name="starScore" value="5" selected>★★★★★
        				</select>
        			<div class="aform input-group" style="margin-top: 10px; margin-left:10px;">
        				<textarea name="content" class="content" style="width: 550px;" class="form-control" required="required"
        				placeholder="댓글 입력"></textarea>
        				<button type="button" id="btnadd" class="btn btn-outline-info">저장</button>
        			</div>
        			<%
					}
        			%>
        			<div class="alist" style="margin-top: 10px; margin-left:10px;">
        				댓글목록
        			</div>
        		</td>
        	</tr>
		</table>
		<%
	}
	else if(sang_num.equals("7")){
		%>
		<table class="detail">
			<tr>
				<th style="width: 220px;">
					<img class="img-thumbnail menu-img" alt="" src="<%=root %>/save/<%=mdto.getM_image()%>">
				</th>
				<td rowspan="2">
				<div class="explain">
					One size / 24oz<br>
					1회 제공량 323.6kcal<br>
					체리의 새콤함과 청량감을 동시에 즐길 수 있는<br>
					환상적인 에이드.<br>
					알레르기 성분 : x<br><br>
					가격 : <%=nf.format(mdto.getPrice()) %><br>
				</div>
				</td>
			</tr>
			<tr>
			 <th>
			 	<b><%=mdto.getMenu() %>&nbsp;&nbsp;★</b><b class="mScore"><%=mdto.getM_score() %></b>
			 </th>
			</tr>
			<tr>
        		<td colspan="2">
        			<br><hr style='width:650px; border:2px solid gray; left:20px;'>
        			<b class="acount" id="alist" style="margin-top: 10px; margin-left:10px;">댓글 <span>0</span></b><br>
        			<input type="hidden" name="sang_num" id="sang_num" value=<%=sang_num %>>
         			<input type="hidden" name="u_id" id="u_id" value="<%=id%>">
         			<%
					if(idchk==1){
					%>
        				<select style="width: 95px; margin-top: 10px; margin-left:10px;" class="select">
        					<option name="starScore" value="1">★
        					<option name="starScore" value="2">★★
        					<option name="starScore" value="3">★★★
        					<option name="starScore" value="4">★★★★
        					<option name="starScore" value="5" selected>★★★★★
        				</select>
        			<div class="aform input-group" style="margin-top: 10px; margin-left:10px;">
        				<textarea name="content" class="content" style="width: 550px;" class="form-control" required="required"
        				placeholder="댓글 입력"></textarea>
        				<button type="button" id="btnadd" class="btn btn-outline-info">저장</button>
        			</div>
        			<%
					}
        			%>
        			<div class="alist" style="margin-top: 10px; margin-left:10px;">
        				댓글목록
        			</div>
        		</td>
        	</tr>
		</table>
		<%
	}
	else if(sang_num.equals("8")){
		%>
		<table class="detail">
			<tr>
				<th style="width: 220px;">
					<img class="img-thumbnail menu-img" alt="" src="<%=root %>/save/<%=mdto.getM_image()%>">
				</th>
				<td rowspan="2">
				<div class="explain">
					58g<br>
					1회 제공량 252.2kcal<br>
					버터풍미가 가득한 크루와상의 바삭함과<br>
					와플의 부드러움을 합친 겉바속촉 베이커리 메뉴.<br>
					알레르기 성분 : 계란, 우유, 밀<br><br>

					가격 : <%=nf.format(mdto.getPrice()) %><br>
				</div>
				</td>
			</tr>
			<tr>
			 <th>
			 	<b><%=mdto.getMenu() %>&nbsp;&nbsp;★</b><b class="mScore"><%=mdto.getM_score() %></b>
			 </th>
			</tr>
			<tr>
        		<td colspan="2">
        			<br><hr style='width:650px; border:2px solid gray; left:20px;'>
        			<b class="acount" id="alist" style="margin-top: 10px; margin-left:10px;">댓글 <span>0</span></b><br>
        			<input type="hidden" name="sang_num" id="sang_num" value=<%=sang_num %>>
         			<input type="hidden" name="u_id" id="u_id" value="<%=id%>">
         			<%
					if(idchk==1){
					%>
        				<select style="width: 95px; margin-top: 10px; margin-left:10px;" class="select">
        					<option name="starScore" value="1">★
        					<option name="starScore" value="2">★★
        					<option name="starScore" value="3">★★★
        					<option name="starScore" value="4">★★★★
        					<option name="starScore" value="5" selected>★★★★★
        				</select>
        			<div class="aform input-group" style="margin-top: 10px; margin-left:10px;">
        				<textarea name="content" class="content" style="width: 550px;" class="form-control" required="required"
        				placeholder="댓글 입력"></textarea>
        				<button type="button" id="btnadd" class="btn btn-outline-info">저장</button>
        			</div>
        			<%
					}
        			%>
        			<div class="alist" style="margin-top: 10px; margin-left:10px;">
        				댓글목록
        			</div>
        		</td>
        	</tr>
		</table>
		<%
	}
	else if(sang_num.equals("9")){
		%>
		<table class="detail">
			<tr>
				<th style="width: 220px;">
					<img class="img-thumbnail menu-img" alt="" src="<%=root %>/save/<%=mdto.getM_image()%>">
				</th>
				<td rowspan="2">
				<div class="explain">
					75g<br>
					1회 제공량 200.0kcal<br>
					꿀을 섞은 크림을 바삭한 쿠키슈 안에 넣어,<br>
					건강하고 맛있게 완성한 디저트.<br>
					알레르기 성분 : 계란, 우유, 대두, 밀<br><br>

					가격 : <%=nf.format(mdto.getPrice()) %><br>
				</div>
				</td>
			</tr>
			<tr>
			 <th>
			 	<b><%=mdto.getMenu() %>&nbsp;&nbsp;★</b><b class="mScore"><%=mdto.getM_score() %></b>
			 </th>
			</tr>
			<tr>
        		<td colspan="2">
        			<br><hr style='width:650px; border:2px solid gray; left:20px;'>
        			<b class="acount" id="alist" style="margin-top: 10px; margin-left:10px;">댓글 <span>0</span></b><br>
        			<input type="hidden" name="sang_num" id="sang_num" value=<%=sang_num %>>
         			<input type="hidden" name="u_id" id="u_id" value="<%=id%>">
         			<%
					if(idchk==1){
					%>
        				<select style="width: 95px; margin-top: 10px; margin-left:10px;" class="select">
        					<option name="starScore" value="1">★
        					<option name="starScore" value="2">★★
        					<option name="starScore" value="3">★★★
        					<option name="starScore" value="4">★★★★
        					<option name="starScore" value="5" selected>★★★★★
        				</select>
        			<div class="aform input-group" style="margin-top: 10px; margin-left:10px;">
        				<textarea name="content" class="content" style="width: 550px;" class="form-control" required="required"
        				placeholder="댓글 입력"></textarea>
        				<button type="button" id="btnadd" class="btn btn-outline-info">저장</button>
        			</div>
        			<%
					}
        			%>
        			<div class="alist" style="margin-top: 10px; margin-left:10px;">
        				댓글목록
        			</div>
        		</td>
        	</tr>
		</table>
		<%
	}
	else if(sang_num.equals("10")){
		%>
		<table class="detail">
			<tr>
				<th style="width: 220px;">
					<img class="img-thumbnail menu-img" alt="" src="<%=root %>/save/<%=mdto.getM_image()%>">
				</th>
				<td rowspan="2">
				<div class="explain">
					101g<br>
					1회 제공량 376.6kcal<br>
					달콤한 초콜릿 본연의 맛을 더 진하게 느낄 수 있는 케이크.<br>
					알레르기 성분 : 계란, 우유, 대두, 밀, 돼지고기, 호두, 땅콩<br><br>

					가격 : <%=nf.format(mdto.getPrice()) %><br>
				</div>
				</td>
			</tr>
			<tr>
			 <th>
			 	<b><%=mdto.getMenu() %>&nbsp;&nbsp;★</b><b class="mScore"><%=mdto.getM_score() %></b>
			 </th>
			</tr>
			<tr>
        		<td colspan="2">
        			<br><hr style='width:650px; border:2px solid gray; left:20px;'>
        			<b class="acount" id="alist" style="margin-top: 10px; margin-left:10px;">댓글 <span>0</span></b><br>
        			<input type="hidden" name="sang_num" id="sang_num" value=<%=sang_num %>>
         			<input type="hidden" name="u_id" id="u_id" value="<%=id%>">
         			<%
					if(idchk==1){
					%>
        				<select style="width: 95px; margin-top: 10px; margin-left:10px;" class="select">
        					<option name="starScore" value="1">★
        					<option name="starScore" value="2">★★
        					<option name="starScore" value="3">★★★
        					<option name="starScore" value="4">★★★★
        					<option name="starScore" value="5" selected>★★★★★
        				</select>
        			<div class="aform input-group" style="margin-top: 10px; margin-left:10px;">
        				<textarea name="content" class="content" style="width: 550px;" class="form-control" required="required"
        				placeholder="댓글 입력"></textarea>
        				<button type="button" id="btnadd" class="btn btn-outline-info">저장</button>
        			</div>
        			<%
					}
        			%>
        			<div class="alist" style="margin-top: 10px; margin-left:10px;">
        				댓글목록
        			</div>
        		</td>
        	</tr>
		</table>
		<%
	}
	%>
<script type="text/javascript">
	$(document).on("click",".amod",function(){
		$(".answer").show();
		var idx=$(this).attr("idx");
		$(".textAnswer").html("");
		var cont=$(".content"+idx).html();
		var content=cont.replace("<br>","\n");
		var sang_num=$
		
		var star=$(".hiddenStar"+idx).val();
		//alert(star);
			
		s="";
		//alert(idx);
		s+="<table class='uanswer"+idx+" uanswer' style='width:600px;'>";
		s+="<input type='hidden' class='hiddenSang' value='"+sang_num+"'>";
		s+="<select style='width: 95px; margin-top: 10px;' class='select ustarScore'>";
		s+="<option name='ustarScore' value='1' "+(star=='★'?'selected':'')+" >★";
		s+="<option name='ustarScore' value='2' "+(star=='★★'?'selected':'')+" >★★";
		s+="<option name='ustarScore' value='3' "+(star=='★★★'?'selected':'')+" >★★★";
		s+="<option name='ustarScore' value='4' "+(star=='★★★★'?'selected':'')+" >★★★★";
		s+="<option name='ustarScore' value='5' "+(star=='★★★★★'?'selected':'')+" >★★★★★";
		s+="</select>";
		s+="<div style='margin-top: 10px;'>"
		s+="<tr><td>";
		s+="<textarea name='content' class='content' style='width: 530px;' class='form-control' required='required'";
		s+="placeholder='댓글 수정'>"+content+"</textarea></td></tr>";
		s+="<tr><td><button type='button' idx='"+idx+"' class='btn btn-outline-info btnUpdate' style='margin-right:10px;'>수정</button>";
		s+="<button type='button' id='btnClose' idx='"+idx+"' class='btn btn-outline-danger btnClose'>닫기</button></td></tr>"
		s+="</div>"
		s+="</table>";
		$(".textAnswer"+idx).show();
		$(".answer"+idx).hide();
		$(".textAnswer"+idx).html(s);
	})
	
	$(document).on("click",".btnClose",function(){
		//alert("클릭함");
		var idx=$(this).attr("idx");
		$(".textAnswer").html("");
		$(".answer"+idx).show();
	})
	
	$(document).on("click",".btnUpdate",function(){
		//alert("클릭했음");
		var idx=$(this).attr("idx");
		var content=$(this).parent().parent().parent().find(".content").val();
		var starScore=$(".ustarScore").val();
		var sang_num=$("#sang_num").attr("value");
		//alert(sang_num);
		//alert(idx);
		//alert(content);
		//alert(starScore);
		$.ajax({
			type:"get",
			dataType:"html",
			url:"updateAnswer.jsp",
			data:{"content":content,"idx":idx,"starScore":starScore,"sang_num":sang_num},
			success:function(data){
				list();
			}
		})
	})
	
	$(document).on("click",".adel",function(){
		
		var idx=$(this).attr("idx");
		var sang_num=$("#sang_num").attr("value");
		//alert("클릭함, 상넘="+sang_num+"idx = "+idx);
		var s=confirm("삭제하시겠습니까?");
		
		if(s){
			$.ajax({
				type:"get",
				dataType:"html",
				url:"deleteAnswer.jsp",
				data:{"idx":idx,"sang_num":sang_num},
				success:function(data){
					list();
					alert("삭제되었습니다.");
				}
			})
		}else{
			alert("취소하였습니다.");
		}
	})

</script>
</body>
</html>