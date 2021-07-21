<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- httpRequest 실행 파일 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="httpRequest.js"></script>
<script src="/Lecture-Web/jquery/js/jquery-3.6.0.min.js"></script>
<script>
	function clickBtn() {
		
		sendProcess('GET', 'sample.xml', null, callback)
	}
	
	function callback(){
		
		let msg = ''
		if(httpRequest.readyState == 4){
			
			if(httpRequest.status == 200){
				
				let xmlDoc = httpRequest.responseXML 
				let memberList = $(xmlDoc).find('member')
				msg += '회원수 : ' + memberList.length + '명\n'
				
				memberList.each(function(){
// 					console.log(this)
					let id = $(this).find('id').text()
					let name = $(this).find('name').text()
					msg += id + "("+ name +" )\n"
				})
				
				msg += "=================================================\n"
				debugTrace(msg)
			}
			
		}
			
		
					
		//debugTrace(msg)
	}
		
	function debugTrace(msg) {
		let debug = document.getElementById("debug")
		debug.value += msg
	}
</script>
</head>
<body>

	<h2>JSON 데이터 예제파일</h2>

	<form name="inputForm" action="">
		<textarea rows="10" cols="80" id="debug"></textarea><br>
		<button type="button" onclick="clickBtn()">서버에 자료 요청</button>
	</form>
</body>
</html>