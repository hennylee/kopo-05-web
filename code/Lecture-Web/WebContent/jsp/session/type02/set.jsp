<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");

	// Member 객체 생성
	MemberVO vo = new MemberVO();
	vo.setId(id);
	vo.setPassword(password);
	
	// 세션 등록
	session.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션 설정을 완료</h2>
	<a href="get.jsp">설정된 세션 정보 조회</a>
</body>
</html>