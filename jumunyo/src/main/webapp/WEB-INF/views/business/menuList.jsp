<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	background: #FCFCFC;
	border-top: 2px solid #878787;
	border-bottom: 2px solid #878787;
	border-left: 2px solid #878787;
	border-right: 2px solid #878787;
}
.orderId {
	float:left;
	margin: 0;
	padding: 0;
	width: 200px;
	height: 100%;
	border-right: 1px dashed #878787;
	font-size: 20px;	
	text-align: center;
}
.orderId > b {
	line-height:50px;
}
.title {
	float:left;
	margin: 0;
	padding: 0;
	width: 160px;
	height: 100%;
	border-right: 1px dashed #878787;
	font-size: 20px;	
	text-align: center;
}
.title > b {
	line-height:50px;
}
.title > a {
	line-height:50px;
}
.trans-kinds {
	float:left;
	margin: 0;
	padding: 0;
	width: 330px;
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
.created {
	float:left;
	margin: 0;
	padding: 0;
	width: 226px;
	height: 100%;
	font-size: 20px;	
	text-align: center;
}
.created {
	line-height:50px;
}
.created {
	line-height:50px;
}
.tabletd {
	margin: 0;
	width: 920px;
	height: 50px;
	border-bottom: 1px dashed #878787;
	border-left: 2px solid #878787;
	border-right: 2px solid #878787;
	background: white;
}
.tabletd > div {
	font-size: 13px;	
}
.modals {
	background: #F15F5F;
	width: auto;
	height: 700px;
	border-radius: 15px;
}
.textarea {
	margin: 20px 0 20px 60px;
	width: 300px;
	height: 50px;
	border: 1px solid black;
	border-radius: 10px; 
	text-align: center;
	line-height: 50px;
	background: #ED4C00;	
}
.texttitle {
	margin: 20px 0 20px 60px;
	width: 300px;
	height: 50px;
	border: 1px solid black;
	border-radius: 10px; 
	text-align: center;
	line-height: 50px;
	background: #ED4C00;
}
.select {
	margin: 20px 0 20px 60px;
	width: 300px;
	height: 50px;
	border: 1px solid black;
	border-radius: 10px; 
	text-align: center;
	line-height: 50px;
	background: #ED4C00;	
}
.sub {
	margin: 0 0 10px 610px;
	width: 320px;
}
.button1 {
	float:left;
	width: 150px;
	height: auto;
	text-align: center;
	padding: 5px;
}
.button2 {
	float:left;
	width: 150px;
	height: auto;
	text-align: center;
	padding: 5px;
}
.quest-submit {
	margin: 0 0 20px 60px;
	width: 100%;
}
.filebox {
	margin: 0 60px;
}
.menuBar {
	position: fixed;
	top: 204px;
	left: 14%;	
}
.dateTitle {
	margin: 0 0 20px 60px;
	width: 100%;
}
.date {
	margin: 20px 0 20px 60px;
	width: 300px;
	height: 50px;
	border: 1px solid black;
	border-radius: 10px; 
	text-align: center;
	line-height: 50px;
	background: #ED4C00;
}
.q-title {
	margin: 0 0 20px 60px;
	width: 100%;
}
.q-content {
	margin: 20px 0 20px 60px;
	width: 300px;
	height: auto;
	border: 1px solid black;
	border-radius: 10px; 
	text-align: center;
	line-height: 50px;
	background: #ED4C00;
}
.paging {
	width: 150px;
	margin: 0 90%;
	font-size: 20px;
}
</style>
<link rel="stylesheet" type="text/css" href="resources/CSS/menuList.css">
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
							<input type="submit" value="신규등록"
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
							<img src="resources/image/Pizza.png" alt="" width="98%" height="90%"/>
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