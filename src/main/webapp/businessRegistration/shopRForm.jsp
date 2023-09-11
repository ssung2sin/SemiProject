<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dokdo&family=Nanum+Brush+Script&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
		$("#expressName").change(function(){
			
			var name=$(this).val();
			$("#expressName3").val(name);
			$("#expressName2").text(name);
			alert($("#expressName3").val());
		});
		
		$("#s_number1").keyup(function(){

            if($(this).val().length==3)
                $("#s_number2").focus();
        });
		
		$("#s_number2").keyup(function(){

            if($(this).val().length==2)
                $("#s_number3").focus();
        });
		
		$("#shop_hp1").keyup(function(){

            if($(this).val().length==3)
                $("#shop_hp2").focus();
        });
		
		$("#shop_hp2").keyup(function(){

            if($(this).val().length==3)
                $("#shop_hp3").focus();
        });
		
		$("#s_phone1").keyup(function(){

            if($(this).val().length==3)
                $("#s_phone2").focus();
        });
		
		$("#s_phone2").keyup(function(){

            if($(this).val().length==4)
                $("#s_phone3").focus();
        });
		
		// 사업자번호 중복체크
		$("#bnchk").click(function () {
		    var s_id1 = $("#s_number1").val();
		    var s_id2 = $("#s_number2").val();
		    var s_id3 = $("#s_number3").val();

		    // 숫자 이외의 입력을 제거
		    s_id1 = s_id1.replace(/[^0-9]/g, '');
		    s_id2 = s_id2.replace(/[^0-9]/g, '');
		    s_id3 = s_id3.replace(/[^0-9]/g, '');

		    // 입력 필드에 숫자만 표시
		    $("#s_number1").val(s_id1);
		    $("#s_number2").val(s_id2);
		    $("#s_number3").val(s_id3);

		    if (s_id1.length === 3 && s_id2.length === 2 && s_id3.length === 5) {
		        $.ajax({
		            type: "get",
		            dataType: "json",
		            url: "s_idsearch.jsp",
		            data: { "s_id1": s_id1, "s_id2": s_id2, "s_id3": s_id3 },
		            success: function (data) {
		                if (data.check == 1) {
		                    $("#idprint").text("이미 사용중인 아이디입니다");
		                    $("#idprint").css("color", "red");
		                    $("#s_number1").val("");
		                    $("#s_number2").val("");
		                    $("#s_number3").val("");
		                    $("#s_number1").focus();
		                } else {
		                    $("#idprint").text("사용 가능한 아이디입니다");
		                    $("#idprint").css("color", "green");
		                }
		            }
		        });
		    }
		    else {
		        $("#idprint").text("번호를 확인해주세요");
		        $("#idprint").css("color", "red");
		        $("#s_number1").val("");
                $("#s_number2").val("");
                $("#s_number3").val("");
                $("#s_number1").focus();
		    }
		});
		
		$("#spchk").click(function(){
			
			var s_pass1=$("#s_pass1").val();
			var s_pass2=$("#s_pass2").val();
			
			/* ^: 입력 문자열의 시작을 나타냅니다.
			(?=.*[a-zA-Z]): 적어도 하나의 영문 대소문자 알파벳이 포함되어야 함을 나타냅니다.
			(?=.*\d): 적어도 하나의 숫자가 포함되어야 함을 나타냅니다.
			.{4,16}: 비밀번호는 최소 4자에서 16자 사이의 길이여야 함을 나타냅니다.
			$: 입력 문자열의 끝을 나타냅니다.
			/: 패턴의 시작과 끝 표시
			\d는 다음과 같은 패턴과 일치합니다:

			0, 1, 2, 3, 4, 5, 6, 7, 8, 9와 같은 숫자 문자.
			문자열 내에 숫자가 포함되어 있는지 확인하는 데 사용됩니다. */
			
			var passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d).{4,16}$/;
			
			if(s_pass1!=s_pass2)
			{
				$("#passprint").text("비밀번호가 다릅니다");
				$("#passprint").css("color","red");
			}
			else if(!passwordRegex.test(s_pass1))
			{
				$("#passprint").text("비밀번호는 영문 대소문자 및 숫자를 포함하여 4자~16자로 입력해주세요");
				$("#passprint").css("color","red");
			}
			else if(s_pass1==s_pass2 && s_pass2.length!=0)
			{
				$("#passprint").text("비밀번호가 일치합니다");
				$("#passprint").css("color","green");
			}
		});
	});
	
	function checkpass(v)
	{
			/* ^: 입력 문자열의 시작을 나타냅니다.
			(?=.*[a-zA-Z]): 적어도 하나의 영문 대소문자 알파벳이 포함되어야 함을 나타냅니다.
			(?=.*\d): 적어도 하나의 숫자가 포함되어야 함을 나타냅니다.
			.{4,16}: 비밀번호는 최소 4자에서 16자 사이의 길이여야 함을 나타냅니다.
			$: 입력 문자열의 끝을 나타냅니다.
			/: 패턴의 시작과 끝 표시
			\d는 다음과 같은 패턴과 일치합니다:

			0, 1, 2, 3, 4, 5, 6, 7, 8, 9와 같은 숫자 문자.
			문자열 내에 숫자가 포함되어 있는지 확인하는 데 사용됩니다. */
			
			var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*\d).{4,16}$/;
			
			if(v.s_pass.value != v.s_pass1.value)
			{
				alert("비밀번호를 확인해주세요");
				v.s_pass.value="";
				v.s_pass1.value="";
				v.s_pass.focus();
				return false;
				/* $("#passprint").text("비밀번호가 다릅니다");
				$("#passprint").css("color","red"); */
			}
			else if(!passwordRegex.test(v.s_pass.value))
			{
				alert("비밀번호는 영문 대소문자/숫자/특수문자(!@#$%^*+=-)를 포함하여 4자~16자로 입력해주세요");
				v.s_pass.value="";
				v.s_pass1.value="";
				v.s_pass.focus();
				return false;
			}
	}
</script>
</head>
<body>
	<div>
		<form action="shopRProc.jsp" method="post" enctype="multipart/form-data" onsubmit="return checkpass(this)">
			<table class="table table-bordered form-group" style="width: 1000px;">
				<caption align="top"><b>상가 회원가입</b></caption>
				<tr valign="middle">
					<td style="width: 250px;">휴게소선택<span style="margin-left: 10px; color: #FF3333">*</span></td>
					<td>
						<select id="expressName" name="b_id">
							<option value="덕평자연휴게소">덕평자연휴게소</option>
							<option value="서울만남의광장휴게소">서울만남의광장휴게소</option>
							<option value="천안휴게소">천안휴게소</option>
						</select>
					</td>
				</tr>
				<tr valign="middle">
					<td style="width: 250px;">매장 사업자번호(상가 아이디)<span style="margin-left: 10px; color: #FF3333">*</span></td>
					<td class="form-group" style="width: 750px;">
						<input type="text" style="width: 70px;"
						required="required" maxlength="3" class="s_number1" id="s_number1" name="s_id1">
						-
						<input type="text" style="width: 60px;"
						required="required" maxlength="2" class="s_number2" id="s_number2" name="s_id2">
						-
						<input type="text" style="width: 80px;"
						required="required" maxlength="5" class="s_number3" id="s_number3" name="s_id3">
						
						<button style="margin-left: 10px; border: 1px solid gray; border-radius: 5px;" id="bnchk">사업자 번호 확인</button>
						<span style="color: #999999;"><h6>(사업자번호 10자리)</h6></span>
						<span id="idprint"></span>
					</td>
				</tr>
				<tr valign="middle">
					<td style="width: 250px;">비밀번호<span style="margin-left: 10px; color: #FF3333">*</span></td>
					<td class="form-group">
						<input type="password" style="width: 200px;" min="4" maxlength="16" required="required" name="s_pass">
						<span style="color: #999999;"><h6>(영문 대소문자/숫자 4자~16자)</h6></span>
					</td>
				</tr>
				<tr valign="middle">
					<td style="width: 250px;">비밀번호 확인<span style="margin-left: 10px; color: #FF3333">*</span></td>
					<td>
						<input type="password" style="width: 200px;" min="4" maxlength="16" required="required" name="s_pass1">
					</td>
				</tr>
				<tr valign="middle">
					<td style="width: 250px;">이름<span style="margin-left: 10px; color: #FF3333">*</span></td>
					<td>
						<input type="text" style="width: 200px;" min="4" maxlength="16" required="required" name="s_name">
					</td>
				</tr>
				<tr valign="middle">
					<td style="width: 250px;">상호명<span style="margin-left: 10px; color: #FF3333">*</span></td>
					<td class="form-group">
						<span id="expressName2">덕평자연휴게소</span>
						<input type="hidden" id="expressName3" name="shop_name1" value="덕평자연휴게소">
						<input type="text" style="width: 200px;" name="shop_name2">
					</td>
				</tr>
				<tr valign="middle">
					<td style="width: 250px;">휴게소 상호 번호<span style="margin-left: 10px; color: #FF3333">*</span></td>
					<td>
						<select name="shop_addr">
							<option value="1번 매장">1번 매장</option>
							<option value="2번 매장">2번 매장</option>
							<option value="3번 매장">3번 매장</option>
							<option value="4번 매장">4번 매장</option>
							<option value="5번 매장">5번 매장</option>
							<option value="6번 매장">6번 매장</option>
						</select>
					</td>
				</tr>
				<tr valign="middle">
					<td style="width: 250px;">일반전화<span style="margin-left: 10px; color: #FF3333">*</span></td>
					<td>
						<input type="text" style="width: 100px;" maxlength="3" required="required" name="shop_hp1" id="shop_hp1">
						-
						<input type="text" style="width: 100px;" maxlength="3" required="required" name="shop_hp2" id="shop_hp2">
						-
						<input type="text" style="width: 100px;" maxlength="4" required="required" name="shop_hp3" id="shop_hp3">
					</td>
				</tr>
				<tr valign="middle">
					<td style="width: 250px;">휴대전화<span style="margin-left: 10px; color: #FF3333">*</span></td>
					<td>
						<input type="text" style="width: 100px;" maxlength="3" required="required" name="s_phone1" id="s_phone1">
						-
						<input type="text" style="width: 100px;" maxlength="4" required="required" name="s_phone2" id="s_phone2">
						-
						<input type="text" style="width: 100px;" maxlength="4" required="required" name="s_phone3" id="s_phone3">
					</td>
				</tr>
				<tr>
					<td style="width: 250px;">가게 로고<span style="margin-left: 10px; color: #FF3333">*</span></td>
					<td>
						<input type="file" required="required" name="s_image">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-warning" id="btnSRegi">회원가입</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>