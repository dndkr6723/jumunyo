<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../CSS/dealRecord.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<body>
	<jsp:include page="../include/businessHeader.jsp" />
	<div class="menuBar">
	<jsp:include page="../include/menuBar.jsp" />
	</div>	
	<div class="orderhistory">
	<div id="content_div">
		<div id="upper_div">
			<h1>${rvo.restaurant_name } 거래 내역</h1>	
		</div>		
			<div class="orderhistorys">		
			<div class="sub">
			<span class="button1" >				
					<a href="#quest" rel=modal:open
					style="text-decoration: none; font-size: 15px;">
					상세검색</a>						
			</span>
		</div>		
		<div id="quest" class="modal">
					<div class="modals">
					<form action="order_search_detail" method="post">
					<div style="margin: 0; padding: 10px 10px; ">
						<b>시간별 검색</b>
							<div style="margin: 0; padding: 30px 10px; ">
								<input type="date" id="far_time" name="far_time" 
								style="width: 300px; height: 30px;" > <b>~</b>
								<input type="date" id="last_time" name="last_time" 
								style="width: 300px; height: 30px;" >
							</div>
					</div>
					<div style="margin: 0; padding: 10px 10px; ">
						<b>금액별 검색</b>
							<div style="margin: 0; padding: 30px 10px; ">
								<input type="text" id="min_price" name="min_price" placeholder="최소값"
								style="width: 300px; height: 30px;" > 원 ~
								<input type="text" id="max_price" name="max_price" placeholder="최대값"
								style="width: 300px; height: 30px;" > 원 
							</div>
					</div>
					<div style="margin: 0; padding: 10px 10px; ">
						<b>거래종류별 검색</b>
							<div>
								<label for="deliver"><input type="radio" id="deliver" name="order_type1" value="배달"> 배달</label>
								<label for="reservation"><input type="radio" id="reservation" name="order_type1" value="예약"> 예약</label>
								<label for="all"><input type="radio" id="all" name="order_type1" value="all"> 전체</label>
							</div>
					</div>
					<div style="margin: 0; padding: 10px 20px; ">
						<input type="submit" value="검색"
						style="width: 300px; height: 30px; background: red; border-radius: 5px;">
					</div>
					</form>
				</div>	
				</div>		
						<div class="tablehead">
						<div class="orderId">
						<b>주문번호</b>
						</div>
						<div class="title">
						<b>거래종류</b>
						</div>
						<div class="trans-kinds">
						<b>이용시간</b>
						</div>
						<div class="created">
						<b>금액</b>
						</div>
						
						</div>
					
					
				<c:forEach var="dealorder_list" items="${dealorder_list }">
					<div class="tabletd">
						<div class="orderId">
							${dealorder_list.order_id }
						</div>						
						<div class="res-name">
							${dealorder_list.order_type }
						</div>
						<div class="trans-kinds">
							${dealorder_list.order_date }
						</div>
						<div class="ordermenu">
							${dealorder_list.order_price }
						</div>
						
					</div>

				
				
				</c:forEach>
				</div>
				
				<hr>
				<c:if test="${o_search_detail == null }"> <!-- 조건 없이 검색할때 뜨는 페이징 -->
				<div> <!-- 페이징 div 임시 -->
					<c:if test="${paging.startPage != 1 }">
						<a href="dealorder_list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a href="dealorder_list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="dealorder_list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>
				</c:if>
				
				<c:if test="${o_search_detail != null }"> <!-- 조건 걸고 찾는 페이징 -->
				<div>
					<c:if test="${paging.startPage != 1 }">
						<a href="order_search_detail?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a href="order_search_detail?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="order_search_detail?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>
				</c:if>
			</div>
		</div>
	
</body>		
</html>