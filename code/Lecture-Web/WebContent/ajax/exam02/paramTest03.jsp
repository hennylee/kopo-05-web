<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		
		
		$(':button').click(function() {
			let name = $('#name').val()
			let age = $('#age').val()

			$.ajax({
				url :'param3.jsp',
// 				data : 'name=hong&age=23',
				data : {name : name, age : age},
				success : function(result){
					$('#debug').val(result)
				},
				error : function(){
					alert('실패')
				}
			})
			
			
		})
	})


</script>
</head>
<body>
	<textarea rows="8" cols="80" id="debug"></textarea>
	<br>
	이름 : <input type="text" id ="name"><br>
	나이 : <input type="text" id ="age"><br>
	<input type="button" value="호출">
</body>
</html>