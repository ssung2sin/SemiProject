<%@page import="java.util.List"%>
<%@page import="data.dto.AdDto"%>
<%@page import="data.dao.AdDao"%>
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
<%

	AdDao dao=new AdDao();
	List<AdDto> list=dao.selectindiv();
	AdDto dto =new AdDto();
%>
<body>
<table class="table table-striped" style="background-color: rgba(255,255,255,0.5)">
		<tr>
		<th>숫자</th><th>아이디</th><th>비밀번호</th><th>이름</th><th>전화번호</th><th>생년월일</th><th>이메일</th><th>가입날짜</th><th>수정/삭제</th>
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
		<td><%=dto.getNum2() %></td><td><%=dto.getU_id2() %></td><td><%=dto.getU_pass()%></td><td><%=dto.getU_name()%></td><td><%=dto.getU_hp() %></td><td><%=dto.getU_birth() %></td><td><%=dto.getU_email() %></td><td><%=dto.getU_rdate() %></td>
		<td>
		<button type="button" class="btn btn-info">수정버튼</button>
		<button type="button" class="btn btn-danger">삭제버튼</button>
		</td>
		</tr>
		
		<%} 
	}%>
	</table>
</body>
</html>