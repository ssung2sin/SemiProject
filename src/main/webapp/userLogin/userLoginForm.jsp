<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Audiowide&family=Hi+Melody&family=Itim&family=Nanum+Pen+Script&family=Rock+Salt&family=Wallpoet&display=swap" rel="stylesheet">
<title>Login Form</title>
</head>
<%
String saveok=(String)session.getAttribute("saveok");
if(saveok==null){
	saveok="";
}
String uid="";
String bid="";

if(saveok!=null){//로그인시 아이디저장을 체크했다면 
	
	if(saveok.equals("uyes")){
		uid=(String)session.getAttribute("Id");
	}else{
		bid=(String)session.getAttribute("Id");
	}
}
%>
<body>
<div class="container mt-3">
			  
			  <!-- Nav pills -->
			  <ul class="nav nav-pills" role="tablist">
			    <li class="nav-item">
			      <a class="nav-link active" data-bs-toggle="pill" href="#ulogin">개인로그인</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" data-bs-toggle="pill" href="#blogin">사업자로그인</a>
			    </li>
			  </ul>
			
			  <!-- Tab panes -->
			  <div class="tab-content">
			    <div id="ulogin" class="container tab-pane active"><br>
			     	<form action="userLogin/userLoginAction.jsp" method="post">
					<table class="table table-bordered" style="width: 350px;">
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" name="userId" class="form-control" required="required"
								style="width:120px;" value="<%=uid%>">
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>	
								<input type="password" name="userPass" class="form-control" required="required"
								style="width:150px;">
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
							<button type="submit" class="btn btn-info">로그인</button>
							</td>
						</tr>
						<tr>
							<td colspan="2" rowspan="2" align="center">
								<input type="checkbox" name="uSave" <%=saveok.equals("uyes")?"checked":""  %>>아이디저장
							</td>
						</tr>
					</table>
					</form>
			    </div>
			    <div id="blogin" class="container tab-pane fade"><br>
			      <form action="bLoginAction.jsp" method="post">
					<table class="table table-bordered" style="width: 350px;">
						<tr>
							<th>사업자번호</th>
							<td>
								<input type="text" name="bId" class="form-control" required="required"
								style="width:120px;" value="<%=bid%>">
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>	
								<input type="password" name="bPass" class="form-control" required="required"
								style="width:150px;">
							</td>
						</tr>
						<tr>
							<td colspan="2"  align="center">
							<button type="submit" class="btn btn-info">로그인</button>
							</td>
						</tr>
						<tr>
							<td colspan="2" rowspan="2" align="center">
								<input type="checkbox" name="bSave" <%=saveok.equals("byes")?"checked":"" %>>아이디저장
							</td>
						</tr>
					</table>
					</form>
			    </div>
			  </div>
</div>
</body>
</html>