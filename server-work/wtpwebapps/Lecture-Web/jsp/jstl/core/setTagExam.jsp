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
	<h2>1값을 가지는 변수 cnt를 공유영역에 등록</h2>
	
	<c:set var="cnt" value="1" />
	
	<h4>page 영역에 cnt 변수 등록 후, 1 더하기</h4>
	cnt   : ${ cnt }<br>
	cnt+1 : ${ cnt + 1 }<br>
	
	<h4>request 영역에 cnt에 1을 더한 변수 등록</h4>
	<c:set var="cnt" value="${ cnt + 1 }" scope = "request"/>
	page cnt 	: ${ cnt }<br>
	request cnt : ${ requestScope.cnt }<br>
	
	<h2>request 공유 영역에 등록된 변수 cnt 삭제</h2>
	<c:remove var="cnt" scope="request"/>
	<h4>삭제 후, page 영역과 request 영역의 cnt 출력</h4>
	page cnt : ${ cnt } <br>
	request cnt : ${ request.cnt } <br>
	
	<h4>scope 지정하지 않고 삭제 </h4>
	<c:remove var="cnt"/>
	page cnt : ${ cnt } <br>
	request cnt : ${ request.cnt } <br>
</body>
</html>


<%-- 
		JSP 공유영역 		EL 공유영역 			JSTL 공유영역
		|--------------|-------------------|-----------|
		pageContext		pageScope			page
		request			requestScope		request
		session			sessionScope		session	
		application		applicationScope	application

--%>