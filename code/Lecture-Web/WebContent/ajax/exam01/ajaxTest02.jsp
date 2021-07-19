<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#msgView{
		border: 1px solid red;
		height: 200px;
		width: 500px;
	
	}

</style>
<script>

	let httpRequest = null
	
	function requestMsg(){
		// 1단계 : XMLHttpRequest 객체 생성
		
		if(window.XMLHttpRequest)
			httpRequest = new XMLHttpRequest()
		else if(widow.ActiveXObject)
			httpRequest = new ActiveXObject("Microsoft.XMLHTTP")
		else
			httpRequest = null
	
	
		// 2단계 : callback 함수 설정
		httpRequest.onreadystatechange = responseMsg // onreadystatechange : 변경될때마다 호출

		
		// 3단계 : 서버에 비동기 요청하기
		httpRequest.open('GET', 'hello.jsp', true)
		httpRequest.send(null)
		
		
	}

	function responseMsg(){
		
		// 404에러가 발생해도 readyState는 4임
		if(httpRequest.readyState == 4){
			
			// status가 200일때
			if(httpRequest.status == 200){
				let msgView = document.getElementById("msgView");
				msgView.innerHTML = httpRequest.responseText
				//msgView.innerHTML += httpRequest.responseText : 계속 덧붙이기 방법
			}
		}
	}
</script>
</head>
<body>

	<h2>서버에서 받은 메세지</h2>
	
	<div id ="msgView">
	</div>
	
	<input type="button" value="서버에서 자료 요청" onclick="requestMsg()">
	
</body>
</html>