<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.footer {
	border-top: 2px solid black;
	margin: 20px;
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
.tablehead {
	margin: 50px 20px 0 0;
	width: 920px;
	height: 50px;
	background: #E4E4E4;
	border-top: 2px solid #878787;
	border-bottom: 2px solid #878787;
	border-left: 2px solid #878787;
	border-right: 2px solid #878787;
}
.orderId {
	float:left;
	margin: 0;
	padding: 0;
	width: 80px;
	height: 100%;
	border-right: 1px dashed #878787;
	font-size: 20px;	
	text-align: center;
}
.orderId > b {
	line-height:50px;
}
.orderId > a {
	line-height:50px;
}
.res-name {
	float:left;
	margin: 0;
	padding: 0;
	width: 150px;
	height: 100%;
	border-right: 1px dashed #878787;
	font-size: 20px;	
	text-align: center;
}
.res-name > b {
	line-height:50px;
}
.res-name > a {
	line-height:50px;
}
.trans-kinds {
	float:left;
	margin: 0;
	padding: 0;
	width: 80px;
	height: 100%;
	border-right: 1px dashed #878787;
	font-size: 20px;	
	text-align: center;
}
.trans-kinds > b {
	line-height:50px;
}
.trans-kinds > a {
	line-height:50px;
}
.ordermenu {
	float:left;
	margin: 0;
	padding: 0;
	width: 150px;
	height: 100%;
	border-right: 1px dashed #878787;
	font-size: 20px;	
	text-align: center;
}
.ordermenu > b {
	line-height:50px;
}
.pay-date {
	float:left;
	margin: 0;
	padding: 0;
	width: 150px;
	height: 100%;
	border-right: 1px dashed #878787;
	font-size: 20px;	
	text-align: center;
}
.pay-date > b {
	line-height:50px;
}
.pay-date > a {
	line-height:50px;
}
.price {
	float:left;
	margin: 0;
	padding: 0;
	width: 150px;
	height: 100%;
	border-right: 1px dashed #878787;
	font-size: 20px;	
	text-align: center;
}
.price > b {
	line-height:50px;
}
.price > a {
	line-height:50px;
}
.review {
	float:left;
	margin: 0;
	padding: 0;
	width: 150px;
	height: 100%;
	font-size: 20px;	
	text-align: center;
}
.review > b {
	line-height:50px;
}
.review > a {
	line-height:50px;
}
.tabletd {
	margin: 0;
	width: 920px;
	height: 50px;
	border-bottom: 1px dashed #878787;
	border-left: 2px solid #878787;
	border-right: 2px solid #878787;
}
.tabletd > div {
	font-size: 13px;	
}
</style>
</head>
<body>
<!-- 마이페이지 - 내 예약리스트 확인 페이지 입니다. -->
	<jsp:include page="../include/header.jsp" />
	<div class="orderhistory">
		<h1>예약 중인 주문</h1>
		<div class="orderhistorys">
			<div class="tablehead">
				<div class="orderId">
				<b>주문번호</b>
				</div>
				<div class="res-name">
				<b>매장명</b>
				</div>
				<div class="trans-kinds">
				<b>예약좌석</b>
				</div>
				<div class="ordermenu">
				<b>주문메뉴</b>
				</div>
				<div class="pay-date">
				<b>결제시간</b>
				</div>
				<div class="price">
				<b>좌석예약시간</b>
				</div>
				<div class="review">
				<b>금액</b>
				</div>
			</div>
			<c:choose>
			<c:when test="${ orderList == null}">
				<h2>주문내역없음</h2>
			</c:when>
			<c:otherwise>
					<c:forEach var="orderList" items="${orderList}" varStatus="status">
						<div class="tabletd">
							<div class="orderId">
								<a>${orderList.order_id }</a>
								<!-- 여기는 주문번호 출력하는곳 -->
							</div>
							<div class="res-name">
								<a>${restaurantList[status.index].restaurant_name }</a>
								<!-- 여기는 매장명 출력하는곳 -->
							</div>
							<div class="trans-kinds">
								<a>${seatOrderList[status.index].room_id}</a>
								<!-- 여기는 좌석타입 출력하는곳 -->
							</div>
							<div class="ordermenu">
								<a>${menuNameList[status.index]}</a>
								<!-- 여기는 주문메뉴와 갯수를 출력하는곳 -->
							</div>
							<div class="pay-date">
								<a>${orderList.order_date }</a>
								<!-- 여기는 결제시간 출력하는곳 -->
							</div>
							<div class="price">
								<a>${seatOrderList[status.index].reservation_time}</a>
								<!-- 여기는 예약시간 출력하는곳 -->
							</div>
							<div class="review">
								<a>${orderList.order_price}</a>
								<!-- 여기는 금액 출력하는곳 -->
							</div>
						</div>
					</c:forEach>
				</c:otherwise>			
			</c:choose>	
		</div>
	</div>
	<div class="footer">
		<jsp:include page="../include/footer.jsp"/>
		</div>
</body>
					
</html>