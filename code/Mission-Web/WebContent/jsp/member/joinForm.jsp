<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
	/* 왜 실행 안되는지 알고 싶음!!! */
	function checkForm(){
		
		if($('#tel2').length > 4){
			alert('4글자 이내로 입력해주세요')
			return false
		}
		
		
		if($('#tel3').length > 4){
			alert('4글자 이내로 입력해주세요')
			return false
		}
		
		// 아이디 중복체크
		
		// 비밀번호 확인
		
		return true
	}
		
		
	function idDoubleCheck(e) {
		let id = $('#id').val()
		
		console.log(e)
		
		if(id == ""){
			alert('id를 입력하세요')
			return
		}
		
		let url = 'doubleCheck.jsp?id='+id
		let options = 'top=10, left=10, width=500, height=600, resizable=no';
		
		window.open(url, '중복체크' , options)
	}
	function pwdDoubleCheck(e) {
		// 아이디 입력체크 
		let f = document.inputForm
		
		// 아이디 중복체크
		if(f.password.value != f.passwordCheck.value){
			alert('패스워드가 서로 다릅니다.')
			return false
		}
        
	}
	
	function pwdDoubleCheck(e) {
		let id = $('#id').val()
		
		console.log(e)
		
		if(id == ""){
			alert('id를 입력하세요')
			return
		}
		
		let url = 'doubleCheck.jsp?id='+id
		let options = 'top=10, left=10, width=500, height=600, resizable=no';
		
		window.open(url, '중복체크' , options)
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
<body>
	<div align="center">
		<hr width="80%">
		<h2>회원 가입</h2>
		<hr width="80%">
		
		<form action="join.jsp" method="post" name="inputForm" onsubmit="return checkForm()">
			<table border="1" style="width: 60%">
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id" id ="id" required>
						<button onclick="idDoubleCheck(this)">중복체크</button>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" required>
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
						<input type="password" name="passwordCheck" required>
						<button onclick="pwdDoubleCheck(this)">중복체크</button>
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
						> 
						-
						<input type="text" name="tel3" 
						pattern="[0-9]{4}" 
						required 
						> 
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
			
		<input type="button" value="뒤로가기" onclick="location.href='totalMemberList.jsp'">
		<input type="submit" value="입력완료">
	
		</form>
		
		
	</div>
</body>
</html>