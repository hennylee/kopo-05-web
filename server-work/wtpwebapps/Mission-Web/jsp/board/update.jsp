<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 1. 게시물 번호 추출
	int boardNo = Integer.parseInt(request.getParameter("no"));

	BoardDAO dao = new BoardDAO();
	
	// 2. db 결과 받아오기
	BoardVO board = dao.selectOne(boardNo);
	
	// 3. 변수 공유영역에 올리기
	pageContext.setAttribute("board", board);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css"/>
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css"/>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	
	<section>
		<div align="center">
		<hr width="100%">
		<h2>게시판 상세</h2>
		<hr width="100%">
		
		<form action="/Mission-Web/jsp/board/updateProcess.jsp" method="post">
		<table style="width:100%;">
			<tr>
				<th width="25%">번호</th>
				<td><c:out value="${ board.no }"/>
					<input type="hidden" value="${ board.no }" name="no">
				</td>
			</tr>
			<tr>
				<th width="25%">제목</th>
				<td>
					<input type="text" value="${ board.title }" name="title">
				</td>
			</tr>
			<tr>
				<th width="25%">작성자</th>
				<td><c:out value="${ board.writer }"/>
					<input type="hidden" value="${ board.writer }" name="writer">
				</td>
			</tr>
			<tr>
				<th width="25%">내용</th>
				<td>
					<input type="text" value="${ board.content }" name="content">
				</td>
			</tr>
			<tr>
				<th width="25%">조회수</th>
				<td><c:out value="${ board.viewCnt }"/>
					<input type="hidden" value="${ board.viewCnt }" name="viewCnt">
				</td>
			</tr>
			<tr>
				<th width="25%">등록일</th>
				<td><c:out value="${ board.regDate }"/>
					<input type="hidden" value="${ board.regDate }" name="regDate">
				</td>
			</tr>
		</table>
		
		<br>
		<input type="submit" value="완료"> 
		</form>
		
		<button onclick="location.href='list.jsp'">목록</button>
		
	</div>
	</section>
	
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>
</body>
</html>

