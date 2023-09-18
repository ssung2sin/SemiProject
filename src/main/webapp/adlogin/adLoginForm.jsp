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
<style type="text/css">
	th{
		font-size :3vh;
	}
	#AdId{
		width: 15vh;
		height: 7vh;
	}
	#AdPass{
		width: 18vh;
		height: 7vh;
	}
	#mytable{
		width: 44vh;
		height: 30vh;
		text-align: center;
	}
	#myzzzz{
		font-size :3vh;
	}
</style>
</head>
<%
String root=request.getContextPath();

%>

<body>
			    <div id="ulogin" class="tab-pane active"><br>
			     	<form action="<%=root %>/adlogin/adLoginAction.jsp" method="post">
					<table class="table table-bordered" id="mytable">
						<tr>
							<th colspan="2">관리자로그인</th>
						</tr>
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" id="AdId" name="AdId" class="form-control" required="required">
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>	
								<input type="password" id="AdPass" name="AdPass" class="form-control" required="required">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="submit" class="btn btn-info" id="myzzzz">로그인</button>
							</td>
						</tr>
					</table>
					</form>
			    </div>
</body>
</html>