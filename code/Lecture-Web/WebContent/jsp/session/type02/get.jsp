<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	 MemberVO vo = (MemberVO) session.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>표현식</h2>
	
	<%
		if(vo != null) {
	%>
		설정된 세션 ID : <%= vo.getId() %><br>
		설정된 세션 PWD : <%= vo.getPassword() %> <br>
	<%
		} else {
	%>
		설정된 세션 정보가 없습니다.<br>
	<%
		}
	%>
	<hr>
	<h2>EL</h2>
	
	<c:choose>
		<c:when test="${ not empty sessionScope.vo }">
			설정된 세션 ID : ${ sessionScope.vo.id }<br>
			설정된 세션 PWD : ${ sessionScope.vo.password } <br>
		</c:when>
		<c:otherwise>
			설정된 세션 정보가 없습니다.<br>
		</c:otherwise>
		
	</c:choose>
	<br>
	
	<a href="remove.jsp">세션 삭제</a>
</body>
</html>