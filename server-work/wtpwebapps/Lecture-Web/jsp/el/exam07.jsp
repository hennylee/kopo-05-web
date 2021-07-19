<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> names = new ArrayList<String>();
	names.add("홍길동");
	names.add("강길동");
	names.add("고길동");
	
	pageContext.setAttribute("names", names);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 표현식 </h2>
	첫번째 이름 : <%= names.get(0) %><br>
	두번째 이름 : <%= names.get(1) %><br>
	세번째 이름 : <%= names.get(2) %><br>
	<%-- 네번째 이름 : <%= names.get(3) %><br> --%> <!-- IndexOutOfBoundsException -->
	
	<h2> EL </h2>
	names : ${names }<br>
	첫번째 이름 : ${names[0] }<br>
	두번째 이름 : ${names[1] }<br>
	세번째 이름 : ${names[2] }<br>
	네번째 이름 : ${names[3] }<br> <!-- empty로 출력 -->
</body>
</html>