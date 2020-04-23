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

여기 바디
${rvo.restaurant_accept}

<c:if test="${rvo.restaurant_accept != 1 }">
	맞음
</c:if>
<c:if test="${rvo.restaurant_accept != 0 }">
	트림
</c:if>


</body>
</html>