<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../CSS/menuList.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<body>
<!-- 매장 메뉴 출력 페이지 입니다. -->
	<jsp:include page="../include/businessHeader.jsp" />
	<div class="menuBar">
	<jsp:include page="../include/menuBar.jsp" />
	</div>	
	<div class="orderhistory">
	<div id="content_div">
		<div id="upper_div">
			<h1>${rvo.restaurant_name } 메뉴 관리</h1>	
		</div>		
			<div class="orderhistorys">										
						<div class="tablehead">
						<div class="orderId">
						<b>메뉴 이름</b>
						</div>
						<div class="title">
						<b>가격</b>
						</div>
						<div class="trans-kinds">
						<b>이미지</b>
						</div>
						<div class="created">
						<form action="go_menu_add">									
							<input type="submit" value="신규등로"
							style="width: 150px; height: 40px; background: red; border-radius: 10px;">												
						</form>
						</div>
						
						</div>
					
					
				<c:forEach var="mlist" items="${mlist }" varStatus="loop">
					<div class="tabletd">							
						<div class="orderId">
							<input type="hidden" value="${mlist.menu_id }" name="menu_id" id="menu_id${loop.count}">
							<input type="text" value="${mlist.menu_name }" name="menu_name" disabled="disabled"
							style="width: 98%; height: 90%; background: white; border: none;">
						</div>	
						<div class="title">
							<input type="text" value="${mlist.menu_price }" name="menu_price" disabled="disabled"
							style="width: 98%; height: 90%; background: white; border: none;">
						</div>						
						<div class="trans-kinds">
							<img src="../image/Pizza.png" alt="" width="98%" height="90%"/>
						</div>
						<div class="created">
							<form action="go_menu_modify?menu_id=${mlist.menu_id }" method="post"><input type="submit" value="수정" id="m_modify${loop.count}"
							style="float: left; width: 45%; height: 42px; margin: 4px; background: #00D8FF; border-radius: 5px;"></form>
							<form action="menu_delete?menu_id=${mlist.menu_id }" method="post"><input type="submit" value="삭제" id="m_delete${loop.count}"
							style="float: left; width: 45%; height: 42px; margin: 4px; background: #FFE08C; border-radius: 5px;"></form>
						</div>	
					</div>
				</c:forEach>
				</div>
				
				<hr>
				<div class="paging"> <!-- 페이징 위치 -->
					<c:if test="${paging.startPage != 1 }">
						<a href="menu_list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a href="menu_list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="menu_list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>
			</div>
		</div>
	
</body>
					
</html>