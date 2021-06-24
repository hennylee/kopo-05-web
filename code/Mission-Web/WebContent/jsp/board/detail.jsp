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

	// 2. 데이터 베이스 t_board 테이블에서 해당 게시물 조회
	Connection conn = new ConnectionFactory().getConnection();
	
	StringBuilder sql = new StringBuilder();
	sql.append("select no, title, writer, content, view_cnt ");
	sql.append("	, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
	sql.append("	from t_board ");
	sql.append("	where no = ? ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setInt(1, boardNo);
	
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	
	// db결과 변수로 받기
	int no = rs.getInt("no");
	String title = rs.getString("title");
	String writer = rs.getString("writer");
	String content = rs.getString("content");
	int viewCnt = rs.getInt("view_cnt");
	String regDate = rs.getString("reg_date");

	JDBCClose.close(conn, pstmt);
	
	// 자바빈즈 클래스로 만들기
	BoardVO board = new BoardVO(no, title, writer, content, viewCnt, regDate);
	
	// 변수 공유영역에 올리기
	pageContext.setAttribute("board", board);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<hr width="80%">
		<h2>게시판 상세</h2>
		<hr width="80%">
		
		<table border = "1" style="width:80%;">
			<tr>
				<th width="25%">번호</th>
				<td>${ board.no }</td>
			</tr>
			<tr>
				<th width="25%">제목</th>
				<td>${ board.title }</td>
			</tr>
			<tr>
				<th width="25%">작성자</th>
				<td>${ board.writer }</td>
			</tr>
			<tr>
				<th width="25%">내용</th>
				<td>${ board.content }</td>
			</tr>
			<tr>
				<th width="25%">조회수</th>
				<td>${ board.viewCnt }</td>
			</tr>
			<tr>
				<th width="25%">등록일</th>
				<td>${ board.regDate }</td>
			</tr>
		</table>
		
	</div>
</body>
</html>