<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 사업자 인덱스 페이지 입니다. -->	

<jsp:include page="../include/businessHeader.jsp"></jsp:include>


<c:if test="${rvo.restaurant_accept == 1 }">
	사업자 등록 인증 안받음
	<div>
		매장입점신청
	</div>
</c:if>
<c:if test="${rvo.restaurant_accept == 0 }">
	사업자등록 인증받음
	<div>
		매장관리
	</div>
</c:if>


</body>
</html>