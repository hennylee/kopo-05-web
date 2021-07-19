<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	let httpRequest = null
	
	function getXMLHTTPRequest(){
		let httpRequest = null
		
		if(window.XMLHttpRequest)
			httpRequest = new XMLHttpRequest()
		else if(widow.ActiveXObject)
			httpRequest = new ActiveXObject("Microsoft.XMLHTTP")
		else
			httpRequest = null
			
		return httpRequest
	
	}
	
	function sendProcess(param){
		httpRequest = getXMLHTTPRequest()
		//alert(httpRequest)
		
		httpRequest.onreadystatechange = callbackFunction
		
		let msg = "==================================================\n"
		
		msg += "/Lecture-Web/exam02/param.jsp?name=" + param + "\n"
		
		debugTrace(msg)
		
		param = encodeURIComponent(param)
		
		let url = "param.jsp?name=" + param
		httpRequest.open('GET', url, true) // 비동기방식 = true
		httpRequest.send(null)

	}


	// 서버의 상태가 바뀔때마다 호출...
	function callbackFunction(){
		let msg = ''
		
		switch(httpRequest.readyState) {
		case 1:
			msg += 'Loading...\n'
			break;
		case 2:
			msg += 'Loaded...\n'
			break;
		case 3:
			msg += 'Interactive...\n'
			break;
		case 4:
			msg += 'Complete...\n'
			if(httpRequest.status == 200) {
				msg += '웹서버에서 정상적으로 수행..\n'	
				msg += '실행결과 : ' + httpRequest.responseText + '\n'	
			}
			else {
				msg += '웹서버에서 에러가 발생..\n'	
				msg += '오류 코드 : ' + httpRequest.status + '\n'	
			}
			
			break;
		}
				
		debugTrace(msg)
	}
	
	function debugTrace(msg) {
		let debug = document.getElementById("debug")
		debug.value += msg
	}
	
</script>
</head>
<body>
	<textarea rows="8" cols="80" id="debug"></textarea>
	<br>
	<button onclick="sendProcess('hong gil-dong')">영문인자호출</button>
	<button onclick="sendProcess('홍길동')">한글인자호출</button> <!-- 익스플로어에선 400에러 발생 -->
</body>
</html>