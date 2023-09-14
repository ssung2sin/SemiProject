<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.BoardDto"%>
<%@page import="java.util.List"%>
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
	BoardDao dao=new BoardDao();

	int totalCount=dao.getTotalCount(); 
	int totalPage; 
	int startPage; 
	int endPage; 
	int startNum; 
	int perPage=10; 
	int perBlock=10; 
	int currentPage;
	int no;
	
	if(request.getParameter("currentPage")==null||request.getParameter("currentPage").equals("null"))
		currentPage=1;
		else
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	
		startPage=(currentPage-1)/perBlock*perBlock+1;
	 
		endPage=startPage+perBlock-1;
	
	if(endPage>totalPage)
		endPage=totalPage;

	startNum=(currentPage-1)*perPage;
	
	no=totalCount-(currentPage-1)*perPage;
	
	List<BoardDto> list=dao.getPagingList(startNum, perPage);
%>
<body>
<div>
	<table class="table table-striped" style="width: 1000px;">
		<caption align="top"><h3>자유게시판</h3></caption>
		<tr align="center">
			<th style="width: 80px; background-color: #;"></
			<span style="float: left; margin-left: 50px;">번호</span>
			<span style="float: left; margin-left: 250px;">제목</span>
			
			
			<span style="float: right; margin-right: 50px;">조회</span>
			<span style="float: right; margin-right: 100px;">작성일</span>
			<span style="float: right; margin-right: 100px;">작성자</span>
			</th>
		</tr>
		
		<%
			if(list.size()==0)
			{%>
				<tr>
					<td>
						<h5 align="center">게시물이 없습니다</h5>
					</td>
				</tr>
			<%}
			else
			{
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				for(int i=0;i<list.size();i++)
				{	
					BoardDto dto=list.get(i);
					%>
					
					<tr>
						<td>
						<span>
						</span>
						</td>
					</tr>
				<%}
			}
		%>
	</table>
</div>
</body>
</html>