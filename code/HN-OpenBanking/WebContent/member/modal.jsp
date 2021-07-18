<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
      function CloseModal(){
         var CloseModal = document.querySelector(".container");
         CloseModal.classList.add("CloseModal");
      }
</script>
<style>
	  .container.CloseModal{
         display:none;
      }
</style>
</head>
<body>
	<div>
	본문입니다.
	</div>
	<div class="container">
	      <div class="modal">
	         <button onclick="CloseModal();">x</button>
	         <h1>- Happy New Year 2021 -</h1>
	         <h2>2021년 신축년 (辛丑年) </h2>
	         <h2>새해 복 많이 받으세요!</h2>
	         <figure>사진 자리</figure>
	      </div>
	</div>
</body>
</html>