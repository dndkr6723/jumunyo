<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../CSS/reservationList.css">
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
			<div class="sub">
		<form action="goquestion_send">
			<span class="button1" >				
					<input type="submit" value="문의 작성하기"
					style="width: 150px; height: 40px; background: red; border-radius: 10px;">							
			</span>
			</form>
			<form action="">
			<span class="button2">				
					<input type="submit" value="이전 페이지로"
					style="width: 150px; height: 40px; background: #D4F4FA; border-radius: 10px;">				
			</span>
			</form>
		</div>					
						<div class="tablehead">
						<div class="orderId">
						<b>상세분류</b>
						</div>
						<div class="title">
						<b>제목</b>
						</div>
						<div class="trans-kinds">
						<b>작성자</b>
						</div>
						<div class="created">
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
						<div class="title">
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
						<div class="created">
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
								이종명
							</div>
							<div class="dateTitle">
								<c:if test="${qlist.user_id_send == 0}">
								관리자
								</c:if>
								<c:if test="${qlist.user_id_send != 0}">
									${uvo.user_name } 님
								</c:if>
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
				<div class="paging"> <!-- 페이징 위치 -->
					1. 2. 3. 4. 5
				</div> 
			</div>
		</div>
	
</body>
					
</html>