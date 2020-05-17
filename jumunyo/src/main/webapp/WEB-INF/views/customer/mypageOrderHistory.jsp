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
.review > input {
	margin: 10px;
	background: #F361DC;
	color: white;
	border-radius: 5px;
}
.review > b {
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<body>
			<% int[] review_check = {0,1}; %>
<!-- 마이페이지 - 과거 이용내역 확인 페이지 입니다. -->
	<jsp:include page="../include/header.jsp" />
	<div class="orderhistory">
		<h1>과거 이용 내역</h1>
		<div class="orderhistorys">
			<div class="tablehead">
				<div class="orderId">
				<b>주문번호</b>
				</div>
				<div class="res-name">
				<b>매장명</b>
				</div>
				<div class="trans-kinds">
				<b>거래종류</b>
				</div>
				<div class="ordermenu">
				<b>주문메뉴</b>
				</div>
				<div class="pay-date">
				<b>결제시간</b>
				</div>
				<div class="price">
				<b>금액</b>
				</div>
				<div class="review">
				<b>리뷰</b>
				</div>
			</div>
			<% int count = 0; %>
			<c:choose>
			<c:when test="${orderList2 ==null}">
				<h2>주문내역없음</h2>
			</c:when>
			<c:otherwise>
			<c:forEach var="orderList2" items="${orderList2}" varStatus="status">
			<%count++; %>
			<form action="mypageInsertReviewPage.do" method="post">
			<div class="tabletd">
				
				<div class="orderId">
				<a>${orderList2.order_id }</a> <!-- 여기는 주문번호 출력하는곳 -->
				<%-- <input type="hidden" name="order_id" value="<!-- 여기는 주문번호 넣어서 백으로 보내기 -->" /> --%>
				</div>
				<div class="res-name">
				<a>${restaurantList2[status.index].restaurant_name }</a> <!-- 여기는 매장명 출력하는곳 -->
				<input type="hidden" name="restaurant_name" value="${restaurantList2[status.index].restaurant_name }" />
				<input type="hidden" name="restaurant_id" value="${restaurantList2[status.index].restaurant_id }" />
				</div>
				<div class="trans-kinds">
				<a>${orderList2.order_type}</a> <!-- 여기는 거래종류 출력하는곳 -->
			<%-- 	<input type="hidden" name="order_type" value="<!-- 여기는 거래종류 넣어서 백으로 보내기 -->" /> --%>
				</div>
				<div class="ordermenu">
				<a>${menuNameList2[status.index]}</a> <!-- 여기는 주문메뉴와 갯수를 출력하는곳 -->
				</div>
				<div class="pay-date">
				<a>${orderList2.order_date }</a> <!-- 여기는 결제시간 출력하는곳 -->
				</div>
				<div class="price">
				<a>${orderList2.order_price}</a> <!-- 여기는 금액 출력하는곳 -->
				</div>
				<div class="review">
					<c:choose>
						<c:when test="${reviewList2[status.index].review_check == 1}">
					<b style="line-height:50px; font-size: 15px; color: red;">작성완료</b>
					</c:when>						
						<c:otherwise>				
					<input type="submit" value="리뷰작성" />
					</c:otherwise>
					</c:choose>	
				</div>						
			</div>	
			</form>						
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