<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
table, th{
  	border: 1px solid black;
}
td {
	border: 1px dashed black;
}
.menuBar {
	position: fixed;
	top: 204px;
	left: 14%;
}
.orderhistory {
	width: 50%;
	margin: 30px 25%;
	height: auto;
}
.orderhistorys {
	width: 100%;
	border-top: 10px solid red;
	font-size: 25px;
}
.table1 {
	margin: 50px 0 0 0;
	width: 100%;
}
.tablehead {		
	height: 50px;
	background: #FCFCFC;
}
.td {
	text-align: center;
	font-size: 20px;
	color: #5D5D5D;
	height: 50px;
}
.paging {
	width: 150px;
	margin: 0 90%;
	font-size: 20px;
}
</style>
<link rel="stylesheet" type="text/css" href="resources/CSS/reservationList.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<body>
<!-- 마이페이지 1:1 문의 페이지 입니다. -->
	<jsp:include page="../include/businessHeader.jsp" />
	<div class="menuBar">
	<jsp:include page="../include/menuBar.jsp" />
	</div>	
	<div class="orderhistory">
	<div id="content_div">
		<div id="upper_div">
			<h1>${rvo.restaurant_name } 예약 관리</h1>	
		</div>		
			<div class="orderhistorys">						
			<div class="table1">
			
			<table style="border-collapse: collapse;">
					<tr class="tablehead">
						<th>이용시간</th>
						<th>이용좌석</th>
						<th>이용회원</th>
						<th>연락처</th>
						<th>비고</th>
						<th>현황</th>
					</tr>
					<c:forEach var="relist" items="${relist }">
					
					<tr class="td">
						<td>
							<a><fmt:formatDate value="${relist.reservation_time }" pattern="yyyy년 MM월 dd일 HH:mm"/></a>
						</td>
							
						<td>
								<a>${relist.room_id }</a>
						</td>
							
						<c:forEach var="ulist" items="${ulist }">
						<c:if test="${relist.user_id == ulist.user_id }">
						<td>	
								<a>${ulist.user_name }</a>
						</td>
							
						<td>
								<a>${ulist.user_tell }</a>
						</td>
						</c:if>	
						</c:forEach>
						<td>
								<a>${relist.request }</a>
						</td>
							
						<td>
								<a>여기 이용 현황</a>
						</td>
					</tr>
					</c:forEach>
				</table>
					
				</div>
				
				<hr>
				<div class="paging"> <!-- 페이징 위치 -->
					<c:if test="${paging.startPage != 1 }">
						<a href="reservation_list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a href="reservation_list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="reservation_list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div> 
			</div>
		</div>
	</div>
</body>
					
</html>