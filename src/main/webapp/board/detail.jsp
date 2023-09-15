<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.BoardDto"%>
<%@page import="data.dao.BoardDao"%>
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
	String num=request.getParameter("num");
	BoardDao dao=new BoardDao();
	BoardDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일");
	
	String id=(String)session.getAttribute("id");
%>
<body>
	<div>
		<form action="">
			<table class="table table-bordered" style="width: 979.5px;">
				<caption align="top"><h3>자유게시판</h3></caption>
				<tr>
					<td>
						<span><h5><%=dto.getTitle() %></h5></span><br>
						<span><%=dto.getExpress() %></span>
						<span><%=sdf.format(dto.getWriteday()) %></span>
						
						<div style="float: right;">
							<span>조회 <%=dto.getView() %></span>
							|
							<span>추천 <%=dto.getRecommend() %></span>
							|
							<span>댓글 0</span>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div style="width: 979.5px; height: 500px;">
							<%=dto.getContent() %>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div style="width: 979.5px; height: 500px; background-color: gray;">
							<div style="">
								
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>