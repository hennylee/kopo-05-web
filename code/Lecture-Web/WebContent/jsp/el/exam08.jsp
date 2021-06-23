<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	/* 자바빈즈 */
	BoardVO vo = new BoardVO();
	vo.setTitle("성공");
	
	/* 1. 자바빈즈 + ArrayList */
	List<BoardVO> boardList = new ArrayList<>();
	boardList.add(vo);
	//pageContext.setAttribute("boardList", boardList);
	
	
	/* 2. 자바빈즈 + Array */
	//BoardVO[] vos = {vo};
	BoardVO[] vos = new BoardVO[]{vo};
	//pageContext.setAttribute("boardList", vos);
	
	
	/* 3. map 객체 + 배열 */
	Map<String, String> board = new HashMap<>();
	board.put("title", "성공");
	
	Map[] maps = {board};
	//pageContext.setAttribute("boardList", maps);
	
	
	/* 4. 맵객체 + 콜렉션 */
	Map<String, String> board2 = new HashMap<>();
	board2.put("title", "성공");
	
	List<Map<String, String>> boardList2 = new ArrayList<>();
	boardList2.add(board2);
	
	//pageContext.setAttribute("boardList", boardList2);
	
	
	/* 5. 자바빈즈 + map ????????????? 왜 실패????????????????? */
	Map<Integer, BoardVO> map = new HashMap<>();
	map.put(0, vo);
	
	pageContext.setAttribute("boardList", map);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 성공이 출력되는 코드 작성하기 -->
	성공/실패? ${ boardList[0] }<br>
	성공/실패? ${ boardList[0].title }<br>
</body>
</html>