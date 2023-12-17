<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
  * { margin: auto  }
   table{ text-align: center; 
      width: 600px;
      border:1px solid gray;
   }
   td{padding:5px; 
      text-align: left;}
  th{ padding: 1em;
   }   
</style>
<script  src="/res/jquery/jquery-3.6.0.js"></script>
<script  src="/res/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/res/js/boardScript.js"></script>
<title>글수정</title>
</head>
<body>
   <form action="updatePro" method="post" name="boardForm">
  	 <table border="1">
      <thead><tr><th colspan="2"> 글수정</th></tr></thead>
      <tbody> 
	     <tr><th style="width: 30%">글제목</th>
	        <td><input name="subject" required="required" size="50" value="${article.subject}">
	            <input type="hidden" name="num" value="${article.num}">
			        <input type="hidden" name ="curPage" value="${pvo.curPage}">
	        </td>
	      </tr>
         <tr><th style="width: 30%">글쓴이</th>
             <td><input name="writer" required="required" size="50" value="${article.writer}"></td>
         </tr>
         <tr><th style="width: 30%">글내용</th>
             <td><textarea rows="15" cols="50" required="required" name="content">${article.content}</textarea></td>
         </tr>
         <tr><th style="width: 30%">이메일</th>
             <td><input size="50" type="email" required="required" name="email" value="${article.email}"></td>
         </tr>
         <tr><th style="width: 30%">비밀번호</th>
             <td><input size="50" type="password" required="required" name="passwd" value="${article.passwd}" ></td>
         </tr>
    </tbody>
    <tfoot>
		   <tr> <td colspan="2" style="text-align: center"> 
		         <input type="button" value="글수정" id="submit1">
		         <input type="button" value="글목록" onclick="javascript:location.href='list?curPage=${pvo.curPage}'">
		        </td>
		   </tr>
		 <tfoot>
   </table>
   </form>
</body>
</html>