<%@page import="java.util.List"%>
<%@page import="data.dao.MenuDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/goodchoice/Jalnan.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@2.0/nanumsquare.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style type="text/css">
.inputform{
	margin-left: 7vh;
	margin-top: 5vh;
}
th{
	font-family: 'Jalnan';
}
td{
	font-family: 'NanumSquare';
	font-size: 15px;
}

</style>
<title>Insert title here</title>
<%
	String id=(String)session.getAttribute("id");

	ShopDao dao=new ShopDao();
	
	MenuDao mdao=new MenuDao();
	
	
	String name=dao.getName(id);
	System.out.println(id);
	System.out.println(name);

%>
<script type="text/javascript">
	$(function(){
		
		$("#cate").change(function(){
			if($("#cate").val()=="insert"){
				$(".category").val("");
				$(".category").prop("readonly",false)
				
				$(".eng_category").val("");
				$(".eng_category").prop("readonly",false);
			}
			else{
				var category=$("select[name=cate] option:selected").text();
				var eng_category=$(this).val();
				
				$(".category").val(category);
				$(".category").prop("readonly",true);
				
				$(".eng_category").val(eng_category);
				$(".eng_category").prop("readonly",true);
			}
		})
	})
	function check() {	//인증번호가 같으면 submit
		var content=$(".cont").val();
		content=content.replace(/(?:\r\n|\r|\n)/g, '<br>');
		$(".content").val(content);
		
		return true;
	}

</script>
</head>
<body>
<div class="inputform" style="width: 650px;">
		<form action="order/orderAddAction.jsp" method="post" enctype="multipart/form-data" onclick="return check()">
			<input type="hidden" name="s_id" value="<%=id%>">
			<table class="table table-bordered">
				<caption align="top" style="font-family: 'Jalnan';"><b>상품등록</b></caption>
				<tr>
					<th style="width: 170px;" class="table-success">
						<b>카테고리</b></th>
					<td><input type="text"  name="category" placeholder="한글 카테고리명" class="category"
						style="width: 140px; margin-right: 15px;" required="required">
						<input type="text"  name="eng_category" placeholder="영어 카테고리명" class="eng_category"
						style="width: 140px; margin-right: 15px;" required="required">
						<select  name="cate" required="required" id="cate"
						style="width: 120px;">
						<%
							List<String[]>list=mdao.selectCategory(id);
							for(int i=0;i<list.size();i++){
								String cate[]=list.get(i);
							%>
							<option value="<%=cate[1]%>"><%=cate[0] %></option>
							<%
							}
							%>
							<option value="insert" selected>직접입력</option>
						</select>
					</td>
				</tr>
				<tr>
					 <th style="width: 150px;" class="table-success">	
					 	<b>상품명</b>
					 </th>
					 <td>
					 	<input type="text" name="menu" 
					 	required="required" style="width: 200px;"
					 	placeholder="상품명 입력">
					 </td>
				</tr>
				<tr>
					 <th style="width: 150px;" class="table-success">	
					 	<b>상품이미지</b>
					 </th>
					 <td>
					 	<input type="file" name="m_image" 
					 	required="required" style="width: 400px;">
					 </td>
				</tr>
				<tr>
					<th style="width: 150px;" class="table-success">	
					 	<b>상품설명</b>
					 </th>
					<td>
						<textarea class="cont" style="width: 450px;" class="form-control" required="required"
        				placeholder="댓글 입력"></textarea>
        				<input type="hidden" name="content" class="content">
					</td>
				</tr>
				<tr>
					 <th style="width: 150px;" class="table-success">	
					 	<b>상품가격</b>
					 </th>
					 <td>
					 	<input type="text" name="price" required="required" 
					 	style="width: 150px;" placeholder="상품가격 입력">
					 </td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-success"
						style="width: 100px;">상품저장</button>
						<button type="button" class="btn btn-outline-info"
						style="width: 100px;" onclick="location.href='subPage.jsp?main=shop/shopList.jsp'">상품목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>