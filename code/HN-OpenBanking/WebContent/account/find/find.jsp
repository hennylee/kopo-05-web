<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<jsp:include page="/include/head.jsp" />
<script type="text/javascript">
	
	function checkRegex(){
		let bCheck = false

		let alias = $('#alias').val();
		let password = $('#password').val();
		
		let alias_regex = /^[가-힣]{1,10}/
		let pw_regex = /^[0-9]{4}$/
		
		// 비밀번호 검사
		if(!pw_regex.test(password)){
			bCheck = false
			$('#alert-modal-body-msg').text('비밀번호는 숫자 4자리로 입력해주세요.')
			$('#alertModal').modal('show')
		}
		// 계좌 별칭 검사
		else if(!alias_regex.test(alias)){
			bCheck = false
			$('#alert-modal-body-msg').text('별칭은 10글자 이내의 한글로 입력해주세요.')
			$('#alertModal').modal('show')
		}
		else{
			bCheck = true
		}
		return bCheck
	}

	function nextStep(){
		
		
		let url = ""

		let typeCode = $("select[name='account_type'] option:selected").val();
		let alias = $('#alias').val();
		let password = $('#password').val();
		
		if(checkRegex()){
			
			$.ajax({
				url : "<%=request.getContextPath()%>/account/open/step2.do",
				data : {
					typeCode : typeCode,
					alias : alias,
					password : password
				},
				type : "post",
				success : callback,
				error : function() {
					alert('error')
				}
			});

		}

	}

	function callback(result) {
		$('#modal-after-section').html(result)
		$('#myModal').modal("show")
	}

</script>

<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<jsp:include page="/include/header.jsp" />






				<section>
					<header class="major">
						<h2>전체 계좌 조회</h2>
					</header>
					
					
					
					<!-- Section -->
								<section>
									<div class="posts">
									
									<c:forEach items="${list }" var="account">
									
										<article>
											<h3>[${account.typeVO.type }] ${account.account }</h3>
											<p>${not empty account.alias? account.alias: "" }</p>
											<ul class="actions">
												<li><a href="#" class="button primary large">총 <fmt:formatNumber value="${account.balance }" type="Currency"/> 원</a></li>
											</ul>
										</article>
										
									</c:forEach>
									<c:if test="${fn:length(list) % 2 ne 0}">
										<article>
											<h3>&nbsp;</h3>
											<p>&nbsp;</p>
											<ul class="actions">
											</ul>
										</article>
									</c:if>
										
									</div>
								</section>
					
					
					
					
					
					
					
					
					
					
						<!-- Search -->
								<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form>
								</section>
						

						<div class="row">
							<div class="col-5 col-12-medium">

								<div class="col-12">
									<h4>계좌 종류 선택</h4>
								</div>
								<div class="col-12-small">
									<select name="account_type" id="account_type">
											<option value=""></option>
									</select>
								</div>

							</div>
							<div class="col-7 col-12-medium">
								<div class="col-12">
									<h4>계좌 비밀번호 입력</h4>
								</div>

								<div class="col-12">
									<input type="password" name="password" id="password" value=""
										placeholder="비밀번호 숫자 4자리" />
								</div>


								<br>

								<div class="col-12">
									<h4>계좌 별칭 입력</h4>
								</div>
								<div class="col-12">
									<input type="text" name="alias" id="alias" value=""
										placeholder="한글 계좌 별칭" />
								</div>


							</div>


							<!-- Break -->
							<div class="col-12" style="text-align: right; margin-top: 2em">
								<input type="button" value="다음" class="button primary large" onclick="nextStep()"/>
							</div>
						</div>
				</section>



				<div id="modal-after-section"></div>



				<!-- Modal -->
				<div id="alertModal" class="modal fade" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close button modalClose"
									data-dismiss="modal" style="box-shadow: none;">&times;</button>
								<h4 class="modal-title">알림</h4>
							</div>
							<div class="modal-body">
								<p id="alert-modal-body-msg"></p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn button primary"
									data-dismiss="modal">닫기</button>
							</div>
						</div>

					</div>
				</div>




			</div>
		</div>

		<!-- Sidebar -->
		<jsp:include page="/include/sidebar.jsp" />

	</div>

	<!-- Scripts -->
	<jsp:include page="/include/script.jsp" />
</body>
</html>