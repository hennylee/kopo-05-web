<%@page import="kr.ac.kopo.board.vo.BoardFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	http://localhost:9999/Mission-Web/jsp/board/detail.jsp?no=1 
--%>
<%
	// 1. 게시물 번호 추출
	int boardNo = Integer.parseInt(request.getParameter("no"));

	BoardDAO dao = new BoardDAO();
	
	/*
		다른 클라이언트가 게시글을 봤다면? 조회수가 증가하게 된다.
		이때, 내가 클릭한 게시글의 정보를 hidden 속성과 form태그로 가져왔다면, 변경된 정보가 보이지 않는다. 
		그래서 클릭한 게시글의 no만 넘기고, 데이터베이스에서 새로 정보를 받아와야 한다. 

		=> 그래서 [응답-요청]이 비연결적이게 되어야 한다. 
	*/
	
	// 2-1. 조회수 증가 (전체 목록에서 접근했을때만!!)
	String type = request.getParameter("type");
	
	if(type != null && type.equals("list")){
		dao.incrementViewCNT(boardNo);
	}
	
	// 2-2. t_board에서 db 결과 받아오기
	BoardVO board = dao.selectByNo(boardNo);
	
	// 2-3. t_board_file에서 db 결과 받아오기
	List<BoardFileVO> fileList = dao.selectFilesByNo(boardNo);
	
	// 3. 변수 공유영역에 올리기
	pageContext.setAttribute("board", board);
	pageContext.setAttribute("fileList", fileList);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css"/>
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css"/>
<script>
	function clickBtn(type){
		switch (type) {
		case 'U':
			location.href = "updateForm.jsp?no=${ board.no }"
			break;
		case 'D':
			if(confirm('게시글을 삭제할까요?'))
				location.href = "delete.jsp?no=${ board.no }"
			break;
		case 'L':
			location.href = "list.jsp"
			break;
		}		
	}
	
	
	function doDownload(fsn, fon){
		
		/* 폼태그로 전송하려니, 제출할 submit 버튼이 없어서 문제이기 때문에, uri 뒤에 넘겨주는 방식을 선택했음 */
		location.href = "fileDownload.jsp?fsn=" + fsn+"&fon=" + fon
				console.log(fon)
	}
	
</script>

</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	
	<section>
		<div align="center">
		<hr width="100%">
		<h2>게시판 상세</h2>
		<hr width="100%">
		
		<table style="width:100%;">
			<tr>
				<th width="25%">번호</th>
				<td><c:out value="${ board.no }"/></td>
			</tr>
			<tr>
				<th width="25%">제목</th>
				<td><c:out value="${ board.title }"/></td>
			</tr>
			<tr>
				<th width="25%">작성자</th>
				<td><c:out value="${ board.writer }"/>
				</td>
			</tr>
			<tr>
				<th width="25%">내용</th>
				<td><c:out value="${ board.content }"/></td>
			</tr>
			<tr>
				<th width="25%">조회수</th>
				<td><c:out value="${ board.viewCnt }"/></td>
			</tr>
			<tr>
				<th width="25%">등록일</th>
				<td><c:out value="${ board.regDate }"/></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
				<%-- forEach태그로 첨부파일의 갯수만큼만 출력한다. --%>
					<c:forEach items="${fileList }" var="file">
						
						<%-- 파일명이 마크업태그일수도 있으니 out태그로 출력한다 --%>					
					<%-- <a href="/Mission-Web/upload/${ file.fileSaveName }"> --%>
					<a href="javascript:doDownload('${file.fileSaveName }', '${file.fileOriName }')">
							<c:out value="${ file.fileOriName }"/>
						</a>
						(${ file.fileSize } bytes)
						
						<br>
					</c:forEach>
				
				</td>
			</tr>
		</table>
		
		<br>
		
		<div class="downBtnZone">
			<%--			
			<button onclick="location.href='list.jsp'">목록</button>
			 --%>
			<%-- 작성자이면 수정/삭제가 가능해야함 --%>			
			<%--
			<button onclick="location.href='updateForm.jsp?no=${ board.no }'">수정</button>
			<button onclick="location.href='delete.jsp?no=${ board.no }'">삭제</button>
			 --%>
			 
			<c:if test="${ board.writer eq sessionScope.userVO.id }">
				<button onclick="clickBtn('U')">수정</button>
				<button onclick="clickBtn('D')">삭제</button>
			</c:if>
			<button onclick="clickBtn('L')">목록</button>
	</section>
	
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>
</body>
</html>







