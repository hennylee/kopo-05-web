<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	msg : <%= msg %><br>
	request 공유영역 id : ${id }<br>
	request 공유영역 phone : ${phone }<br>
	
	<h2>인클루드 전</h2>

	<h4>파라미터 미설정</h4>
	<jsp:include page="one.jsp"/>
		
	<h4>파라미터 설정</h4>
	<jsp:include page="one.jsp">
		<jsp:param name="name" value="hong gil-dong"/>
		<jsp:param name="age" value="33"/>
	</jsp:include>

	<h2>인클루드 후</h2>
	
	request 공유영역 id : ${id }<br>
	request 공유영역 phone : ${phone }<br>
</body>
</html>