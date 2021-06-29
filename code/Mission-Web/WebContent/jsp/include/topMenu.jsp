<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table border="1" style="width: 100%;">
	<tr>
		<td rowspan="2" style="width: 235px;">
			<img src="/Mission-Web/resources/images/logo.png"/>
		</td>
		<td align="right">
			<c:if test="${ not empty sessionScope.userVO }">
				안녕하세요, [${ sessionScope.userVO.name }]님
			</c:if>
			<br>
			즐겨찾기
		</td>
	</tr>
	<tr>
		<td>
			<nav>
				<c:if test="${ userVO.type eq 'S' }">
					회원관리 || 
				</c:if>
				<a href="/Mission-Web/jsp/board/list.jsp">게시판</a> || 
				
				<c:choose>
					<c:when test="${ empty sessionScope.userVO }">
						회원가입 || 
						<a href="/Mission-Web/jsp/login/login.jsp">로그인</a> || 
					</c:when>
					<c:otherwise>
						마이페이지 || 
						<a href="/Mission-Web/jsp/login/logout.jsp">로그아웃</a> || 
					</c:otherwise>
				</c:choose>
				
			</nav>
		</td>
	</tr>
</table>
