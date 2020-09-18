<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	margin: 50px 30% 100px 30%;
	border: black solid 1px;
}
.apply {
	width: 40%;
	height: 300px;
	margin: 50px 30% 100px 30%;
	border: black solid 1px;
	background: white;
}
.applyImg {
	float: left;
	width: 40%;
	height: 100%;
	margin: 0;
	padding: 0;
	border: black solid 1px;
}
.applyText {
	float: left;
	width: 55%;
	height: 90%;
	
}
.applyText > b {
	font-size: 30px;
	margin: 0 100px;
	line-height:300px;
}
</style>
<link rel="stylesheet" type="text/css" href="/resources/CSS/businessIndex.css">
</head>
<body>
<% int restaurant_accept = 1; %>
<!-- 사업자 인덱스 페이지 입니다. -->
	<jsp:include page="../include/businessHeader.jsp" />
	<div class="advert">
		<img id="image" src="resources/image/adv2.jpg" width="100%" height="100%" >
	</div>
	<%if(restaurant_accept == 0) {%>
	<a href="goentrance" style="text-decoration: none;">
	<div class="apply">
		<div class="applyImg">
		<img src="resources/image/apply.jpg" alt="매장 입점 신청" width="100%" height="100%" />
		</div>
		<div class="applyText"><b>매장 입점 신청</b></div>
	</div>
	</a>
	<%} else {%> 
	<a href="gomenu" style="text-decoration: none;">
	<div class="apply">
		<div class="applyImg">
		<img src="resources/image/infomanage.png" alt="매장 정보 관리" width="100%" height="100%" />
		</div>
		<div class="applyText"><b>매장 정보 관리</b></div>
	</div>
	</a>
	<%} %>
</body>
</html>