<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");	

	BoardVO board = new BoardVO();
	board.setNo(Integer.parseInt(request.getParameter("no")));
	board.setTitle(request.getParameter("title"));
	board.setContent(request.getParameter("content"));
	
	BoardDAO dao = new BoardDAO();
	dao.update(board);
	
	pageContext.setAttribute("board", board);
	
%>
<script>
	//만약 로그인 안한 사용자가 updateProcess.jsp로 바로 접속한다면? => jsp 임시방편, mvc구조에서는 변경됨

	alert('수정이 완료되었습니다.')
	location.href="/Mission-Web/jsp/board/detail.jsp?no=" + ${board.no}
</script>