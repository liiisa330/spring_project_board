<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지페이지</title>
</head>
<body>
    <c:if test="${msg!=null}">
      <script type="text/javascript">
        var msg = '${msg}';
         alert("처리결과 : "+msg);
      </script>
    </c:if>
    <script type="text/javascript">
        var url ='${url}';
        if(url.length==0 || url==null || url=='') 
        	url='list';
        document.location.href=url;
    </script>
</body>
</html>