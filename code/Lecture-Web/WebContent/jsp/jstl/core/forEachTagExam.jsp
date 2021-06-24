<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% 
	String[] names = {"홍길동", "유관순", "박문수"};
	
	pageContext.setAttribute("names", names);
	pageContext.setAttribute("lastName", names[names.length-1]);
	pageContext.setAttribute("namesLength", names.length);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>names 배열객체 출력하기</h2>
	<c:forEach items="${ names }" var="name">
		${name }
	</c:forEach>

	<h2>names 배열객체 , 찍어서 출력하기</h2>
	
	<h4>방법 1</h4>
	
	<c:forEach items="${ names }" var="name">
		<c:choose>
			<c:when test="${ name eq names[namesLength -1]}">
				${name }
			</c:when>
			<c:otherwise>
				${name },
			</c:otherwise>		
		</c:choose>
	</c:forEach>
	
	
	<h4>방법 2</h4>
	<c:forEach items="${ names }" var="name">
		<c:choose>
			<c:when test="${ name eq lastName}">
				${name }
			</c:when>
			<c:otherwise>
				${name },
			</c:otherwise>		
		</c:choose>
	</c:forEach>
	
	<hr>
	
	<h4>정답 1</h4>
	
	<c:forEach begin = "0" end="${namesLength - 1 }" var="i">
		<c:if test="${ i ne 0 }">
		,
		</c:if>
		${ names[i] }
	</c:forEach>
	
	
	<h4>정답 2 : 레거시</h4>
	<c:set var = "cnt" value="0"/>
	<c:forEach items="${ names }" var="name">
		<c:if test="${cnt != 0}">
		,
		</c:if>
		${name }
		<c:set var="cnt" value="${ cnt + 1 }"/>
	</c:forEach>
	<c:remove var="cnt" scope="page" />
	
	
	<h4>정답 3 : varStatus</h4>
	<c:forEach items="${names }" var="name" varStatus="loop">
		<c:if test="${not loop.first}">
		,
		</c:if>
		${name }
	</c:forEach>
	
	
	<h2>names 배열객체의 varStatus 출력하기</h2>
	first : last : index : count<br>
	<c:forEach items="${ names }" var="name" varStatus="loop"><%-- loop를 돌때 자기 상태 --%>
		${loop.first } : ${loop.last } : ${loop.index } : ${loop.count } <br>
	</c:forEach>
	
	
	<h2>1 ~ 10 사이의 정수 출력</h2>
	<c:forEach begin ="1" end="10" var="i">
		${i}
	</c:forEach>
	[ ${i} ] <%-- i는 지역변수 --%>
	
	
	<h2>begin, end 사용예 : select문</h2>
	
	년도 선택 : 
	<select>
		<c:forEach begin="1940" end="2021" var="year">
			<option>${year }</option>
		</c:forEach>
	</select>
	년
	<select>
		<c:forEach begin="1" end="12" var="month" step="3">
			<option>${month }</option>
		</c:forEach>
	</select>
	월
	
	
</body>
</html>