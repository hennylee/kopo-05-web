<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1 ~ 10 사이의 정수 출력</h2>
	<%
		for(int i = 1; i <= 10; i++) {
			/* out 변수는 JSP 엔진에 의해서 변환될 class 파일에 존재하기 때문에 사용 가능한 것이다. */
			out.write(i + "<br>"); 
		}
	%>
	
</body>
</html>