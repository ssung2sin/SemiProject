<%@page import="java.util.ArrayList"%>
<%@page import="data.dto.ExpressDto"%>
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
<style type="text/css">
   a.title{
      text-decoration: none;
      color: black;
   }
   a.notetitle{
      text-decoration: none;
      color: red;
   }
   
   .pop span{
      font-weight: bold;
      color: blue;
   }
</style>
<script type="text/javascript">
   $(function(){
      
      $("a.title").click(function(){
         
         var num=$(this).attr("num");
         
         $.ajax({
            
            type:"post",
            dataType:"json",
            url:"board/viewProc.jsp",
            data:{"num":num},
            success:function(data){
               
            }
         });
      });
      
      $("select.listcnt").change(function(){
         
         var cnt=$(this).val();
         
         cnt.prop("selected",true);
      });
   });
</script>
</head>
<%
   String root = request.getContextPath();
   BoardDao dao=new BoardDao();

   int totalCount=dao.getTotalCount(); 
   int totalPage; 
   int startPage; 
   int endPage; 
   int startNum; 
   int perPage=10; 
   int perBlock=5;
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
   
   System.out.println("endPage="+endPage);
   System.out.println("totalPage="+totalPage);
   System.out.println("totalCount="+totalCount);

   startNum=(currentPage-1)*perPage;
   
   no=totalCount-(currentPage-1)*perPage;
   
   List<BoardDto> list=dao.getPagingList(startNum, perPage);
   List<BoardDto> noList=dao.getnoteList();
%>
<body>
<div>
   <h3>자유게시판</h3>
   <div style="float: left;">
      <button type="button" style="float: right;" onclick="location.href='subPage.jsp?main=board/popBoard.jsp'">인기글</button>
      <button type="button" style="float: right;" onclick="location.href='subPage.jsp?main=board/freeBoard.jsp'">전체글</button>
   </div>
   <div style="float: right;">
      <select name="listcnt" style="margin-right: 10px;" class="listcnt">
         <option value="5">5개</option>
         <option value="10" selected>10개</option>
         <option value="20">20개</option>
      </select>
      <button type="button" style="float: right;" onclick="location.href='subPage.jsp?main=board/insertFree.jsp'">작성하기</button>
   </div>
   <table class="table table-striped" style="width: 1000px;">
      <tr align="center">
         <th style="width: 80px; background-color: #;">
         <span style="float: left; margin-left: 50px;">번호</span>
         <span style="float: left; margin-left: 200px;">제목</span>
         
         
         <span style="float: right; margin-right: 50px;">추천</span>
         <span style="float: right; margin-right: 40px;">조회</span>
         <span style="float: right; margin-right: 90px;">작성일</span>
         <span style="float: right; margin-right: 108px;">작성자</span>
         </th>
      </tr>
      
      <%
         
         
         SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
         
         if(list.size()==0&&noList.size()==0)
         {
            %>
            <tr>
               <td>
                  <h5 align="center">게시물이 없습니다</h5>
               </td>
            </tr>
         <%}
         else
         {   
            for(BoardDto dto:noList)
            {   
               int note=dto.getNote();
               
               if(note==1)
               {%>
               
               <tr>
                  <td style="color: red;">
                     <b>
                     <span style="float: left; margin-left: 45px;">[공지]</span>
                     
                     <a href="<%=root%>/subPage.jsp?main=board/detail.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage %>" class="notetitle" num="<%=dto.getNum()%>">
                     <span style="float: left; margin-left: 40px;">[<%=dto.getExpress() %>]</span>
                     <span style="float: left; margin-left: 10px;"><%=dto.getTitle() %></span>
                     </a>
            
                     <span style="float: right; margin-right: 60px;">-</span>
                     <span style="float: right; margin-right: 60px;"><%=dto.getView() %></span>
                     <span style="float: right; margin-right: 75px;"><%=sdf.format(dto.getWriteday()) %></span>
                     <span style="float: right; margin-right: 75px;">관리자</span>
                     </b>
                  </td>
               </tr>
               <%
               }
            }
            
            for(BoardDto dto:list)
            {
               int note=dto.getNote();
               
               if(note==0)
               {
                  int likes=dto.getLikes();
                  int unlikes=dto.getUnlikes();
                  
                  int pop=(likes-unlikes);
                  System.out.println("pop="+pop);
               %>
               <tr class="<%=pop>=10?"pop":""%>">
                  <td>
                     <span style="float: left; margin-left: 60px;"><%=no--%></span>
                     
                     <a href="<%=root%>/subPage.jsp?main=board/detail.jsp?num=<%=dto.getNum()%>" class="title" num="<%=dto.getNum()%>">
                     <span style="float: left; margin-left: 60px;">
                        <%=pop>=10?"<img src='image/star.png' style='width: 20px;'>":""%>
                        [<%=dto.getExpress() %>]
                     </span>
                     <span style="float: left; margin-left: 10px;"><%=dto.getTitle() %></span>
                     </a>
            
                     <span style="float: right; margin-right: 58px;"><%=dto.getLikes() %></span>
                     <input type="hidden" class="pop" value="<%=pop%>">
                     <span style="float: right; margin-right: 60px;"><%=dto.getView() %></span>
                     <span style="float: right; margin-right: 80px;"><%=sdf.format(dto.getWriteday()) %></span>
                     <span style="float: right; margin-right: 65px;"><%=dto.getWriter() %></span>
                  </td>
               </tr>
               <%}
            }
         }
      %>
   </table>
   
       <%-- 페이지번호 출력 --%>
      <div>
         <ul class="pagination justify-content-center">
            <%
               //이전버튼
               if(startPage>1)
               {%>
                  <li class="page-item">
                        <a class="page-link" href="<%=root %>/subPage.jsp?main=board/freeBoard.jsp&currentPage=<%=startPage-1 %>" tabindex="-1" aria-disabled="true"><</a>
                     </li>
               <%}
            
               for(int pp=startPage;pp<=endPage;pp++)
               {
                  //현재페이지에 css추가를 위한 조건
                  if(pp==currentPage)
                  {%>
                     <li class="page-item active">
                        <a class="page-link" href="<%=root %>/subPage.jsp?main=board/freeBoard.jsp&currentPage=<%=pp%>"><%=pp %></a>
                     </li>
                  <%}
                  else //선택 안한 페이지는 색이 다른 색이기 때문에 똑같이 적어도 괜찮다
                  {%>
                     <li class="page-item">
                        <a class="page-link" href="<%=root %>/subPage.jsp?main=board/freeBoard.jsp&currentPage=<%=pp%>"><%=pp %></a>
                     </li>
                  <%}
               }
               
               //다음버튼
               if(endPage<totalPage)
               {%>
                  <li class="page-item">
                       <a class="page-link" href="<%=root %>/subPage.jsp?main=board/freeBoard.jsp&currentPage=<%=endPage+1%>">></a>
                   </li>
               <%}
            %>
         </ul>
      </div>
</div>
</body>
</html>