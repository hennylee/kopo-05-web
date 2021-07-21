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
	
	function sendProcess(method, param){
		
		// 1단계 : 객체 얻어오기
		httpRequest = getXMLHTTPRequest()

		// 2단계 : 서버 상태에 따라 다른 callback함수 정의
		httpRequest.onreadystatechange = callbackFunction
		
		let msg = "============================================================\n"
		
		msg += method + " /Lecture-Web/exam02/param2.jsp?name=" + param + "\n"
		
		msg += "------------------------------------------------------------\n"
		debugTrace(msg)
		
		let url = 'param2.jsp'
		param = encodeURIComponent(param) // 한글 인자 인코딩
		let args = 'name=' + param
		
		// GET방식으로 전송하기
		if(method = 'GET'){
			
			httpRequest.open(method, url + '?' + args, true)
			httpRequest.send(null)
			
		} 
		// POST 방식으로 전송하기
		else if(method = 'POST') {
			
			httpRequest.open(method, url, true)
			
			// POST 방식은 form 태그로 데이터를 넘길때 뿐이기 때문에, header 설정을 안해주면 GET방식으로 인식할 것임
			httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded')
			httpRequest.send(args)
		}

	}


	// 서버의 상태가 바뀔때마다 호출되는 callback함수 정의
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
	<button onclick="sendProcess('GET', 'hong gil-dong')">GET 방식 / 영문인자호출</button>
	<button onclick="sendProcess('GET', '홍길동')">GET 방식 / 한글인자호출</button> <!-- 익스플로어에선 400에러 발생 -->
	
	
		<button onclick="sendProcess('POST', 'hong gil-dong')">POST 방식 / 영문인자호출</button>
		<button onclick="sendProcess('POST', '홍길동')">POST 방식 / 한글인자호출</button> <!-- 익스플로어에선 400에러 발생 -->
</body>
</html>