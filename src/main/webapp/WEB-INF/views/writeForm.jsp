<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script  src="/res/jquery/jquery-3.6.0.js"></script>
<script  src="/res/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/res/js/boardScript.js"></script>
<link rel="stylesheet" type="text/css" href="/res/css/boardStyle.css"/>
<title>글쓰기</title>
</head>
<body>
   <form action="writePro" method="post" name="boardForm">
   <table border="1">
      <thead><tr><th colspan="2"> 글쓰기</th></tr></thead>
      <tbody> 
          <c:if test="${article!=null and article.num!=0 and article.ref!=0}">
	          <tr><th style="width: 30%">글제목</th>
	              <td><input name="subject" placeholder="제목을 입력하세요" required="required" 
	                   size="50" value="[답글]" title="제목" class="chk">
		             <input type="hidden" name="num" value="${article.num}">
			         <input type="hidden" name="ref" value="${article.ref}">
			         <input type="hidden" name="step" value="${article.step}">
			         <input type="hidden" name="lev" value="${article.lev}">
			         <input type="hidden" name ="curPage" value="${pvo.curPage}">
	              </td>
	          </tr>
          </c:if>
          <c:if test="${article==null or article.num==0}">
	          <tr><th style="width: 30%">글제목</th>
	              <td><input name="subject" placeholder="제목을 입력하세요" required="required" 
	                   size="50" title="제목" class="chk"></td>
	          </tr>
          </c:if>
         <tr><th style="width: 30%">글쓴이</th>
             <td><input name="writer" placeholder="이름을 입력하세요" required="required" size="50"
                  title="글쓴이" class="chk"></td>
         </tr>
         <tr><th style="width: 30%">글내용</th>
             <td><textarea rows="15" cols="50" required="required" name="content" 
                 placeholder="내용을 입력해주세요. 욕설금지!!!" title="내용" class="chk"></textarea></td>
         </tr>
         <tr><th style="width: 30%">이메일</th>
             <td><input size="50" type="email" required="required" name="email"
                  placeholder="이메일 주소 입력해주세요" title="이메일" class="chk"></td>
         </tr>
         <tr><th style="width: 30%">비밀번호</th>
             <td><input size="50" type="password" required="required" name="passwd" 
                   placeholder="비밀번호 입력해주세요" title="비밀번호" class="chk"></td>
         </tr>
    </tbody>
    <tfoot>
		   <tr> <td colspan="2" style="text-align: center"> 
		         <input type="button" value="글저장" id="submit1">
		         <input type="button" value="글목록" onclick="javascript:location.href='list?curPage=${pvo.curPage}'">
		        </td>
		   </tr>
		 <tfoot>
   </table>
   </form>
</body>
</html>