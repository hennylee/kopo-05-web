<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
	Connection conn = new ConnectionFactory().getConnection();
	
	String sql = "select count(*) from t_member where id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	int cnt = rs.getInt(1);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src= "/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div align="center">
		<hr width="80%">
		<h2>중복 체크</h2>
		<hr width="80%">
		<div id="msg">
			<% 
				if(cnt == 1) {
					out.println("중복된 id가 존재합니다.");
				}
				else{
					out.println("사용 가능한 id입니다.");
				}
			%>
		</div>
		<br><br>
		<input type="button" value="확인" onclick="window.close()">
	</div>
</body>
</html>