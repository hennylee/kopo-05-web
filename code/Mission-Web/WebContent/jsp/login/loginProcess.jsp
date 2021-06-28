<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="kr.ac.kopo.board.vo.MemberVO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	작업순서
	1. login.jsp에서 날라오는 파라미터 추출(id, password)
	2. 추출된 id와 password에 맞는 회원의 존재 여부 판단(DB, t_member)
	3. 만일 로그인 성공 시, 세션에 회원정보 등록
	4. 존재여부에 따른 페이지를 이동(로그인 성공 : index.jsp / 로그인 실패 : login.jsp)
--%>

<%
	String paramId = request.getParameter("id");
	String paramPwd = request.getParameter("password");

	Connection conn = new ConnectionFactory().getConnection();

	//String sql = "select count(*) from t_member where id = ? and password = ? ";
	String sql = "select * from t_member where id = ? and password = ? ";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, paramId);
	pstmt.setString(2, paramPwd);
	
	ResultSet rs = pstmt.executeQuery();
	
	if(!rs.next()){
		request.setAttribute("msg", "일치하는 정보가 없습니다.");
		response.sendRedirect("login.jsp");
	}
	else{
		String id = rs.getString("id");
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
		String type = rs.getString("type");
		String regDate = rs.getString("reg_date");
		
		MemberVO member = new MemberVO(id, name, password, emailId, emailDomain, 
				tel1, tel2, tel3, post, basicAddr, detailAddr, type, regDate);
		
		JDBCClose.close(conn, pstmt);
		
		session.setAttribute("member", member);
		request.setAttribute("msg", "로그인 완료되었습니다.");
		response.sendRedirect("/Mission-Web/");
	}
%>
<script>
	alert(${msg})
</script>