<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	http://localhost:9999/Mission-Web/jsp/board/detail.jsp?no=1 
--%>
<%
	// 1. 게시물 번호 추출
	int boardNo = Integer.parseInt(request.getParameter("no"));

	BoardDAO dao = new BoardDAO();
	
	// 2-1. 조회수 증가
	dao.incrementViewCNT(boardNo);
	
	// 2-2. db 결과 받아오기
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
		
		<table style="width:100%;">
			<tr>
				<th width="25%">번호</th>
				<td><c:out value="${ board.no }"/></td>
			</tr>
			<tr>
				<th width="25%">제목</th>
				<td><c:out value="${ board.title }"/></td>
			</tr>
			<tr>
				<th width="25%">작성자</th>
				<td><c:out value="${ board.writer }"/>
				</td>
			</tr>
			<tr>
				<th width="25%">내용</th>
				<td><c:out value="${ board.content }"/></td>
			</tr>
			<tr>
				<th width="25%">조회수</th>
				<td><c:out value="${ board.viewCnt }"/></td>
			</tr>
			<tr>
				<th width="25%">등록일</th>
				<td><c:out value="${ board.regDate }"/></td>
			</tr>
		</table>
		
		<br>
		
		<div class="bottonBtnZone">
			<button onclick="location.href='list.jsp'">목록</button>
			
			<%-- 작성자이면 수정/삭제가 가능해야함 --%>			
			<c:if test="${ board.writer eq sessionScope.userVO.id }">
				<button onclick="location.href='update.jsp?no=${ board.no }'">수정</button>
				<button onclick="location.href='delete.jsp?no=${ board.no }'">삭제</button>
			</c:if>
		</div>
	</div>
	</section>
	
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>
</body>
</html>







