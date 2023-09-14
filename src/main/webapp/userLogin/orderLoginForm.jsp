<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap"rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<%
String root=request.getContextPath();
String saveok=(String)session.getAttribute("saveok");
String s_id=request.getParameter("s_id");
if(saveok==null){
	saveok="";
}
String uid="";
if(saveok!=null){//로그인시 아이디저장을 체크했다면 
	
	if(saveok.equals("uyes")){
		uid=(String)session.getAttribute("id");
	}
}
%>
</head>
<body>
	<form action="<%=root%>/userLogin/orderLoginAction.jsp" method="post">
		<input type="hidden" name="s_id" value="<%=s_id%>">
		<table class="table table-bordered" style="width: 350px;">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="userId" class="form-control"
					required="required" style="width: 120px;" value="<%=uid%>">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="userPass" class="form-control"
					required="required" style="width: 150px;"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info">로그인</button>
				</td>
			</tr>
			<tr>
				<td colspan="2" rowspan="2" align="center"><input
					type="checkbox" name="uSave"
					<%=saveok.equals("uyes") ? "checked" : ""%>>아이디저장</td>
			</tr>
		</table>
	</form>
</body>
</html>