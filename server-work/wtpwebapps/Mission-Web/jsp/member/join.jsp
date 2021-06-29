<%@page import="kr.ac.kopo.member.dao.memberDAO"%>
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String email_id = request.getParameter("email_id");
	String email_domain = request.getParameter("email_domain");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String post = request.getParameter("post");
	String basic_addr = request.getParameter("basic_addr");
	String detail_addr = request.getParameter("detail_addr");
	
	MemberVO member = new MemberVO(id, name, password, email_id, email_domain,tel1, tel2, tel3, post, basic_addr,detail_addr);
	
	memberDAO dao = new memberDAO();
	int result = dao.join(member);
	
	String msg = null;
	
	if(result == 0){
		msg = "회원가입에 실패하였습니다.";
	}
	else {
		msg = "회원가입에 성공하였습니다.";
	}
	
	pageContext.setAttribute("msg", msg);
	
%>
<script>
	alert('${msg}')
	location.href = "/Mission-Web/index.jsp"
</script>