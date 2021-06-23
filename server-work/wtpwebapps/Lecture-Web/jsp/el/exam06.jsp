<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String[] names = {"홍길동", "강길동", "고길동", "윤길동"};

	pageContext.setAttribute("names", names);

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>표현식</h2>
	첫번째 이름 : <%= names[0] %><br>
	두번째 이름 : <%= names[1] %><br>
	세번째 이름 : <%= names[2] %><br>
	네번째 이름 : <%= names[3] %><br>
	<%-- 다섯번째 이름 : <%= names[4] %><br> --%> <!-- ArrayIndexOutOfBoundsException -->
	
	<h2>EL</h2>
	첫번째 이름 : ${names[0] }<br>
	두번째 이름 : ${names[1] }<br>
	세번째 이름 : ${names[2] }<br>
	네번째 이름 : ${names[3] }<br>
	다섯번째 이름 : ${names[4] }<br>
	
</body>
</html>