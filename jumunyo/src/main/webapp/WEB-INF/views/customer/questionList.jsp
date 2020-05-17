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
	height: 600px;
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
	margin: 0 0 20px 60px;
	width: 100%;
}
.button {
	margin: 5px 800px;
	width: 100px;
	height: 40px;
	background: red;
	border-radius: 10px;
	text-align: center;
}
.quest-submit {
	margin: 0 0 20px 60px;
	width: 100%;
}
.filebox {
	margin: 0 60px;
}
</style>
</head>
<body>
<!-- 마이페이지 1:1 문의 페이지 입니다. -->
	<% int[] question_check = {0,1}; %>
	<jsp:include page="../include/header.jsp" />
	<div class="orderhistory">
		<h1>1:1 문의</h1>
		<div class="orderhistorys">
			<div class="tablehead">
				<div class="orderId">
				<b>문의번호</b>
				</div>
				<div class="res-name">
				<b>문의분류</b>
				</div>
				<div class="trans-kinds">
				<b>제목</b>
				</div>
				<div class="ordermenu">
				<b>문의 날짜</b>
				</div>
				<div class="pay-date">
				<b>작성자</b>
				</div>
			</div>
			<c:forEach var="questionList1" items="${questionList1}" varStatus="status">
			<c:choose>
			<c:when test="${questionList1.question_check == '답변대기'}">
			<div class="tabletd">				
				<div class="orderId">
				<a href="#check${status.count}" rel=modal:open style="text-decoration: none;">${questionList1.question_id }</a> <!-- 여기는 문의번호 출력하는곳 -->
				</div>
				<div class="res-name">
				<a>${questionList2[status.index].question_category_name}</a> <!-- 여기는 문의분류 출력하는곳 -->
				</div>
				<div class="trans-kinds">
				<a>${questionList1.question_title}</a> <!-- 여기는 제목 출력하는곳 -->
				</div>
				<div class="ordermenu">
				<a>${questionList1.question_date}</a> <!-- 여기는 문의 날짜 출력하는곳 -->
				</div>
				<div class="pay-date">
				<a>${sessionScope.userSession.user_nickname }</a> <!-- 작성자의 닉네임 출력 -->			
				</div>
				<div id="check${status.count}" class="modal">
				<div class="modals">
					<div class="title">
						<h1 
						style="text-align: center;">
						1:1문의 내용</h1> <!-- 매점명출력 -->
					</div>
					<div style="margin: 50px 180px;"><b>작성내용</b></div>					
					<div class="textarea">					
						<textarea name="reviewWrite" disabled="disabled" cols="30" rows="10" style="width: 300px;" 
						>${questionList1.question_content }</textarea>			
					</div>
				</div>
				</div>					
			</div>	
			</c:when>
			<c:when test="${questionList1.question_check == '답변완료'}">	
			<div class="tabletd">				
				<div class="orderId">
				<a href="#check${status.count}" rel=modal:open style="text-decoration: none;">${questionList1.question_id }</a> <!-- 여기는 문의번호 출력하는곳 -->
				</div>
				<div class="res-name">
				<a>${questionList2[status.index].question_category_name}</a> <!-- 여기는 문의분류 출력하는곳 -->
				</div>
				<div class="trans-kinds">
				<a>${questionList1.question_title}</a> <!-- 여기는 제목 출력하는곳 -->
				</div>
				<div class="ordermenu">
				<a>${questionList1.question_date}</a> <!-- 여기는 문의 날짜 출력하는곳 -->
				</div>
				<div class="pay-date">
				<a>관리자</a> <!-- 작성자의 닉네임 출력 -->			
				</div>
				<div id="check${status.count}" class="modal">
				<div class="modals">
					<div class="title">
						<h1 
						style="text-align: center;">
						1:1문의 내용</h1> <!-- 매점명출력 -->
					</div>
					<div style="margin: 50px 180px;"><b>작성내용</b></div>					
					<div class="textarea">					
						<textarea name="reviewWrite" disabled="disabled" cols="30" rows="10" style="width: 300px;" 
						>${questionList1.question_content }</textarea>			
					</div>
				</div>
				</div>					
			</div>
			</c:when>
			</c:choose>				
			</c:forEach>
			<div class="button" >
				<a href="#quest" rel=modal:open
				style="text-decoration: none; line-height:40px; font-size: 15px;">
				문의하기</a>
			</div>					
			<div id="quest" class="modal">
				<div class="modals">
				<form action="insertQuestion.do" method="post">
					<div class="title">
						<h1 
						style="text-align: center;">
						1:1문의</h1> <!-- 매점명출력 -->
					</div>
					<div style="margin:30px 0 0 60px;"><b>문의 분류</b></div>
					<div class="select">
						<select name="question_category_id" style="width: 300px; height: 30px;">
							<option value="1">결제관련</option>
							<option value="2">회원정보 문의</option>
							<option value="3">주문 문의</option>
						</select>
					</div>
					<div style="margin: 0 60px;"><b>제목</b></div>
					<div class="texttitle">
						<input type="text" name="question_title" id="" 
						style="width: 300px; height: 30px;" placeholder="제목을 작성 해주세요"/>
					</div>
					<div style="margin: 0 60px;"><b>내용</b></div>					
					<div class="textarea">					
						<textarea name="question_content" cols="30" rows="10" style="width: 300px; height: 50px;" 
						placeholder="내용을 작성 해주세요" ></textarea>			
					</div>
					<div class="filebox">
						<input type="file"  value="" name="" id="" title="">
						<p class="file_name" id="p1" style="color: #F15F5F;"></p>
						<input type="hidden" name="question_image" id="filename" /> 
					</div>
					<input type="hidden" name="user_id_send" value="${sessionScope.userSession.user_id}" />
					<input type="hidden" name="user_id_receive" value="0" />
					<input type="hidden" name="question_check" value="답변대기" />
					<div class="quest-submit">
						<input type="submit" value="문의 등록" 
						style="width: 300px; height: 30px; background: red; border-radius: 5px;" />
					</div>
					</form>
				</div>
				</div>						
		</div>
	</div>
	<div class="footer">
		<jsp:include page="../include/footer.jsp"/>
		</div>
</body>
<script>
$(document).ready(function() {
	$('input[type=file]').change(function(e){
		$(this).parent().find(".file_name").text(e.target.files[0].name);
		var filename = document.getElementById('p1').innerText;
		document.getElementById('filename').value = filename;
	});
}); 
</script>
					
</html>