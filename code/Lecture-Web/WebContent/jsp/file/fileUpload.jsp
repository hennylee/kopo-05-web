<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 업로드 테스트</h2>
	
	<%-- 1. 사용자 입력 받기 --%>
	<form action="uploadInfo.jsp" method="post" enctype="multipart/form-data">
		id : <input type="text" name="id"><br>
		파일 : <input type="file" name="uploadfile"><br>
		<input type="submit" value="전송">
	</form>
	
</body>
</html>