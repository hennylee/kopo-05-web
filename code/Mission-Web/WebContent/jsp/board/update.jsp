<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");	

	// 1. 파라미터 추출해서 boardVO에 담기
	BoardVO board = new BoardVO();
	board.setNo(Integer.parseInt(request.getParameter("no")));
	board.setTitle(request.getParameter("title"));
	board.setContent(request.getParameter("content"));
	
	// 2. DB에 수정
	BoardDAO dao = new BoardDAO();
	dao.update(board);
	
%>
<script>
	//만약 로그인 안한 사용자가 update.jsp로 바로 접속한다면? => jsp 임시방편, mvc구조에서는 변경됨
	alert('수정이 완료되었습니다.')
	
	// alert창 띄우고 싶지 않다면, setTimeout으로 창 넘어가도록 만들면 된다.
	location.href="/Mission-Web/jsp/board/detail.jsp?no=" + ${ param.no }
</script>