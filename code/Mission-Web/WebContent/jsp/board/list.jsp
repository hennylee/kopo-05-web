<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select no, title, writer, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
	sql.append("	from t_board ");
	sql.append("	order by no desc ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	ResultSet rs = pstmt.executeQuery();
	
	List<BoardVO> list = new ArrayList<>();
	
	while(rs.next()){
		int no 			= rs.getInt("no");
		String title 	= rs.getString("title");
		String writer 	= rs.getString("writer");
		String regDate 	= rs.getString("reg_date");
		
		BoardVO board = new BoardVO();
		board.setNo(no);
		board.setTitle(title);
		board.setWriter(writer);
		board.setRegDate(regDate);
		
		// 글 하나에 대한 객체를 List에 담기
		list.add(board);
	}
	
	JDBCClose.close(conn, pstmt);
	
	// list를 공유영역에 등록시키기
	pageContext.setAttribute("list", list);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#addBtn').click(function(){
		location.href = "writeForm.jsp" // location 객체는 url 정보를 가지고 있음
	})
})
</script>
</head>
<body>
	<div align="center">
	<hr width="80%">
	<h2>게시판 목록</h2>
	<hr width="80%">
	<br>
	
	<table border = "1" style="width : 80%">
		<tr>
			<th width = "7%">번호</th>
			<th>제목</th>
			<th width = "16%">작성자</th>
			<th width = "20%">등록일</th>
		</tr>
		<c:forEach items="${list }" var="board" >
			<tr>
				<td>${board.no }</td> <%-- board.no는 list[index].no 와 같다 --%>
				<td>
					<a href="detail.jsp?no=${board.no }">
					<%-- 
						코드링크를 악성코드 링크로 변환시키지 않는 방법 
							- out태그를 활용한다.
							- out태그의 ecscapeXml 속성을 통해 링크를 문자열로 변환시키게 되기 때문에 
							악성링크를 방지할 수 있는 것이다. 
					--%>
						<c:out value="${board.title }"/>
					
					</a>
				</td>
				<td>${board.writer }</td>
				<td>${board.regDate }</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<button id="addBtn">새글등록</button>
	</div>
</body>
</html>
