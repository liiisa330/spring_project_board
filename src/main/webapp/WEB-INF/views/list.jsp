<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트</title>
<link rel="stylesheet" type="text/css" href="/res/css/boardStyle.css">
</head>
<body>
   <h4 style="padding-top: 100px; text-align: center;">게시글</h4>
   <table style="margin:0 auto; width: 90%;" class="borderWhite">
   <tr> <td style="text-align: left" class="borderWhite">
	      전체게시글 수: ${pvo.allCnt}
	    </td>
	     <td style="text-align: right" class="borderWhite">
	    <input type="button" value="글쓰기" onclick="location.href='writeForm'" >
	    </td>
   </tr>
    </table>
   <c:choose>
    <c:when test="${fn:length(articles)==0}">
    	<table style="margin:0 auto; width: 900px;" border="1">
    	  <tr> 
    	     <th style="text-align: center;">게시글이 없습니다.</th>
    	  </tr>
    	</table>
    </c:when>
    <c:when test="${fn:length(articles)>0}">
	<table style="margin:0 auto; width: 90%;" border="1">
	     <thead>
			<tr>
				<th style="width: 5%">번호</th><!-- 추가 -->
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>접속아이피</th>
			</tr>
	    </thead>
	    <tbody>
		<c:forEach var="article" items="${articles}">
		  <tr>
		    <td style="width: 5%; text-align: center">${article.no}</td> <!-- 추가 -->
		    <td>
		      <c:choose>
		       <c:when test="${article.lev==0}">
		          <img src="/res/images/level.gif" width="5px">
		       </c:when>      
		       <c:when test="${article.lev>0}">
		          <img src="/res/images/level.gif" width="${article.lev*5}px" height="5px">
		          <img src="/res/images/re.gif">
		       </c:when>
		      </c:choose> 
		         <a href="content?num=${article.num}&curPage=${pvo.curPage}">${article.subject}</a>
		      <c:if test="${article.readcount>=10}">
		          <img src="/res/images/hot.gif">
		      </c:if>
		    </td>
		    <td class="textCenter"><a href="mailto:${article.email}">${article.writer}</a></td>
		    <td class="textCenter">${article.reg_date}</td>
		    <td class="textCenter">${article.readcount}</td>
		    <td class="textCenter">${article.ip}</td>
		  </tr>
		</c:forEach>
	    </tbody>
	 </table>
	 <p><p>
	 <table style="margin:0 auto; text-align:center; width: 90%;" class="borderWhite">
	       <tr> 
	          <td style="text-align:center" class="borderWhite">
	              <c:forEach var="p" begin="${1}" end="${pvo.pageCnt}">  
	                 <a href="list?curPage=${p}">${p}</a>&nbsp;&nbsp;
	              </c:forEach>
	          </td>
	       </tr>
	 </table>
    </c:when>
   </c:choose>
</body>
</html>