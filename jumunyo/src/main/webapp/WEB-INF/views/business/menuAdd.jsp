<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../CSS/menuAdd.css">
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
<!-- 매장 메뉴 추가 페이지 입니다. -->
			<div class="modals">
				<form action="<%= result%>">
					<div class="title">
						<h1 
						style="text-align: center;">
						${rvo.restaurant_name } 메뉴추가/수정</h1> <!-- 매점명출력 -->
					</div>					
					<div style="margin: 0 60px;"><b>메뉴 이름</b></div>
					<div class="texttitle">
						<c:if test="${mvo.menu_id != null}">
							<input type="hidden" value="${mvo.menu_id }" name="menu_id">
						</c:if>
						<input type="hidden" value="${rvo.restaurant_id }" name="restaurant_id">
						<input type="text" name="menu_name" value="${mvo.menu_name}" required="required" 
						style="width: 300px; height: 30px;"/>
					</div>
					<div style="margin: 0 60px;"><b>가격</b></div>					
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
	
</body>
</html>