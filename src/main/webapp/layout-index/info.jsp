<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
   href="https://fonts.googleapis.com/css2?family=Dongle:wght@300;400;700&family=Gaegu:wght@300&family=Noto+Serif+KR:wght@200&family=Single+Day&display=swap"
   rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
#mouse div{
   width: 30px;
   height: 60px;
   border: 3px solid #fff;
   border-radius: 10px 10px 15px 15px;
   margin: 5vw auto 1vw;
   position: relative;
   margin: auto;
}

#mouse div span{
   width: 6px;
   height: 6px;
   border-radius: 50%;
   background-color: #fff;
   position: absolute;
   
   top: 10px;
   left: 10px;
   text-indent: -9999px;
   animation: wheel 1s ease-out infinite;
}
@keyframes wheel{
   0%{
      top:10px;
      opacity: 1;
   }
   100%{
      top:30px;
      opacity:0;
   }
}
</style>
</head>
<body>
<div id="mouse">
      <div><span>wheel</span></div>
   </div>
</body>
</html>