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
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
/*
	type 	: 요청 방식(text)
	url 	: 서버에 요청하는 주소(text)
 	success : 수신성공(함수)
 	error 	: 수신실패(함수)
 */
	$(document).ready(function(){
		$(':button').click(function(){
			$.ajax({
				'type' : 'get',
				'url' : 'hello.jsp',
				'success' : function(data){
					//$('#msgView').html(data)
					$('#msgView').append(data)
					//alert('성공')
				},
				'error' : function(){
					alert('실패')
				}
			})
		})
	})
	
	
</script>
</head>
<body>

	<h2>서버에서 받은 메세지</h2>
	
	<div id ="msgView">
	</div>
	
	<input type="button" value="서버에서 자료 요청">
	
</body>
</html>