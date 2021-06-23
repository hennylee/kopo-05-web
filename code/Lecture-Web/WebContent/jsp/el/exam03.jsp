<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("id", "hong");
	request.setAttribute("msg", "request 영역에 객체 등록");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		객체 등록 : 공유영역명.setAttribute(이름, 값)
		jsp 공유영역 4가지 : pageContext, request, session, application
		el 공유영역 4가지 : pageScope, requestScope, sessionScope, applicationScope
	 --%>
	<h2>1. el 공유영역에서 객체 등록, 조회, 삭제하기</h2>
	
	<h4>1-1. request 영역에 msg 등록 후</h4>
	msg : ${msg }<br>
	empty msg : ${empty msg }<br>
	
	<h4>1-2. pageContext 영역에 msg 등록 후</h4>
	<%
		pageContext.setAttribute("msg", "pageContext 영역에 msg 등록");
		String message = (String) pageContext.getAttribute("msg");
	%>
	empty msg : ${empty msg }<br>
	msg : <%= message %><br>
	el msg : ${ msg } <br>
	el request.msg : ${requestScope.msg }<br>
	el id : ${id }<br>
</body>
</html>