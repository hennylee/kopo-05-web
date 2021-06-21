<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<td><%= rs.getInt("no") %></td>
			</tr>
			<tr>
				<th width="25%">제목</th>
				<td><%= rs.getString("title") %></td>
			</tr>
			<tr>
				<th width="25%">작성자</th>
				<td><%= rs.getString("writer") %></td>
			</tr>
			<tr>
				<th width="25%">내용</th>
				<td><%= rs.getString("content") %></td>
			</tr>
			<tr>
				<th width="25%">조회수</th>
				<td><%= rs.getInt("view_cnt") %></td>
			</tr>
			<tr>
				<th width="25%">등록일</th>
				<td><%= rs.getString("reg_date") %></td>
			</tr>
		</table>
		
	</div>
</body>
</html>