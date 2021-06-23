<%@page import="kr.ac.kopo.board.vo.MemberVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String reqId = request.getParameter("id");
	
	Connection conn = new ConnectionFactory().getConnection();

	StringBuilder sql = new StringBuilder();
	sql.append("select * from t_member where id = ? ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setString(1, reqId);
	
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	
	String id = rs.getString("id");
	System.out.print(id);
	String name = rs.getString("name");
	String password = rs.getString("password");
	String emailId = rs.getString("email_id");
	String emailDomain = rs.getString("email_domain");
	String tel1 = rs.getString("tel1");
	String tel2 = rs.getString("tel2");
	String tel3 = rs.getString("tel3");
	String post = rs.getString("post");
	String basicAddr = rs.getString("basic_addr");
	String detailAddr = rs.getString("detail_addr");
	
	MemberVO member = new MemberVO(id, name, password, emailId, emailDomain, tel1,tel2, tel3, post, basicAddr, detailAddr);
	
	pageContext.setAttribute("member", member);
	
	
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
					<td>${ member.id }
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${ member.name }
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${ member.password }
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${ member.emailId }@${ memeber.emailDomain }
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						${ member.tel1 }-${ member.tel2 }-${ member.tel3 }
					</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>${ member.post }
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${ member.basicAddr } ${ member.detailAddr }
					</td>
				</tr>
			</table>
			
		<input type="button" value="뒤로가기" onclick="location.href='totalMemberList.jsp'">
		<input type="button" value="회원등록" onclick="location.href='joinForm.jsp'">
	
	</div>
</body>
</html>