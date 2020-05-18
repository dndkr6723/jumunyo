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
	background: #EAEAEA;
}
.advert {
	width: 40%;
	height: 300px;
	margin: 50px 30% 50px 30%;
	border: black solid 1px;
}
.menucollection {
	width: 50%;
	height: 450px;
	margin: 20px 25% 50px 25%;
	border: black solid 1px;
	background: #D9E5FF;
}
.menumanege {
	float: left;
	margin: 25px 70px 25px 110px;
	background: white;
	width: 150px;
	height: 180px;
	background: #D9E5FF;
}
.menumanegeimg {
	border: black solid 1px;
	border-radius: 100px;
	background: white;
	width: 150px;
	height: 150px;
}
.menumaneges {
	text-align: center;
}
.transaction {
	float: left;
	margin: 25px 70px;
	background: white;
	width: 150px;
	height: 180px;
	background: #D9E5FF;
}
.transactionimg {
	border: black solid 1px;
	border-radius: 100px;
	background: white;
	width: 150px;
	height: 150px;
}
.transactions {
	text-align: center;
}
.review {
	float: left;
	margin: 25px 70px;
	background: white;
	width: 150px;
	height: 180px;
	background: #D9E5FF;
}
.reviewimg {
	border: black solid 1px;
	border-radius: 100px;
	background: white;
	width: 150px;
	height: 150px;
}
.reviews {
	text-align: center;
}
.questionList {
	float: left;
	margin: 25px 70px 25px 110px;
	background: white;
	width: 150px;
	height: 180px;
	background: #D9E5FF;
}
.questionListimg {
	border: black solid 1px;
	border-radius: 100px;
	background: white;
	width: 150px;
	height: 150px;
}
.questionLists {
	text-align: center;
}
.customer {
	float: left;
	margin: 25px 70px;
	background: white;
	width: 150px;
	height: 180px;
	background: #D9E5FF;
}
.customerimg {
	border: black solid 1px;
	border-radius: 100px;
	background: white;
	width: 150px;
	height: 150px;
}
.customers {
	text-align: center;
}
.logo {
	float: left;
	margin: 25px 70px;
	background: white;
	width: 150px;
	height: 180px;
	background: #D9E5FF;
}
.logoimg {
	border: black solid 1px;
	border-radius: 100px;
	background: white;
	width: 150px;
	height: 150px;
}
</style>
<link rel="stylesheet" type="text/css" href="resources/CSS/businessmenu.css">
</head>
<body>
<!-- 매장 정보 메인수정 페이지 입니다. -->
	<jsp:include page="../include/businessHeader.jsp" />
	<div class="advert">
		
	</div>
	<div class="menucollection">
		<div class="menumanege">
		<div class="menumanegeimg">
		<img src="resources/image/menumanege.jpg" alt="" width="100%" height="100%" style="border-radius: 100px;"/>
		</div>
	<div class="menumaneges">
		<a href="menu_list" style="text-decoration:none;"><b>매장 메뉴 관리</b></a>
		</div>
		</div>
		<div class="transaction">
		<div class="transactionimg">
		<img src="resources/image/menumanege.jpg" alt="" width="100%" height="100%" style="border-radius: 100px;"/>
		</div>
		<div class="transactions">
		<a href="dealorder_list" style="text-decoration:none;"><b>매장 거래 내역</b></a>
		</div>
		</div>
		<div class="review">
		<div class="reviewimg">
		<img src="resources/image/menumanege.jpg" alt="" width="100%" height="100%" style="border-radius: 100px;"/>
		</div>
		<div class="reviews">
		<a href="review_list" style="text-decoration:none;"><b>매장 리뷰 관리</b></a>
		</div>
		</div>
		<div class="questionList">
		<div class="questionListimg">
		<img src="resources/image/menumanege.jpg" alt="" width="100%" height="100%" style="border-radius: 100px;"/>
		</div>
		<div class="questionLists">
		<a href="question_list" style="text-decoration:none;"><b>1:1 문의 게시판</b></a>
		</div>
		</div>
		<div class="customer">
		<div class="customerimg">
		<img src="resources/image/menumanege.jpg" alt="" width="100%" height="100%" style="border-radius: 100px;"/>
		</div>
		<div class="customers">
		<a href="Index.do" style="text-decoration:none;"><b>일반 페이지로 이동</b></a>
		</div>
		</div>
		<div class="logo">
		<div class="logoimg">
		<img src="resources/image/menumanege.jpg" alt="" width="100%" height="100%" style="border-radius: 100px;"/>
		</div>
		</div>
	</div>
	
</body>
</html>