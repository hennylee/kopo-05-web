<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = new ConnectionFactory().getConnection();

	String sql = "select * from t_member ";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
 	$(document).ready(function(){
 		let cnt = 1
 		
 		$('.autoIncrement').each(function(){
 			console.log(cnt)
 			$(this).text(cnt++)
 		})
 		
 		/*
 		for(let i = 0; i < $('tr').length; i++){
 			$('.autoIncrement:eq(i)').text(i)
 		}
 		*/
 		
 	})
</script>
</head>
<body>
	<div align="center">
		<hr width="80%">
		<h2>전체 회원 목록</h2>
		<hr width="80%">
	
		<table border="1" style="width: 80%">
				<tr>
					<th style="width:2%">no</th>
					<th style="width:5%">아이디</th>
					<th style="width:8%">이름</th>
					<th style="width:5%">비밀번호</th>
					<th>이메일</th>
					<th style="width:10%">전화번호</th>
					<th style="width:5%">우편번호</th>
					<th>주소</th>
					<th>상세주소</th>
				</tr>
				
				<% 
					while(rs.next()) {
						String id = rs.getString("id");
						
				%>
				<tr>
					<td class="autoIncrement"></td>
					<td>
						<a href="detailMember.jsp?id=<%=id %>"><%= id %></a>
					</td>
					<td><%= rs.getString("name") %></td>
					<td><%= rs.getString("password") %></td>
					<td><%= rs.getString("email_id") %>@<%= rs.getString("email_domain") %></td>
					<td><%= rs.getString("tel1") %>-<%= rs.getString("tel2") %>-<%= rs.getString("tel3") %></td>
					<td><%= rs.getString("post") %></td>
					<td><%= rs.getString("basic_addr") %></td>
					<td><%= rs.getString("basic_addr") %> <%= rs.getString("detail_addr") %></td>
				</tr>
				<%
					} 
				%>
			</table>
			<br>
			<input type="button" value="회원등록" onclick="location.href='joinForm.jsp'">
	
	</div>
</body>
</html>