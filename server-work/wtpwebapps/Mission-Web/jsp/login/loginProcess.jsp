<%@page import="kr.ac.kopo.member.dao.LoginDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	작업순서
	1. login.jsp에서 날라오는 파라미터 추출(id, password)
	2. 추출된 id와 password에 맞는 회원의 존재 여부 판단(DB, t_member)
	3. 만일 로그인 성공 시, 세션에 회원정보 등록
	4. 존재여부에 따른 페이지를 이동(로그인 성공 : index.jsp / 로그인 실패 : login.jsp)
	
	
	리뷰
	1. 로그인할때, 로그인한 사람의 이름, 관리자여부 등의 정보를 받아오는 것이 좋을 것이다. 
	하지만 비밀번호나 이런 정보들을 받아오는 것은 불필요하다. 
	불필요한 정보를 가지고 있는 것은 무거우니까, 계속 필요한 정보만 받아오는 것이 좋다. 
--%>

<%
	// POST방식일때 response 인코딩
	response.setCharacterEncoding("utf-8");

	/* 1. 파라미터 추출 */
	String paramId = request.getParameter("id");
	String paramPwd = request.getParameter("password");
	
	/* 2-1. 객체 생성 및 초기화 */
	// 로그인 입력값을 기억하는 객체
	MemberVO memberVO = new MemberVO();
	memberVO.setId(paramId);
	memberVO.setPassword(paramPwd);
	
	/* 2-2. DB에서 로그인 수행 */
	LoginDAO dao = new LoginDAO();
	
	// 사용자의 정보를 기억하는 객체
	MemberVO userVO = dao.login(memberVO);
	
	
	/* 
		로그인 성공 시 => userVO != null
		로그인 실패 시 => userVO == null
	*/
	
	String msg = null;
	String url = null;
	
	/*  
		sendRedirect와 forward를 쓸때, root로 인식하는 디렉토리 경로가 다르기 때문에 url이 다르다. 
	*/
		
	if(userVO == null){
		msg = "아이디 또는 패스워드를 잘못 입력하셨습니다.";
		url = "login.jsp";
	} else {
		msg = "로그인을 성공하였습니다.";
		url = "/Mission-Web/index.jsp";
		
		/* 3. 세션에 등록 */
		session.setAttribute("userVO", userVO);
	}
	 
	pageContext.setAttribute("msg", msg);
	pageContext.setAttribute("url", url);

/*  
	sendRedirect를 쓰는 방법
*/
//	response.sendRedirect(url);
//	pageContext.setAttribute("url", url + "?msg=" + msg );
	
%>
<script>
	alert('${msg}')
	/* 
		서블릿에서 el하고 자바코드가 먼저 해석되기 때문에 작은 따옴표를 꼭 써줘야 한다.  
		작은따옴표를 안쓰면 변수로 인식하게 된다. 
		(1) 서버가 해석이 되어서 -> (2) 웹라우저로 날라온 다음에 -> (3) 스크립트 해석이 되기 때문이다. 
	*/
	
	/* 4. 존재여부에 따른 페이지를 이동(로그인 성공 : index.jsp / 로그인 실패 : login.jsp) */
	/* forward나 sendRedirect보다 깔끔한 방식 */
	location.href = '${url }'
	
</script>

<%-- 
	forward를 쓰면 안되는 이유?
	: forward를 쓰게 되면 url이 loginProcess가 되기 때문에 올바르지 않다. 
--%>

<%-- 
<jsp:forward page="${url }">
	<jsp:param value="msg" name="${msg }"/>
</jsp:forward>
--%>


