<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.menuBar {
	position: fixed;
	top: 304px;
	left: 280px;
}

.orderhistorys {
	width: 50%;
	margin: 0 25%;
	border-top: 10px solid red;
	font-size: 25px;
}
.modals {
	background: white;
	width: 810px;
	margin:5% 8%;
	height: 600px;
	
}
.textarea {
	margin: 0 0 20px 250px;
	width: 100%;	
}
.texttitle {
	margin: 0 0 20px 250px;
	width: 100%;
}
.select {
	margin: 0 0 20px 250px;
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
	margin: 0 0 20px 250px;
	width: 100%;
}
.filebox {
	margin: 0 250px;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/CSS/menuAdd.css">
</head>
<body>
<%
	String result = "";
	if(request.getAttribute("mvo")!=null){
		result = "menu_modify";
	}else{
		result = "menu_add";
	}
%>
		<jsp:include page="../include/businessHeader.jsp" />
	<div class="menuBar">
	<jsp:include page="../include/menuBar.jsp" />
	</div>	
	<div class="orderhistory">
	</div>
	<div id="content_div">
		<div id="upper_div">
			<h1 style="margin: 50px 0 0 480px;">${rvo.restaurant_name } 메뉴 관리</h1>	
		</div>		
			<div class="orderhistorys">
<!-- 매장 메뉴 추가 페이지 입니다. -->
			<div class="modals">
				<form action="<%= result%>">
					<div class="title">
						<h3 
						style="text-align: center;">
						${rvo.restaurant_name } 메뉴추가/수정</h3> <!-- 매점명출력 -->
					</div>					
					<div style="margin: 0 250px;"><b>메뉴 이름</b></div>
					<div class="texttitle">
						<c:if test="${mvo.menu_id != null}">
							<input type="hidden" value="${mvo.menu_id }" name="menu_id">
						</c:if>
						<input type="hidden" value="${rvo.restaurant_id }" name="restaurant_id">
						<input type="text" name="menu_name" value="${mvo.menu_name}" required="required" 
						style="width: 300px; height: 30px;"/>
					</div>
					<div style="margin: 0 250px;"><b>가격</b></div>					
					<div class="textarea">					
						<input type="text" value="${mvo.menu_price}" name="menu_price" required="required" 
						style="width: 300px; height: 30px;"/>		
					</div>
					<div class="filebox">
						<input type="file"  value="" name="" id="" title="">
						<p class="file_name" id="p1" style="color: #F15F5F; font-size: 1px;"></p>
						<input type="hidden" name="file_name" id="filename" /> 
				<script>
				$(document).ready(function() {
				$('input[type=file]').change(function(e){
				$(this).parent().find(".file_name").text(e.target.files[0].name);
				var filename = document.getElementById('p1').innerText;
				document.getElementById('filename').value = filename;
				});
				}); 
				</script>
					</div>					
					<div class="quest-submit">
						<input type="submit" value="등록" 
						style="width: 300px; height: 30px; background: red; border-radius: 5px;" />
						<br />
						<br />
						<input type="reset" value="취소" 
						style="width: 300px; height: 30px; background: #FFD8D8; border-radius: 5px;" />
					</div>
					</form>
				</div>
			</div>
			</div>

</body>
</html>