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
	height: auto;
	background: #D9E5FF;
	border: 1px solid black;
	border-radius: 5px;
}
.menu {
	margin: 30px 10px 10px 12px;
	padding: 10px 20px 10px 20px;
	
	width:120px;
	background: #B2CCFF;
}
.menuul {
	display: none;
	font-size: 13px;
}
.menuul > li {
	margin: 6px 0;
}
.transaction {
	margin: 0 10px 10px 12px;
	padding: 10px 20px 10px 20px;
	width:120px;
	background: #B2CCFF;
}
.reviewList {
	margin: 0 10px 10px 12px;
	padding: 10px 20px 10px 20px;
	width:120px;
	background: #B2CCFF;
}
.reservationList {
	margin: 0 10px 10px 12px;
	padding: 10px 20px 10px 20px;
	width:120px;
	background: #B2CCFF;
}
.questionList {
	margin: 0 10px 10px 12px;
	padding: 10px 20px 10px 20px;
	width:120px;
	background: #B2CCFF;
}
</style>
</head>
<body>
	<div class="menuBar">
		<div class="menu" onmouseover="this.style.background='#C4DEFF'" onmouseout="this.style.background='#B2CCFF'">
		<div onclick="display1('menuul1');"><b>매장 메뉴 관리</b></div>
		<ul class="menuul" id="menuul1">
		<li><a href="" style="text-decoration: none;">메뉴 관리</a></li>
		<li><a href="" style="text-decoration: none;">좌석 관리</a></li>
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
		<div class="transaction" onmouseover="this.style.background='#C4DEFF'" onmouseout="this.style.background='#B2CCFF'">
		<div onclick="display1('menuul2');"><b>매장 거래 내역</b></div>
		<ul class="menuul" id="menuul2">
		<li><a href="" style="text-decoration: none;">거래 내역</a></li>
		<li><a href="" style="text-decoration: none;">매출 현황</a></li>
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
		<div><a href="" style="text-decoration: none;color: black;"><b>매장 리뷰 관리</b></a></div>
		
		</div>
		<div class="reservationList">
		<div><a href="" style="text-decoration: none;color: black;"><b>매장 예약 관리</b></a></div>
		
		</div>
		<div class="questionList" onmouseover="this.style.background='#C4DEFF'" onmouseout="this.style.background='#B2CCFF'">
		<div onclick="display1('menuul3');"><b>1:1 문의 게시판</b></div>
		<ul class="menuul" id="menuul3">
		<li><a href="" style="text-decoration: none;">게시판 보기</a></li>
		<li><a href="" style="text-decoration: none;">문의 작성</a></li>
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