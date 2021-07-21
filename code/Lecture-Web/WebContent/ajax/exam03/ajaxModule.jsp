<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- httpRequest 실행 파일 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="httpRequest.js"></script>

<script>
	function clickBtn() {
		
		let name = document.inputForm.name.value
		let age = document.inputForm.age.value
		let addr = document.inputForm.addr.value
		
		httpRequest = getXMLHttpRequest()
		//alert(httpRequest)
		
		
		
		// 비동기 통신을 하기 위해서 sendProcess()라는 표준화된 모듈을 사용하는 것이 목적이다. 
		
		// 1단계
// 		sendProcess('POST', 'sample.jsp', 'name=홍길동&나이=24&주소=서울시 서초구', callback)

		// 2단계
		let params = 'name=' + name + '&age=' + age + '&addr=' + addr
// 		sendProcess('POST', 'sample.jsp', params, callback)

		// 3단계
// 		let params = {name : name, age : age, addr : addr}
		sendProcess('GET', 'sample.jsp', params, callback)
		
	}
	
	function callback(){
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

	<h2>XMLHTTPRequest 모듈을 이용한 예제파일</h2>

	<form name="inputForm" action="">
		<textarea rows="10" cols="80" id="debug"></textarea><br>
		
		이름 : <input type="text" name="name"><br>
		나이 : <input type="text" name="age"><br>
		주소 : <input type="text" name="addr"><br>
		
		<button type="button" onclick="clickBtn()">서버에 자료 요청</button>
	</form>
</body>
</html>