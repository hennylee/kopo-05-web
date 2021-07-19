<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<jsp:include page="/include/head.jsp" />
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<jsp:include page="/include/header.jsp" />

				<section>
					<!-- Table -->
					<header class="major">
						<h2>Q&A 게시판</h2>
					</header>

					<div style="float: right;margin-bottom: 20px;">
						<ul class="icons">
							<li><a href="<%=request.getContextPath()%>/qna/update.do"
								class="button small">수정</a></li>
							<li><a href="<%=request.getContextPath()%>/qna/insertForm.do"
								class="button small">새글등록</a></li>
						</ul>
					</div>


<div>
					<div class="table-wrapper" style="overflow-x: initial;">

						<table>
							<thead>
								<tr>
									<th style="width: 10%;">글번호</th>
									<th style="width: 50%;">글제목</th>
									<th>글쓴이</th>
									<th>등록일</th>
									<th style="width: 10%;">조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>제목</td>
									<td>글쓴이</td>
									<td>등록일</td>
									<td>조회수</td>
								</tr>

							</tbody>
							<tfoot>
								<tr>
									<td colspan="2"></td>
									<td>100.00</td>
								</tr>
							</tfoot>
						</table>

</div>



						<ul class="pagination" style="float: none;">
							<li><span class="button disabled">Prev</span></li>
							<li><a href="#" class="page active">1</a></li>
							<li><a href="#" class="page">2</a></li>
							<li><a href="#" class="page">3</a></li>
							<li><span>&hellip;</span></li>
							<li><a href="#" class="page">8</a></li>
							<li><a href="#" class="page">9</a></li>
							<li><a href="#" class="page">10</a></li>
							<li><a href="#" class="button">Next</a></li>
						</ul>









					</div>











				</section>






			</div>
		</div>

		<!-- Sidebar -->
		<jsp:include page="/include/sidebar.jsp" />

	</div>

	<!-- Scripts -->
	<jsp:include page="/include/script.jsp" />
</body>
</html>