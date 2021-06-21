<%@page import="java.util.Iterator"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		// Enumeration 은 Iterator와 같음
		// Iterator가 나오기 전에 사용되던 것이 Enumeration이다.
		Enumeration<String> headerNames = request.getHeaderNames();
	
		while(headerNames.hasMoreElements()) {
			String headerName = headerNames.nextElement();
			String headerValue = request.getHeader(headerName);
	%>
			<%= headerName %> : <%=headerValue  %><br>
	<%
		}
	%>
</body>
</html>