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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
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
%>
</body>
<table>
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
		%>
	<tr>
		<td>
			주문번호 : <%=dto.getNum() %> <%=dto.getOrder_time()==null?"접수 준비중":"메뉴 준비중" %>
		</td>	
	</tr>
		<%
	}
}
%>

</table>
</html>