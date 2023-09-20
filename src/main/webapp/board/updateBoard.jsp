<%@page import="data.dto.BoardDto"%>
<%@page import="data.dao.BoardDao"%>
<%@page import="data.dto.ExpressDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<%
	//프로젝트의 경로
	String root=request.getContextPath();
	String writer=(String)session.getAttribute("id");
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	BoardDao dao=new BoardDao();
	BoardDto dto=dao.getData(num);
%>
<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="<%=root%>/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript" src="<%=root%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>	
</head>
<body>
<div>
<form action="board/updateProc.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="currentPage" value="<%=currentPage%>">
	<table class="table table-bordered" style="width: 100%;">
		<caption align="top" style="font-size: 3vh;">수정</caption>
		<tr>
			<th bgcolor="#669966" style="font-size: 2.25vh; width: 12.5vh;">작성자</th>
			<td>
				<span style="font-size: 2.25vh;"><%=writer %></span>
				<input type="hidden" name="writer" value="<%=writer%>">
			</td>
		</tr>
		<tr>
			<th bgcolor="#99CC99" style="font-size: 2.25vh; width: 12.5vh;">제  목</th>
			<td class="form-group">
				<select	name="express" style="font-size: 2.25vh; width: 17vh;">
					<option value="덕평자연휴게소" <%=dto.getExpress().equals("덕평자연휴게소")?"selected":"" %>>덕평자연휴게소</option>
					<option value="부산휴게소" <%=dto.getExpress().equals("부산휴게소")?"selected":"" %>>부산휴게소</option>
					<option value="대전휴게소" <%=dto.getExpress().equals("대전휴게소")?"selected":"" %>>대전휴게소</option>
					<option value="수원휴게소" <%=dto.getExpress().equals("수원휴게소")?"selected":"" %>>수원휴게소</option>
					<option value="용인휴게소" <%=dto.getExpress().equals("용인휴게소")?"selected":"" %>>용인휴게소</option>
				</select>
				<input type="text" name="title" required="required" style="width: 62.5vh;" value="<%=dto.getTitle() %>">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name="content" id="content"		
					required="required"			
					style="width: 100%; display: none;"><%=dto.getContent() %></textarea>		
			
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-warning"
					style="width: 15vh; font-size: 2vh;"
					onclick="submitContents(this)">수정하기</button>
				
				<button type="button" class="btn btn-warning"
					style="width: 15vh; font-size: 2vh;"
					onclick="location.href='subPage.jsp?main=board/freeBoard.jsp'">취소</button>
			</td>
		</tr>
		
	</table>   
</form>
</div>
<!-- 스마트게시판에 대한 스크립트 코드 넣기 -->
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "content",

    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }

}

// textArea에 이미지 첨부

function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/save/'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 

}
</script>

</body>
</html>