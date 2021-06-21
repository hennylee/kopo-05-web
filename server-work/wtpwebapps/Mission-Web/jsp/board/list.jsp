<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select no, title, writer, to_char(reg_date, 'yyyy-mm-dd') as reg_date");
	sql.append("	from t_board");
	sql.append("	order by no desc");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	ResultSet rs = pstmt.executeQuery();
	
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
	<h2>게시판 목록</h2>
	<hr width="80%">
	
	<br>
	<table border = "1" style="width : 80%">
		<tr>
			<th width = "7%">번호</th>
			<th>제목</th>
			<th width = "16%">작성자</th>
			<th width = "20%">등록일</th>
		</tr>
		
		<%
			while(rs.next()){
				int no = rs.getInt("no");
				String title = rs.getString("title");
		%>
		<tr>
			<td><%=no %></td>
			<td>
				<a href="detail.jsp?no=<%=no %>"><%=title %></a>
			</td>
			<td><%=rs.getString("writer") %></td>
			<td><%=rs.getString("reg_date") %></td>
		</tr>
		<%
			}
		%>
	</table>
	</div>
</body>
</html>

<%
	JDBCClose.close(conn, pstmt);
%>
