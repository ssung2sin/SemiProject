<%@page import="java.util.Random"%>
<%@page import="data.dto.UserDto"%>
<%@page import="data.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Gugi&family=Orbit&display=swap"
        rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>

<%
  
  //난수 인증번호 생성
 
	String userId=(String)pageContext.getSession().getAttribute("userId");
	String uSave=(String)pageContext.getSession().getAttribute("uSave");
	System.out.println("휴면페이지에서 "+uSave);
	UserDao dao=new UserDao();
	UserDto dto=dao.getData(userId);
	String email = dto.getU_email();
	
	String recipient[]=email.split("@");
  	//난수 인증번호 생성
    int ranNum[]=new int[4];
    
    for(int i=0;i<ranNum.length;i++){
       ranNum[i]=(int)(Math.random()*10);
    }
    
    String codenumber=ranNum[0]+""+ranNum[1]+""+ranNum[2]+""+ranNum[3];
    //System.out.println(codenumber);
%>

<style type="text/css">
   #userhp::placeholder {color: #a9a9a9; font-size: 14px;}
   #codenum::placeholder {color: #a9a9a9; font-size: 14px;}
   
   #userhp{
      display: inline-block;
      margin-top: 5px;
   }
   #codebtn{
      margin-bottom: 5px;
   }
   #codenum{
      display: inline-block;
   }
   #timer{
      display: inline-block;
   }
   #humanclear{
      margin-top: 30px;
   }
   #userEmail{
		display: inline-block;
   }
</style>
<script type="text/javascript">
	$(function(){
		$("#codeform").hide();		//처음에는 인증번호 입력란 숨기기
		
		var x="";
		
		$("#codebtn").click(function(){
			if(userEmail.value == "<%=dto.getU_email()%>"){
				$("#codeform").show();
				$("#codebtn").prop("disabled",true);
				$.ajax({
					
					type:"get",
					dataType:"html",
					url:"mail/mailsend.jsp",
					data:{"recipient1":'<%=recipient[0]%>',"recipient2":'<%=recipient[1]%>',"codenumber":'<%=codenumber%>'},
					success:function(){
						$(".codeNum").val(data.ranNum);
					}
					
				})
				var time = 180;	//제한시간
				var min = ""; 	//분
				var sec = ""; 	//초
				
				//setInterval(함수,시간) : 주기적인 실행
				x = setInterval(function() {
					min = parseInt(time/60);		//몫을 계산
					sec = time%60;					//나머지를 계산
					
					$("#timer").html(min + "분" + sec + "초");
					time--;
					
					//타임아웃 시
					if(time < 0){
						clearInterval(x);	//setInterval() 실행을 끝냄
						$("#timer").html("시간초과");
						$("#codenum").prop("disabled",true);
						$("#codenum").val("");
						$("#codenum").attr("placeholder","재전송 버튼을 눌러주세요");
					}
					
				}, 1000);
			}
			else{
				alert("이메일이 일치하지 않습니다.");
			}
		});
		
		$("#timereset").click(function(){
			$("#codenum").prop("disabled",false);
			$("#codenum").attr("placeholder","인증번호를 입력하세요");
			$("#codenum").val("");
			clearInterval(x);
			$.ajax({
				
				type:"get",
				dataType:"json",
				url:"mail/mailsend.jsp",
				data:{"recipient1":'<%=recipient[0]%>',"recipient2":'<%=recipient[1]%>'},
				success:function(data){
					$(".codeNum").val(data.ranNum);
				}
				
			})
			var time = 180;	//제한시간
			var min = ""; 	//분
			var sec = ""; 	//초
			
			//setInterval(함수,시간) : 주기적인 실행
			x = setInterval(function() {
				min = parseInt(time/60);		//몫을 계산
				sec = time%60;					//나머지를 계산
				
				$("#timer").html(min + "분" + sec + "초");
				time--;
				
				//타임아웃 시
				if(time < 0){
					clearInterval(x);	//setInterval() 실행을 끝냄
					$("#timer").html("시간초과");
					$("#codenum").prop("disabled",true);
					$("#codenum").val("");
					$("#codenum").attr("placeholder","재전송 버튼을 눌러주세요");
				}
			}, 1000);
		});
	});
	
	function check() {	//인증번호가 같으면 submit
		var resetRanNum=$(".codeNum").val();
		if(codenum.value != resetRanNum){
			alert("인증번호가 틀립니다");
			codenum.value = "";		// 잘 못 입력한 전화번호 리셋해주기
			codenum.focus();			// 전화번호쪽으로 focus
			return false;			// 번호가 일치하지않으면 submit 안되게			
		}
		else{
			return true;
		}
	}
</script>
</head>
<script>
   
</script>
<body>

<div align="center" style="margin-top: 5%; background-color:rgba(255,255,255,0.5); border-radius: 20px; padding: 100px;">
	<form action="userLogin/humanLoginAction.jsp" method="post" onsubmit="return check()">
		<input type="hidden" value="<%=userId%>" name="userId">
		<input type="hidden" value="<%=codenumber %>" class="codeNum">
		<input type="hidden" value="<%=uSave%>" name="uSave">
		<h1><%=dto.getU_name()%>님은 현재 휴면계정입니다.</h1><br><br>
		<h6>계정을 활성화 하시려면 이메일인증을 해주세요</h6>
		<input type="text" style="width: 220px; height: 40px;" class="form-control"
		 required="required" placeholder="이메일을 입력하시오" id="userEmail">
		<button type="button" class="btn btn-success" id="codebtn">인증번호 요청</button><br>
		<div id="codeform">
			<input type="text" style="width: 200px; height: 40px;" class="form-control"
			 maxlength="4" required="required" placeholder="인증번호를 입력하세요" id="codenum">
			 <div id="timer" style="width: 68px;"></div>
			 <button type="button" class="btn btn-outline-secondary btn-sm" style="margin-bottom: 5px;" id="timereset"><i class="bi bi-repeat"></i>재전송</button><br>
			
			 <span style="text-align: left; font-size: 13px; color: green;">
				 인증번호를 발송하였습니다(유효시간 3분)<br>
				 인증번호가 오지 않으면 '재전송' 버튼을 눌러주세요.
			 </span>
		 </div>
		<br><button type="submit" class="btn btn-outline-info" id="humanclear">휴면계정해제</button>
	</form>
</div>
<%
System.out.println(codenumber);
%>
</body>
</html>