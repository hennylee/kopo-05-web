<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 명시적 형변환 필수! */
	String id = (String)session.getAttribute("id");
	String password = (String) session.getAttribute("password");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>표현식</h2>
	설정된 세션 ID : <%= id %><br>
	설정된 세션 PWD : <%= password %><br>
	
	<hr>
	<h2>EL</h2>
	
	설정된 세션 ID : ${ sessionScope.id }<br>
	설정된 세션 PWD :  ${ sessionScope.password }<br>
	<br>
	
	<a href="remove.jsp">세션 삭제</a>
</body>
</html>