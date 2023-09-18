<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.MenuDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dto.MenuOrderDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
th{
	font-family: "Dongle";
	font-size: 30px;
}
tr{
	font-family: "Dongle";
	font-size: 22px;
}
tr.accordion-content {
	display: none;
}

/* 토글 행에 스타일 적용 */
tr.accordion-toggle:hover {
	cursor: pointer;
	background-color: #f5f5f5;
}
.addTime{
	cursor: pointer;
	width: 50px;
	height:50px;
}
</style>
<script type="text/javascript">
	$(function(){
		$(".addTime").click(function(){
			var time=$(this).parent().find(".time").val();
			var num=$(this).parent().find(".num").val();
			//alert(time+","+num);
			$.ajax({
				type:"get",
				dataType:"html",
				url:"order/addTime.jsp",
				data:{"time":time,"num":num},
				success:function(data){
					alert("메뉴준비시간이 등록되었습니다.");
					window.location.reload();
				}
			})
		})
		
		//주문삭제 버튼
		$(".orderCancel").click(function(){
			var num=$(this).attr("num");
			var del=confirm("주문을 삭제하시겠습니까?");
			
			if(del){
				$.ajax({
					type:"get",
					dataType:"html",
					url:"order/delOrder.jsp",
					data:{"num":num},
					success:function(){
						alert("삭제되었습니다.");
						window.location.reload();
					}
				})
			}else{
				alert("취소되었습니다.");
			}
		})
		
		//조리완료 버튼
		$(".orderComp").click(function(){
			var num=$(this).attr("num");
			var comp=confirm("조리가 완료되었습니까?");
			if(comp){
				$.ajax({
					type:"get",
					dataType:"html",
					url:"order/compOrder.jsp",
					data:{"num":num},
					success:function(){
						alert("완료되었습니다.");
						window.location.reload();
					}
				})
			}else{
				alert("취소되었습니다.");
			}
		})
		
	})

	$(document).ready(function() {
		// 토글 행을 클릭할 때 자세한 내용을 토글합니다.
		$("tr.accordion-toggle").click(function() {
			$(this).next("tr.accordion-content").slideToggle("fast");
		});
	});
</script>
</head>
<%
	String grade=(String)session.getAttribute("grade");
	String selectId="";
	if(grade==null)
		grade="";
	if(grade.equals("shop")){
		selectId="s_id";
	} else if(grade.equals("user")){
		selectId="u_id";
	}
	String id=(String)session.getAttribute("id");
	List<MenuOrderDto>list=new ArrayList<MenuOrderDto>();
	MenuDao mdao=new MenuDao();
	list=mdao.selectMyOrder(id,selectId);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.0");
	SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH시mm분");

%>
<body>
	<table class="table table-striped" style="width: 800px;">
		<tr>
			<th style="width: 150px;">주문번호</th>
			<th style="width: 250px;">주문매장</th>
			<th style="width: 250px;">주문시간</th>
			<th>준비상태</th>
		</tr>
		<%
	if(list.size()==0){
		%>
		<tr>
			<td>
				<b>주문 목록이 없습니다.</b>
			</td>	
		</tr>
		<%
	}else{
		for(int i=0;i<list.size();i++){
			MenuOrderDto dto=list.get(i);
			ShopDao dao=new ShopDao();
			String name=dao.getName(dto.getS_id());
			System.out.println("컴플리트넘="+dto.getCompletion());
			%>
		<tr class="accordion-toggle">
			<td><%=dto.getNum() %></td>
			<td><%=name%></td>
			<td><%=time.format(dto.getOrder_time()) %></td>
			<td><%=dto.getCompletion()==1?"조리 완료": (dto.getPrepare_time()==null?"주문 접수중":(mdao.subTime(sdf.format(dto.getPrepare_time()))<=0?"시간초과":mdao.subTime(sdf.format(dto.getPrepare_time()))+"분")) %></td>
		</tr>
		<tr class="accordion-content">
			<td colspan="2" align="center">
				<p><%=dto.getReceipt() %></p>
			</td>
			<%if(grade.equals("user")){ %>
			<td colspan="2" align="center">
				<%=dto.getCompletion()==1?"조리 완료": (dto.getPrepare_time()==null?"주문 접수중":"예상 메뉴 나오는시간 : "+time.format(dto.getPrepare_time())
						+"<br> 남은시간 : "+(mdao.subTime(sdf.format(dto.getPrepare_time()))<=0?"시간초과":mdao.subTime(sdf.format(dto.getPrepare_time()))+"분")) %>
			<%if(dto.getCompletion()==1){
					%>
					<button class="btn btn-outline-danger sm orderCancel" num="<%=dto.getNum()%>">주문삭제</button>
					<%
				}
			%>
			</td>
			<%}
			else if(grade.equals("shop")){%>
			<td colspan="2" align="center" valign="middle">
			<% if(dto.getPrepare_time()==null){%>
			<input type="hidden" class="num" value="<%=dto.getNum()%>">
				메뉴준비 예상시간 : <input type="text" class="time" style="width: 50px;">분 
				<i class="bi bi-check-square addTime"></i>
				<%}else{
				%>
				예상 메뉴 나오는시간 : <%=time.format(dto.getPrepare_time()) %><br>
				남은시간 : <%=dto.getCompletion()==1?"조리 완료": (mdao.subTime(sdf.format(dto.getPrepare_time()))<=0?"시간초과":mdao.subTime(sdf.format(dto.getPrepare_time()))+"분") %><br>
				<%
				if(dto.getCompletion()==1){
					%>
					<button class="btn btn-outline-danger sm orderCancel" num="<%=dto.getNum()%>">주문삭제</button>
					<%
				}else{
				%>
				<button class="btn btn-outline-success sm orderComp" num="<%=dto.getNum()%>">조리완료</button>
				<button class="btn btn-outline-danger sm orderCancel" num="<%=dto.getNum()%>">주문취소</button>
				<%
				}
				}
			}
			%>
			</td>
		</tr>
		<%
	}
}
%>
	</table>
</body>
</html>