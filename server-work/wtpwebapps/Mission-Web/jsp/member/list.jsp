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
	
	while(rs.next()){
		
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css"/>
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css"/>
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
 	$(document).ready(function(){
 		let cnt = 1
 		
 		$('.autoIncrement').each(function(){
 			$(this).text(cnt++)
 		})
 		
 		/*
 		for(let i = 0; i < $('tr').length; i++){
 			$('.autoIncrement:eq(i)').text(i)
 		}
 		*/
 		
 	})
 	
 	function toggle(){
 		let checkedMem = document.mainForm.memCheck
 		
 		let cnt = checkedMem.length
 		
 		for(let i = 0; i < checkedMem.length && checkedMem[i].checked; i++){
 			cnt--
 		}
 		
 		for(let i = 0; i < checkedMem.length; i++){
 			checkedMem[i].checked = Boolean(cnt)
 		}
 		
 	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	
	<section>
	<div align="center">
		<hr>
		<h2>전체 회원 목록</h2>
		<hr>
		<form name="mainForm">
		<div class="topBtnZone">
			<input type="button" value="등록" onclick="location.href='joinForm.jsp'">
			<button type="button">수정</button>
			<button type="button">삭제</button>
		</div>
		<table border="1">
				<tr>
					<th style="width:2%"><input type="checkbox" onclick="toggle()" ></th>
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
					<td class="checkBox">
						<input type="checkbox" name="memCheck">
					</td>
					<td class="autoIncrement"></td>
					<td>
						<a href="detail.jsp?id=<%=id %>"><%= id %></a>
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
		</form>
	</div>
	</section>
	
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>
</body>
</html>