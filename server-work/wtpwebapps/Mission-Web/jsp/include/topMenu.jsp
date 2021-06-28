<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table border="1" style="width: 100%;">
	<tr>
		<td rowspan="2" style="width: 235px;">
			<img src="/Mission-Web/resources/images/logo.png"/>
		</td>
		<td align="right">
			<c:if test="${ not empty sessionScope.member.id }">
				안녕하세요, ${ sessionScope.member.id }님
			</c:if>
			<br>
			즐겨찾기
		</td>
	</tr>
	<tr>
		<td>
			<nav>
				회원관리 || 
				<a href="/Mission-Web/jsp/board/list.jsp">게시판</a> || 
				회원가입 || 
				<c:if test="${ empty sessionScope.member.id }">
					<a href="/Mission-Web/jsp/login/login.jsp">로그인</a> || 
				</c:if>
				마이페이지 || 
				<c:if test="${ not empty sessionScope.member.id }">
					<a href="/Mission-Web/jsp/login/logout.jsp">로그아웃</a> || 
				</c:if>
			</nav>
		</td>
	</tr>
</table>
