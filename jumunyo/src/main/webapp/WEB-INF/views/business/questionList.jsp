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
	width: 100px;
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
	width: 160px;
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
.ordermenu {
	float:left;
	margin: 0;
	padding: 0;
	width: 160px;
	height: 100%;
	border-right: 1px dashed #878787;
	font-size: 20px;	
	text-align: center;
}
.ordermenu > b {
	line-height:50px;
}
.ordermenu > a {
	line-height:50px;
}
.pay-date {
	float:left;
	margin: 0;
	padding: 0;
	width: 150px;
	height: 100%;
	font-size: 20px;	
	text-align: center;
}
.pay-date > b {
	line-height:50px;
}
.pay-date > a {
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
.modals {
	background: #F15F5F;
	width: auto;
	height: 700px;
	border-radius: 15px;
}
.textarea {
	margin: 0 0 20px 60px;
	width: 100%;	
}
.texttitle {
	margin: 0 0 20px 60px;
	width: 100%;
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
.button {
	margin: 5px 600px;
	width: 300px;
	height: 40px;
	text-align: center;
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
	left: 15%;
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
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<body>
<!-- 마이페이지 1:1 문의 페이지 입니다. -->
	<% int[] question_check = {0,1}; %>
	<jsp:include page="../include/businessHeader.jsp" />
	<div class="menuBar">
	<jsp:include page="../include/menuBar.jsp" />
	</div>
	<div class="orderhistory">
	<div id="content_div">
		<div id="upper_div">
			<h1>${rvo.restaurant_name } 사업자 1:1 문의</h1>	
		</div>
		
		

			<div class="orderhistorys">
				
				
					
						<div class="tablehead">
						<div class="orderId">
						<b>상세분류</b>
						</div>
						<div class="res-name">
						<b>제목</b>
						</div>
						<div class="trans-kinds">
						<b>작성자</b>
						</div>
						<div class="ordermenu">
						<b>작성일</b>
						</div>
						
						</div>
					
					
				<c:forEach var="qlist" items="${qlist}" varStatus="loop">
					<div class="tabletd">
							<c:forEach var="qcvo" items="${qcvo}">
								<c:if test="${qcvo.question_category_id == qlist.question_category_id }">
									<div class="orderId">${qcvo.question_category_name }</div>
								</c:if>
						  	</c:forEach>
						<div class="res-name">
							<a href="#question_detail${loop.count}" rel=modal:open>${qlist.question_title }</a>
						</div>
						<div class="trans-kinds">
							<c:if test="${qlist.user_id_send == 0}">
								관리자
							</c:if>
							<c:if test="${qlist.user_id_send != 0}">
								${uvo.user_name } 님
							</c:if>
						</div>
						<div class="ordermenu">
							${qlist.question_date }
						</div>
						
					</div>
					
			
				<div id="question_detail${loop.count}" class="modal">
					<div class="modals">
							<h1 
						style="text-align: center;">
						1:1문의 확인</h1>
						
					<div style="margin:30px 0 0 60px;"><b>상세 분류</b></div>
							<div class="select">
								
								<c:forEach var="qcvo" items="${qcvo}">
								<c:if test="${qcvo.question_category_id == qlist.question_category_id }">
									${qcvo.question_category_name }
								</c:if>
						  		</c:forEach>
									
								
							</div>
						
						<div style="margin: 0 60px;"><b>제목</b></div>
						
							<div class="texttitle">
								${qlist.question_title }
							</div>
						
						<div style="margin: 0 60px;"><b>작성자</b></div>
						<div class="textarea">
								<c:if test="${qlist.user_id_send == 0}">
								관리자
								</c:if>
								<c:if test="${qlist.user_id_send != 0}">
									${uvo.user_name } 님
								</c:if>
							</div>
							<div class="dateTitle">
								작성일
							</div>
						<div class="date">
							${qlist.question_date}	
						</div>
							<div class="q-title">
							문의내용
							</div>
								
							<div class="q-content">
								${qlist.question_content}	
							</div>
						</div>
				</div>	
				
				</c:forEach>
				</div>
				
				<hr>
				<div class="button" >
				<form action="goquestion_send">
					<input type="submit" value="문의 작성하기"
					style="width: 150px; height: 40px; background: red; border-radius: 10px;"
					>
				</form>
				<br />
				<input type="button" value="이전페이지로" 
				style="width: 150px; height: 40px; background: #D4F4FA; border-radius: 10px;"
				>
				</div>
				<div><!-- 페이징 임시 div -->
					<c:if test="${paging.startPage != 1 }">
						<a href="question_list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a href="question_list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="question_list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>
			</div>
		</div>
	
</body>
					
</html>