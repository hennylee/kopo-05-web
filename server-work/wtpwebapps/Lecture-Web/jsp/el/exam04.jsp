<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	BoardVO board = new BoardVO();
	board.setNo(1);
	board.setTitle("test");
	
	//pageContext 영역에 이름="boardVO", 값= '생성된 BoardVO 객체'로 담아주기
	pageContext.setAttribute("boardVO", board);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>1. 자바 코드로 boardVO의 값 가져오기</h2>

	no : <%= board.getNo() %><br>
	
	<h2>2-1. pageContext 영역에 담아둔 boardVO의 값 가져오기(JSP)</h2>
	<ul> 
		<li>pageContext.getAttribute("boardVO")는 Object 타입이기 때문에 
		BoardVO로 명시적 형변환 해줘야, 자식인 BoardVO의 메소드를 사용할 수 있다.
		</li>
	</ul>
	no : <%= ((BoardVO) pageContext.getAttribute("boardVO")).getNo() %><br>
	title : <%= board.getTitle() %><br>
	no : <%= ((BoardVO) pageContext.getAttribute("boardVO")).getTitle() %><br>
	
	
	<h2>2-2. pageContext 영역에 담아둔 boardVO의 값 가져오기(EL) </h2>
	<!-- 이렇게 되면, 자바 표현식이 html 코드 안에 혼재하게 된다. 그래서 EL 표현식으로 값을 가져와보자 -->
	el no : ${ boardVO.no }<br>
	el title : ${ boardVO.title }<br>
	el title : ${ boardVO['title'] }<br>
	
	<!-- 자바빈즈 객체에서 .aaa는 getAaa() 메소드를 의미하기 때문에 해당 메소드가 없으면 500 에러가 발생한다. -->
	<%-- el aaa : ${ boardVO.aaa }<br> --%>
	
</body>
</html>