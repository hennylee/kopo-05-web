<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% 
	String[] names = {"홍길동", "유관순", "박문수"};
	pageContext.setAttribute("names", names);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	"Hello World" 문자열 길이 : ${fn:length("Hello World") }<br>
	배열의 요소개수 : ${ fn:length(names) }<br>
	
	<c:forEach begin="0" end="${fn:length(names) - 1 }" var= "i">
		<c:if test="${i ne 0 }">
		,
		</c:if>
		${ names[i] }
	</c:forEach>
</body>
</html>