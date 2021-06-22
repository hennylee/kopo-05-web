<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	
	Connection conn = new ConnectionFactory().getConnection();

	StringBuilder sql = new StringBuilder();
	sql.append("select * from t_member where id = ? ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setString(1, id);
	
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
		<h2>회원 상세</h2>
		<hr width="80%">
		
			<table border="1" style="width: 60%">
				<tr>
					<th>아이디</th>
					<td><%=rs.getString("id") %>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><%=rs.getString("name") %>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><%=rs.getString("password") %>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><%=rs.getString("email_id") %>@<%=rs.getString("email_domain") %>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<%=rs.getString("tel1") %>-<%=rs.getString("tel2") %>-<%=rs.getString("tel3") %>
					</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><%=rs.getString("post") %>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><%=rs.getString("basic_addr") %> <%=rs.getString("detail_addr") %>
					</td>
				</tr>
			</table>
			
		<input type="button" value="뒤로가기" onclick="location.href='totalMemberList.jsp'">
		<input type="button" value="회원등록" onclick="location.href='joinForm.jsp'">
	
	</div>
</body>
</html>