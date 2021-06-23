<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 1. 표현식 </h2>
	5 + 5 = <%= 5 + 5 %> <br>
	
	<h2> 2. EL 연산자 </h2>
	<ul>
		<li>자바 코드로 변환되는게 아니다.</li>
		<li>자바 입장에서는 결과값만 String으로 반환받는 것이다.</li>
	</ul>
	
	<h3>2-1. 산술, 비교, 논리 연산자</h3>
	5 + 5 = ${ 5 + 5 } <br>
	9 % 5 = ${ 9 % 5 } <br>
	9 > 5 = ${ 9 > 5 } <br> 
	9 mod 5 = ${ 9 mod 5 } <br> <!-- 키워드 연산자 -->
	9 gt 5 = ${ 9 gt 5 } <br> <!-- 키워드 연산자 -->
	9 eq 5 = ${ 9 eq 5 } <br> <!-- 키워드 연산자 -->
	<%-- 9 ne 5 = ${ 9 ne 5 } <br> --%> <!-- 키워드 연산자 : 이클립스가 ne를 해석하지 못할 뿐, 웹브라우저는 잘 해석해서 오류 관계 없음 -->
	
	( 5 == 5 ) && ( 9 > 6 ) : ${( 5 == 5 ) && ( 9 > 6 ) } <br>
	( 5 eq 5 ) && ( 9 gt 6 ) : ${( 5 eq 5 ) && ( 9 gt 6 ) } <br>
	
	<h3>2-2. empty 연산자</h3>
	empty str : ${ empty str } <br>
	empty str : ${ not empty str } <br>
	
	
	<h3>2-3. 삼항 연산자</h3>
	5의 짝/홀수 판단 : ${ 5 % 2 == 0 ? "짝수" : "홀수" } <br> 
	4의 짝/홀수 판단 : ${ 4 mod 2 eq 0 ? "짝수" : "홀수" } <br> 
</body>
</html>