<%@page import="kr.ac.kopo.board.vo.BoardFileVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="kr.ac.kopo.util.KopoFileNamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

	/* 
		파일 경로 구분자 : (1) \\ (윈도우 방식) , (2) / (리눅스) 
	*/
	// 파일 저장 경로
	String saveDirectory = "C:/kopo-05-web/code/Mission-Web/WebContent/upload";

	/* 
		<생성자>
		MultipartRequest(
			javax.servlet.http.HttpServletRequest request, 
			java.lang.String saveDirectory, 
			int maxPostSize, 
			java.lang.String encoding, 
			FileRenamePolicy policy
		) 
	*/
	
	// MultipartRequest 객체
	MultipartRequest multiRequest = new MultipartRequest(
											request,
											saveDirectory,
											1024 * 1024 * 3,
											"utf-8",
											new KopoFileNamePolicy()
									);
	
	/* 1-1. 입력될 게시글 정보 추출 */
	String title = multiRequest.getParameter("title");
	String writer = multiRequest.getParameter("writer");
	String content = multiRequest.getParameter("content");
	
	BoardDAO dao = new BoardDAO();
	
	/* 1-2. 게시물 번호 추출 */
	int boardNo = dao.selectNo();
	
	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	board.setNo(boardNo);
	
	/* 2-1. 게시글 저장(t_board) */
	dao.insert(board);
	
	/* 1-3. 저장될 첨부파일 추출  */
    Enumeration files =	multiRequest.getFileNames(); // return형이 Enumeration( 구, Iterator )
 												     
	while(files.hasMoreElements()){
	 	// 폼 데이터의 name 속성을 뽑아내기
		String fileName = (String) files.nextElement(); 
	 	
	 	// 전송된 파일 객체 받기
	 	File f = multiRequest.getFile(fileName);

	 	// 전송된 파일이 존재할 때만 수행
	 	if(f != null){
		 	// 파일 orginal 명 받아오기
		    String fileOriName = multiRequest.getOriginalFileName(fileName);
		 	
		 	// 파일 save할 때 파일명 받아오기
		 	String fileSaveName = multiRequest.getFilesystemName(fileName);
		 	
		 	// 파일 객체의 사이즈 받아오기
		 	int fileSize = (int) f.length();
		 	
		 	BoardFileVO fileVO = new BoardFileVO();
		 	fileVO.setFileOriName(fileOriName);
		 	fileVO.setFileSaveName(fileSaveName);
		 	fileVO.setFileSize(fileSize);
		 	fileVO.setBoardNo(boardNo);
		
		 	/* 2-2. 첨부파일 저장(t_board_file) */
			dao.insertFile(fileVO);
	
	 	}
	 	
	}
	
	
/*
<파일 업로드 안할때 저장하기>
	
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
*/
%>    
<script>
	alert('새글 등록이 완료되었습니다.')
	location.href = "list.jsp"
</script>