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
<script>
	$(document).ready(fucntion(){
		if()
	})
	
</script>
</head>
<body>
	<div align="center">
		<hr width="80%">
		<h2>게시판 상세</h2>
		<hr width="80%">
	</div>
</body>
</html>