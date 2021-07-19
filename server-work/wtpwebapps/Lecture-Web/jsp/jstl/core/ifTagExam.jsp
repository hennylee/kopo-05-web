<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	ifTagExam.jsp?type=U 	=>	 "일반사용자님 환영합니다."
	ifTagExam.jsp?type=S 	=> 	 "관리자님 환영합니다."
 --%>
 	<c:if test="${ param.type == 'S' }">
 		<h2>관리자님 환영합니다</h2>
 	</c:if>
 	<c:if test="${ param.type eq 'U' }">
 		<h2>일반회원님 환영합니다</h2>
 	</c:if>
</body>
</html>