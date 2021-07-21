<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#searchResult{
		border: 1px solid red;
		width : 800px;
		height : 600px
	}
</style>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('#searchBtn').click(function(){
			
			let date = $('#searchDate').val()
	// 		console.log('date:' + date) => 2021-07-20 의 형태를 20210720으로 바꿔줘야 함!
			date = date.split('-').join('')
			
			$.ajax({
				type : 'get',
				url : 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json',
				data : {
					key : 'f9402fa11bb37d5dd582bec07d07df9e',
					targetDt : date,
					itemPerPage : 5
				},
				datatype : 'jsonp',
				success : callback,
				error : function(){
					alert('실패')
				}
			})
		})
	})
	
	
	function callback(data){
		let list = data.boxOfficeResult.dailyBoxOfficeList
		$('#searchResult').empty()
		
		
		for(let i = 0; i < list.length; i++){
			let movie = list[i]
			let rank = movie.rank
			let movieNm = movie.movieNm
			let movieAcc = movie.audiAcc
			console.log(movieNm)
			
			$('#searchResult').append('<hr>')
			$('#searchResult').append('<h4>' + rank + '위</h4>')
			$('#searchResult').append('<strong>' + movieNm + '</strong>')
			$('#searchResult').append('<p> (누적 관객 수 : ' + movieAcc + '명)</p>') 
			
/* 			$('#searchResult').html('<hr>')
			$('#searchResult').html('<h4>' + rank + '위</h4>')
			$('#searchResult').html('<strong>' + movieNm + '위</strong>')
			$('#searchResult').html('<p> (누적 관객 수 : ' + movieAcc + '명)</p>') */
		}
	}
</script>
</head>
<body>
	<h2>일별 박스오피스 순위 조회</h2>
	검색일 : <input type="date" id="searchDate">
	<button id="searchBtn">검색</button>
	
	<h4>검색 결과</h4>
	<div id="searchResult"></div>
</body>
</html>