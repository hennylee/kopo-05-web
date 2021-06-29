<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int boardNo = Integer.parseInt(request.getParameter("no"));
	String id = request.getParameter("id");
	
	BoardDAO dao = new BoardDAO();
	dao.delete(boardNo);
%>    
<script>
	//만약 로그인 안한 사용자가 delete.jsp로 바로 접속한다면? => jsp 임시방편, mvc구조에서는 변경됨
	if('${sessionScope.userVO.id}' == ''){
		location.href = "/Mission-Web/jsp/board/list.jsp"
	}

	alert('게시글이 삭제되었습니다.')
	location.href = "/Mission-Web/jsp/board/list.jsp"
</script>