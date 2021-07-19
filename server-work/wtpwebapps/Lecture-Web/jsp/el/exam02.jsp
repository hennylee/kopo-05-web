<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 
	http://localhost:9999/Lecture-Web/jsp/el/exam02.jsp?id=aaa&name=bbbb&hobby=music&hobby=movie
	요청했을 때의  id, name, pw, hobby 추출하기
--%>
<%
	String id = request.getParameter("id");
	String[] hobbies = request.getParameterValues("hobby");
	if(hobbies == null){
		hobbies = new String[]{"파라미터 없음"};
	}
%>

<h2>기존 표현식</h2>
id = <%= id %> <br>
id = <%= request.getParameter("id") %><br>
id = <% request.getParameter("id"); %><br>
name = <%= request.getParameter("name") %><br>

<!-- 데이터가 없으면?  배열이 null return -->
pw = <%= request.getParameter("pw") %><br>
 
<!-- 데이터가 없으면?  배열이 null이므로 반복문에서 500 에러 발생 -->
hobby = 
<% for(String s : hobbies) {
	out.print(s + " ");
}
%>
<br>


<h2>EL 표현식</h2>
el id = ${ param.id } <br>
el name : ${ param.name }<br>

el pw : ${ param.pw }<br>
 <!-- 데이터가 없으면?  empty return -->

el hobby : ${ paramValues.hobby[0] }  ${ paramValues.hobby[1] }<br>
 <!-- 데이터가 없으면?  empty return -->
 
 
</body>
</html>