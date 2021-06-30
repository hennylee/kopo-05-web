<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글등록</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css"/>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css"/>
<script type="text/javascript" src= "/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>

	// 만약 로그인 안한 사용자가 writeForm.jsp로 바로 접속한다면? => jsp 임시방편, mvc구조에서는 변경됨
	if('${userVO}' == ''){
		location.href = "/Mission-Web/jsp/login/login.jsp"
	}

	$(document).ready(function(){
		$('#goListBtn').click(function(){
			location.href = "list.jsp"
		})
	})

	function doWrite() {
		
		let f = document.writeForm
		
		if(f.title.value == ''){
			alert('제목을 입력하세요')
			f.title.focus()
			return false
		}
		
		if(f.content.value == ''){
			alert('내용을 입력하세요')
			f.content.focus()
			return false
		}
		
		// 파일 확장자 체크
		if(checkExt(f.attachfile1) || checkExt(f.attachfile2)){
			return false
		}
		
		return true
	}
	
	function checkExt(obj) {
		let forbidName = ['exe', 'java', 'jsp', 'js', 'class']
		let fileName = obj.value
		let ext = fileName.substring(fileName.lastIndexOf('.')+1)
		
		for(let i = 0; i < forbidName.length; i++){
			if(forbidName[i] == ext){
				alert(ext + '확장자는 파일업로드 정책에 위배됩니다.')
				return true
			}
		}
		return false
	}	
	

</script>
</head>
<body>

	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	
	<section>
	<div align="center">
		<hr width="100%">	
		<h2>게시글 등록폼</h2>
		<hr width="100%">	
		
		<form action="write.jsp" method="post" name ="writeForm" 
				onsubmit="return doWrite()"
				enctype="multipart/form-data">
				
			<table style="width:100%" class="form">
				<tr>
					<th width="25%">제목</th>
					<td>
						<input type="text" size="60" name="title">
					</td> 
				</tr>
				<tr>
					<th width="25%">작성자</th>
					<td>
						
				   <%-- <input type="text" size="60" name="writer" value=${ sessionScope.userVO.id } readonly> --%>
						<c:out value="${ sessionScope.userVO.id }"/>
						<input type="hidden" size="60" name="writer" value=${ sessionScope.userVO.id }>

					</td>
				</tr>
				<tr>
					<th width="25%">내용</th>
					<td>
						<textarea rows="30" cols="100" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<th width="25%">첨부파일</th>
					<td>
						<input type="file" name="attachfile1"><br>
						<input type="file" name="attachfile2">
					</td>
				</tr>
			</table>
			<div class="downBtnZone">
				<input type="submit" value="등록">
				<input type="button" value="목록" id="goListBtn">
			</div>
		</form>
	</div>
	</section>
	
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>
	
</body>
</html>