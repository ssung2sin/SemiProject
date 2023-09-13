<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MenuDao"%>
<%@page import="data.dto.MenuDto"%>
<%@page import="data.dao.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Gugi&family=Orbit&display=swap"
        rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	div.menudiv{
		cursor: pointer;
	}
	div.new_menudiv{
		cursor: pointer;
	}
	#category{
		width: 700px;
		border: 1px solid lightgray;
		border-color: lightgray;
		margin-left: 90px;
		margin-top : 20px;
		padding-top: 15px;
		padding-bottom: 15px;
		
	}
	.orderBtn{
		font-size:30px;
		font-family:'Dongle';
		margin-left: 450px;
		border: 1px solid white;
		width: 150px;
		height: 50px;
		background-color: orange;
		color: white;
	}
	.orderBtn:active{
		background-color: white;
		color: orange;
	}
</style>
</head>
<%
String s_id=request.getParameter("s_id");
MenuDao dao=new MenuDao();
List<MenuDto> list=dao.selectMenu(s_id);

List<String> categorylist=new ArrayList<String>();
categorylist=dao.getCategory(s_id);
%>
<body>
<script type="text/javascript">
	$(function(){
		
		#(".orderBtn").click(function(){
			window.open("megaDetailPage.jsp?sang_num="+sang_num+"&s_id="+s_id,"_self","width=900, height=700, scrollbars=yes");
		})
	})

</script>
<%
	for(int i=0;i<list.size();i++){
		MenuDto dto=list.get(i);
		if(s_id.equals("106-31-1000"+(i+1))){%>
			<img src="../shopimg/shop<%=i+1 %>.png" style="width: 186px; height: 186px; margin-left: 20px;">
			<button class="orderBtn">주문하기</button>

			<div id="category">
				<b style="margin-left: 20px;">분류보기</b>
				<hr width="660" style="margin-left: 20px;">
				
				<span style="margin-left: 20px;">
					<input type="radio" class="rbtn" name="category" value="All" checked="checked">All&nbsp;
					<%
					for(int j=0;j<categorylist.size();j++){
					%>
						<input type="radio" class="rbtn" name="category" value="<%=categorylist.get(j)%>"><%=categorylist.get(j)%>&nbsp;
					<%}
					%>
				</span>
			</div>
			<input type="hidden" class="s_id" value="<%=s_id%>">
		<%}
	}
%>


<div align="center" style="margin-top: 5%; margin-bottom: 3%;" id="allbody">
	<table style="width: 800px;">
		<tr>
		<%
		for(int i=0;i<list.size();i++){
				MenuDto dto=list.get(i);
			%>
				<td>
					<div align="center" class="menudiv" sang_num="<%=dto.getSang_num()%>">
						<img src="../save/<%=dto.getM_image() %>" style="width: 250px; height: 250px;"><br>
						<b style="font-size: 15px;"><%=dto.getMenu() %><br>★<%=dto.getM_score() %></b>
					</div>
				</td>
			<%
			if(i%3==2){%>
				</tr>
				<tr>
			<%}
		}
		%>
</tr>
</table>
</div>

<div align="center" style="margin-top: 5%; margin-bottom: 3%;" id="menubody">

</div>

	<script type="text/javascript">
		$("div.menudiv").click(function(){
			var sang_num=$(this).attr("sang_num");
			var s_id=$(".s_id").val();
			//alert(s_id);
			//alert(sang_num);
				
			window.open("megaDetailPage.jsp?sang_num="+sang_num+"&s_id="+s_id,"_self","width=900, height=700, scrollbars=yes");
		});
		
		$(document).on("click","div.new_menudiv",function(){
			var sang_num=$(this).attr("sang_num");
			var s_id=$(".s_id").val();
			//alert(s_id);
			//alert(sang_num);
				
			window.open("megaDetailPage.jsp?sang_num="+sang_num+"&s_id="+s_id,"_self","width=900, height=700, scrollbars=yes");
		});
		
		$(".rbtn").click(function(){
			var eng_category=$(this).val();
			//alert(category);
			if(eng_category=="All"){
				$("#allbody").show();
				$("#menubody").html("");
			}
			else{
				
				$.ajax({
					type: "get",
					url: "menuCategory.jsp",
					dataType: "json",
					data: {"eng_category":eng_category},
					success: function(data){

						var s="";
						$("#allbody").hide();
						
						s+="<div align='center' style='margin-top: 5%; margin-bottom: 3%;'>";
						s+="<table style='width: 800px;'>";
						s+="<tr>";
				         $.each(data,function(idx,item){
				        	 if(item.m_score%1==0){
									item.m_score+=".0";
							}
				        	 //alert(item.sang_num);
				        	 s+="<td>"
								s+="<div align='center' class='new_menudiv' sang_num='"+item.sang_num+"'>"
									s+="<img src='../save/"+item.m_image+"' style='width: 250px; height: 250px;'><br>"
									s+="<b style='font-size: 15px;'>"+item.menu+"<br>★"+item.m_score+"</b>"
								s+="</div>"
							s+="</td>"
							if(idx%3==2){
								s+="</tr><tr>"
							}
				         });
				         
				         s+="</tr></table></div>"
				         
				         $("#menubody").html(s);
					}
				});
			}
		});
	</script>
</body>
</html>