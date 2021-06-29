<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	<작업순서>
	
	1. 파라미터(제목, 작성자, 내용) 추출
	2. 추출된 데이터를 DB(t_board)에 삽입
	3. 목록페이지로 이동
	
 --%>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	
	// input 태그의 type="hidden"으로 날라온 값
	String writer = request.getParameter("writer"); 
//	String writer = ((MemberVO)session.getAttribute("userVO")).getId();
	
	String content = request.getParameter("content");
	
	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	
	BoardDAO dao = new BoardDAO();
	dao.insert(board);
	
%>    
<script>
	alert('새글 등록이 완료되었습니다.')
	location.href = "list.jsp"
</script>