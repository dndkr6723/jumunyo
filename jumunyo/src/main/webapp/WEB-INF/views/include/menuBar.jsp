<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	margin: 0;
	padding: 0;
}
.menuBar {
	width: 10%;
	height: 600px;
	background: #D9E5FF;
}
.menu {
	padding: 40px 20px 10px 20px;
}
.menuul {
	display: none;
}
.transaction {
	padding: 0 20px 10px 20px;
}
.reviewList {
	padding: 0 20px 10px 20px;
}
.reservationList {
	padding: 0 20px 10px 20px;
}
.questionList {
	padding: 0 20px 10px 20px;
}
</style>
</head>
<body>
	<div class="menuBar">
		<div class="menu">
		<div onclick="display1('menuul1');"><b>매장 메뉴 관리</b></div>
		<ul class="menuul" id="menuul1">
		<li>메뉴 관리</li>
		<li>좌석 관리</li>
		</ul>
		<script>
			function display1(id) {
				if(document.getElementById(id).style.display=="block") {
					document.getElementById(id).style.display="none";
				} else{
					document.getElementById(id).style.display="block";
				} 					
			}
		</script>
		</div>
		<div class="transaction">
		<div onclick="display1('menuul2');"><b>매장 거래 내역</b></div>
		<ul class="menuul" id="menuul2">
		<li>거래 내역</li>
		<li>매출 현황</li>
		</ul>
		<script>
			function display1(id) {
				if(document.getElementById(id).style.display=="block") {
					document.getElementById(id).style.display="none";
				} else{
					document.getElementById(id).style.display="block";
				} 					
			}
		</script>
		</div>
		<div class="reviewList">
		<div><b>매장 리뷰 관리</b></div>
		
		</div>
		<div class="reservationList">
		<div><b>매장 예약 관리</b></div>
		
		</div>
		<div class="questionList">
		<div onclick="display1('menuul3');"><b>1:1 문의 게시판</b></div>
		<ul class="menuul" id="menuul3">
		<li>게시판 보기</li>
		<li>문의 작성</li>
		</ul>
		<script>
			function display1(id) {
				if(document.getElementById(id).style.display=="block") {
					document.getElementById(id).style.display="none";
				} else{
					document.getElementById(id).style.display="block";
				} 					
			}
		</script>
		</div>
	</div>

</body>
</html>