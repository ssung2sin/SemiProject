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
<script type="text/javascript"
   src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
   charset="utf-8"></script>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>types of food & drink</title>
<%
String root=request.getContextPath();
String loginok=(String)session.getAttribute("loginok");

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
<script type="text/javascript">
	$(function(){
		<%
		if(loginok==null){
			%>
			$.ajax({
				type:"get",
				dataType:"html",
				url:"../userLogin/getSessionSid.jsp",
				data:{"s_id":"<%=s_id%>"},
				success:function(data){
					
				}
			})
			<%
		}
		%>
	})
</script>
</head>
<body>
	<form action="<%=root%>/userLogin/orderLoginAction.jsp" method="post">
		<input type="hidden" name="s_id" class="s_id" value="<%=s_id%>">
		<table class="table table-bordered" style="width: 350px;">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="userId" class="form-control"
					required="required" style="width: 120px;" value="<%=uid%>">
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
				<td colspan="2" align="left">
					<input type="checkbox" name="uSave" <%=saveok.equals("uyes")?"checked":""  %>>아이디저장&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-info" id="loginbtn">로그인</button>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<div id="naver_id_login"></div>
				</td>
			</tr>
		</table>
	</form>
<script type="text/javascript">
var modal=$(".s_id").val();
   /*네이버 로그인 변수에  api인자값과 callback URL*/
     var naver_id_login = new naver_id_login("mxqUPyw1CadFAnqmOC_4", "http://localhost:8080/SemiProject/userLogin/callback.jsp");
 // 접근 토큰 값 출력
 	//alert(modal);
      var state = naver_id_login.getUniqState(); //네이버 API 설정된 정보값 전달 변수
      naver_id_login.setButton("white", 2, 40); //네이버 로그인 버튼 색상 크기 설정사용 가능한 Option ,버튼 색상 : white, green ,크기 : 1(버튼형), 2(작은 배너), 3(큰 배너), 배너 및 버튼 높이 : 사용자 지정값
      naver_id_login.setDomain("http://localhost:8080/SemiProject/userLogin/callback.jsp"); 
      //나의 도메인주소 상태 토큰 비교를 위한 domain 설정         
      /* 주의: 
         콜백 URL과 네이버 로그인 로그인 버튼이 붙은 페이지의 도메인이 서로 다른 경우, 자동으로 처리하는 상태 토큰 비교가 오동작할 수 있습니다. 이 경우 추가 처리가 필요합니다.
         로그인 버튼이 붙은 페이지의 domain 은 wwww.service.com 이고,
      콜백 URL로 설정된 페이지는 callback.service.com 인 경우
      
      2.2 기본 설정 및 2.3 인증 시작하기에서 아래 구문을 추가하면 문제가 해결됩니다.

      naver_id_login.setDomain(".service.com");
       */
      naver_id_login.setState(state); //설정 정보 사용
      naver_id_login.setPopup(); //네이버 로그인 인증창 웹페이지 표시
      naver_id_login.init_naver_id_login(); //내 API 호출(사용) 중요
  </script>
</body>
</html>