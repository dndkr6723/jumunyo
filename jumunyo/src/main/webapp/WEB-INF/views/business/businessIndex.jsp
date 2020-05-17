<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../CSS/businessIndex.css">
</head>
<body>
<% int restaurant_accept = 0; %>
<!-- 사업자 인덱스 페이지 입니다. -->
	<jsp:include page="../include/businessHeader.jsp" />
	<div class="advert">
		
	</div>
	<%if(restaurant_accept == 1) {%>
	<a href="" style="text-decoration: none;">
	<div class="apply">
		<div class="applyImg">
		<img src="../image/apply.jpg" alt="매장 입점 신청" width="100%" height="100%" />
		</div>
		<div class="applyText"><b>매장 입점 신청</b></div>
	</div>
	</a>
	<%} else {%> 
	<a href="" style="text-decoration: none;">
	<div class="apply">
		<div class="applyImg">
		<img src="../image/infomanage.png" alt="매장 정보 관리" width="100%" height="100%" />
		</div>
		<div class="applyText"><b>매장 정보 관리</b></div>
	</div>
	</a>
	<%} %>
</body>
</html>