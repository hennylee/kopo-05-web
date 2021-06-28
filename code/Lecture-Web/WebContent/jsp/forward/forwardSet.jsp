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
	<h2>결과화면</h2>
	<c:if test="${ param.id eq 'admin' }">
		<jsp:forward page="admin.jsp">
			<jsp:param name="id" value="${ param.id }"/>
		</jsp:forward>
	</c:if>
	<c:if test="${ param.id ne 'admin' }">
		<%-- <c:set var="id" value="${ param.id }" scope="request"/> --%> 
		<%-- request는 공유되기 때문에 굳이 변수 선언을 안해줘도 된다. --%>
		<jsp:forward page="user.jsp"/>
	</c:if>
</body>
</html>