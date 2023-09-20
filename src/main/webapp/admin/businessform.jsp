<%@page import="data.dao.AdDao"%>
<%@page import="data.dto.AdDto"%>
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
<style type="text/css">
	th{
	border: 3px solid gray; 
	}
</style>
</head>
<%

	AdDao dao=new AdDao();
	List<AdDto> list=dao.selectbusiness();
	AdDto dto =new AdDto();
%>
<body>
<div>
	<table class="table table-striped" style="background-color: rgba(255,255,255,0.5)">
		<tr>
		<th>입점번호(ID)</th><th>비밀번호</th><th>이름</th><th>입점명</th><th>매장위치</th><th>매장전화번호</th><th>휴대폰</th><th>휴개소번호</th><th>수정/삭제</th>
		</tr>
		<% 
		if(list.size()==0)
			{
				%>
				<tr>
					<td>
						<h5 align="center">게시물이 없습니다</h5>
					</td>
				</tr>
			<%}else{
				for(int i=0;i<list.size();i++){
					dto = list.get(i);
				%>
		<tr>
		<td><%=dto.getS_id2() %></td><td><%=dto.getS_pass() %></td><td><%=dto.getS_name() %></td><td><%=dto.getShop_name() %></td><td><%=dto.getShop_addr() %></td><td><%=dto.getShop_hp() %></td><td><%=dto.getS_phone() %></td><td><%=dto.getB_id2() %></td>
		<td>
		<button type="button" class="btn btn-info">수정버튼</button>
		<button type="button" class="btn btn-danger">삭제버튼</button>
		</td>
		</tr>
		
		<%} 
	}%>
	</table>
</div>
</body>
</html>

