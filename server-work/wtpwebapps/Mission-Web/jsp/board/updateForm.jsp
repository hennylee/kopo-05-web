<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

	// 1. 게시물 번호 추출
	request.setCharacterEncoding("utf-8");
	int boardNo = Integer.parseInt(request.getParameter("no"));

	// 2. db 결과 받아오기
	BoardDAO dao = new BoardDAO();
	BoardVO board = dao.selectByNo(boardNo);
	
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
<script>
	// 작성자와 로그인 id가 다르면?
	
	// 내용이 입력되지 않으면 수정 못하게!
	
	

</script>
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
		
		<form action="/Mission-Web/jsp/board/update.jsp" method="post">
		<table style="width:100%;">
			<tr>
				<th width="25%">번호</th>
				<td>
					<c:out value="${ board.no }"/>
					<%-- <input type="hidden" value="${ board.no }" name="no"> --%>
					<input type="hidden" value="${ param.no }" name="no">
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
				</td>
			</tr>
			<tr>
				<th width="25%">등록일</th>
				<td><c:out value="${ board.regDate }"/>
				</td>
			</tr>
		</table>
		
		<br>
		
		<div class="downBtnZone">
			<input type="submit" value="완료"> 
			<button type="button" onclick="location.href='list.jsp'">취소</button>
		</div>
		</form>
		
		
	</div>
	</section>
	
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>
</body>
</html>

