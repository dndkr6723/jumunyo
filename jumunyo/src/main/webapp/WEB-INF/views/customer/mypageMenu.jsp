<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.myPage {
	width: 50%;
	margin: 300px 25%;
	height: 400px;
}
.myInfo {
	float: left;
	width: 47%;
	height: 100px;
	border: 5px solid #EAEAEA;
	border-radius: 10px;
	margin: 2px 2px 2px 2px;	
}
.ordering {
	float: left;
	width: 47%;
	height: 100px;
	border: 5px solid #EAEAEA;
	border-radius: 10px;
	margin: 2px 2px 2px 2px;
}
.ordered {
	float: left;
	width: 47%;
	height: 100px;
	border: 5px solid #EAEAEA;
	border-radius: 10px;
	margin: 2px 2px 2px 2px;
}
.question {
	float: left;
	width: 47%;
	height: 100px;
	border: 5px solid #EAEAEA;
	border-radius: 10px;
	margin: 2px 2px 2px 2px;
}
input {
	width: 100%;
	height: 100%;
	border-bottom-style: double;
	background: white;
	border-radius: 10px;
	color: blue;
	font-size: 19px;
	font-family: sans-serif;
}
.footer {
	border-top: 2px solid black;
	margin: 20px;
}
</style>
<script>
	function changecolor(id) {
		document.getElementById(id).style.background ="#EAEAEA";
		document.getElementById(id).style.borderBottomStyle ="outset";
		document.getElementById(id).style.color="red";
		document.getElementById(id).style.fontSize="20px";
	}
	function changeback(id) {
		document.getElementById(id).style.background ="white";
		document.getElementById(id).style.borderBottomStyle ="double";
		document.getElementById(id).style.color="blue";
		document.getElementById(id).style.fontSize="19px";
	}
</script>
</head>
<body>
		<jsp:include page="../include/header.jsp" />
		<div class="myPage">
		<form action="mypageCheckPage.do">
		<div class="myInfo">
		<input type="submit" value="내 정보 보기" id="info1" onmouseover="changecolor('info1');" onmouseout="changeback('info1');"/>
		</div>
		</form>
		<form action="mypageReservationList.do">
		<div class="ordering">
		<input type="submit" value="진행중인 주문" id="ordering1" onmouseover="changecolor('ordering1');" onmouseout="changeback('ordering1');"/>
		</div>
		</form>
		<form action="mypageOrderHistory.do">
		<div class="ordered">
		<input type="submit" value="과거 이용 내역" id="ordered1" onmouseover="changecolor('ordered1');" onmouseout="changeback('ordered1');"/>
		</div>
		</form>
		<form action="mypageQuestionList.do">
		<div class="question">
		<input type="submit" value="1:1 문의" id="question1" onmouseover="changecolor('question1');" onmouseout="changeback('question1');"/>
		</div>
		</form>
		</div>
		<div class="footer">
		<jsp:include page="../include/footer.jsp"/>
		</div>
</body>
</html>