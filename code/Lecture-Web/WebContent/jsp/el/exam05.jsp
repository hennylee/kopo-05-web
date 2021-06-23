<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, String> board = new HashMap<>();
	board.put("no", "1");
	board.put("title", "test");

	pageContext.setAttribute("boardVO", board);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	no : <%= board.get("no") %><br>
	title : <%= board.get("title") %><br>
	
	<!-- EL 표현법 -->
	el boardVO : ${ boardVO }<br>
	el no : ${ boardVO.no }<br>
	el title : ${ boardVO.title }<br>
	el title : ${ boardVO['title'] }<br>
	
	<!-- aaa라는 멤버변수가 없지만 에러 발생시키지 않고, empty를 출력 -->
	el aaa : ${ boardVO.aaa }<br>
	
</body>
</html>