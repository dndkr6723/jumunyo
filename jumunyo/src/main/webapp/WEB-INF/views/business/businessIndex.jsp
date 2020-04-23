<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<style>

#window_div{
	display: flex;
}

#contetn_div{
	background : aqua;
	width : 50%;
	margin-left: 25%;
	margin-right: 25%;
}

#business_ad{
	height : 200px;
	width : 300px;
	background : yellow;
}

#b_index{
	height : 200px;
	width : 300px;
	background : yellow;
}

</style>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 사업자 인덱스 페이지 입니다. -->	

<jsp:include page="../include/businessHeader.jsp"></jsp:include>

<div id=window_div>

	<div id=contetn_div>
		<div id=business_ad align="center">
			<div>
				여기 사업자 광고	
			</div>
		</div>
		
		<c:if test="${rvo.restaurant_accept == 1 }">
			사업자 등록 인증 안받음
			<div id="b_index" align="center">
				<a href="">매장입점신청</a>
			</div>
		</c:if>
		<c:if test="${rvo.restaurant_accept == 0 }">
			사업자등록 인증받음
			<div id="b_index" align="center">
				<a href="gomenu">매장관리</a>
			</div>
		</c:if>
	</div>
</div>

</body>
</html>