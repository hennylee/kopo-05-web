<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	value 속성만 지정한 경우 : <c:out value="hello world"/><br>
	msg 변수 미지정 : <c:out value="${ msg }"/><br>
	value 속성 지정 : <c:out value="${ msg }" default="msg를 찾을 수 없습니다."/><br>
	
	<h2>value 속성에 태그가 들어있는 경우</h2>
	 escapeXml = true : <c:out value="<strike>Hello</strike>"/><br>
	
	escapeXml = false : <c:out value="<strike>Hello</strike>" escapeXml="false"/><br>
</body>
</html>