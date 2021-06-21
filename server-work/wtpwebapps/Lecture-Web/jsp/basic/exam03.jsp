<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 표현식 : 지역변수 --%>
	<%
		int sum01 = 0;
	%>
	sum01 : <%= sum01 %> <br>
	
	
	<%-- 선언문 : 서블릿 클래스의 멤버변수 --%>
	<%!
		private int sum02 = 0;
	%>
	sum02 : <%= sum02 %> <br>
	
	<%-- 선언문 : 서블릿의 메소드 --%>	
	<%!
		public int getSum(int val1, int val2){
			int sum = 0;
			for(int i = val1; i <= val2; i++){
				sum += i;
			}
			return sum;
		}
	%>
	
	1~10 사이의 총합 : <%= getSum(1, 10) %> <br>
</body>
</html>