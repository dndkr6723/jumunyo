<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="scripts/moments.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

</head>

<body>
<!-- 매장 거래내역 페이지 입니다. -->

<div id="window_div">
	<div id="content_div">
		<div id="upper_div">
			<div>
				${rvo.restaurant_name } 거래내역
			</div>
			
			<div>
				주문번호 검색<input type="text" name="search_order_id">
				<input type="button" value="상세검색" id="search_detail_btn">
			</div>
		</div>
		
		<div id="under_div"> <!-- 이건 flex -->
			<div>
				여기는 사이드 메뉴바
			</div>
			
			<div> <!-- 메인 구현부 -->
				<table border="1">
					<tr>
						<th>주문번호</th>
						<th>거래종류</th>
						<th>이용시간</th>
						<th>이용좌석</th>
						<th>금액</th>
					</tr>
					<c:forEach var="dealorder_list" items="${dealorder_list }">
						<tr>
							<td>
								${dealorder_list.order_id }
							</td>
							
							<td>
								${dealorder_list.order_type }
							</td>
							
							<td>
								<fmt:formatDate value="${dealorder_list.order_date }" pattern="yyyy년 MM월 dd일 HH:mm"/>
							</td>
							
							<td>
								<%-- ${olist.seat_order_id } --%> 예약자리
							</td>
							
							<td>
								${dealorder_list.order_price }
							</td>
							
						</tr>
					</c:forEach>
				</table>
				
				<div id="search_detail_modal" class="modal fade">
					나는 모달
					<form action="order_search_detail" method="post">
						시간별 검색
							<div>
								<input type="date" id="far_time" name="far_time"> ~
								<input type="date" id="last_time" name="last_time">
							</div>
						금액별 검색
							<div>
								<input type="text" id="min_price" name="min_price" placeholder="최소값"> 원 ~
								<input type="text" id="max_price" name="max_price" placeholder="최대값"> 원 
							</div>
						거래종류별 검색
							<div>
								<input type="radio" id="deliver" name="order_type1" value="배달"> 배달
								<input type="radio" id="reservation" name="order_type1" value="예약"> 예약
								<input type="radio" id="all" name="order_type1" value="all"> 전체
							</div>
						<input type="hidden" value="first_search" name="first_search">
						<input type="submit" value="검색">
					</form>
				</div>
				
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
	</div>
</div>
</body>

<script>
    $('#search_detail_btn').click(function(){
            $('#search_detail_modal').modal('show');
    });
</script>

</html>