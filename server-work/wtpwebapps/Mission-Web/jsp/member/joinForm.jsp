<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css"/>
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css"/>
<script src = "/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	// 제출 확인
	function checkForm(){
		
		/* 왜 실행 안되는지 알고 싶음!!! */
		if(id == ""){
			$('#idCheckMsg').text('ID를 입력하세요')
			return false
		}
		
		/* 왜 실행 안되는지 알고 싶음!!! */
		if($('#tel2').length > 4 || $('#tel3').length > 4){
			$('#telCheckMsg').text('4글자 이내로 입력해주세요')
			return false
		}
		
		
		// 비밀번호 확인
		let f = document.inputForm
		
		if(f.passwordCheck.value != f.password.value){
			console.log('불일치')
			$('#pwCheckMsg').text('비밀번호가 일치하지 않습니다.')
			return false
		}
		
		return true
	}
		
	/* id 중복체크 */
	function idDoubleCheck(e) {
		let id = $('#id').val()
		
		if(id != ""){
			let options = 'top=10, left=10, width=400, height=200, resizable=no';
			let url = 'doubleCheck.jsp?id='+id
			
			window.open(url, '중복체크' , options)
		}
		
	}
	
	
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

</script>
</head>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	
	<section>
	
	<div align="center">
		<hr>
		<h2>회원 가입</h2>
		<hr>
		
		<form action="join.jsp" method="post" name="inputForm" onsubmit="return checkForm()">
			<table border="1" style="width: 80%">
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id" id ="id" required>
						<button onclick="idDoubleCheck(this)">중복체크</button>
						<span id="idCheckMsg" style="color:red;font-weight:bold"></span>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" required>
						<span id="nameCheckMsg" style="color:red;font-weight:bold"></span>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="password" required>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" name="passwordCheck" id = "passwordCheck" required>
						<span id="pwCheckMsg" style="color:red;font-weight:bold"></span>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="email_id" required>
						@
						<select name="email_domain">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>google.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						
						<select name="tel1">
							<option>010</option>
							<option>011</option>
						</select>
						-
						<input type="text" name="tel2" 
						pattern="[0-9]{4}"
						required
						style="width: 20%"
						> 
						-
						<input type="text" name="tel3" 
						pattern="[0-9]{4}" 
						required
						style="width: 20%"
						> 
						<span id="telCheckMsg" style="color:red;font-weight:bold"></span>
					</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>
						<input type="text" name="post" id="sample6_postcode" placeholder="우편번호" required>
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="basic_addr" required id="sample6_address" placeholder="주소"><br>
						<input type="text" name="detail_addr" required id="sample6_detailAddress" placeholder="상세주소">
						<input type="text" id="sample6_extraAddress" placeholder="참고항목">
					</td>
				</tr>
			</table>
			
		<input type="button" value="뒤로가기" onclick="location.href='list.jsp'">
		<input type="submit" value="입력완료">
	
		</form>
		
		
	</div>	
	</section>
	
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>
</body>
</html>



<body>