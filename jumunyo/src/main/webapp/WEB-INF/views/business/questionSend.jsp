<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.modals {
	background: #F15F5F;
	width: 23%;
	margin:5% 38%;
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
<link rel="stylesheet" type="text/css" href="resources/CSS/questionSend.css">
</head>
<body>
<!-- 1:1문의 보내기 페이지 입니다. -->
		<div class="modals">
				<form action="question_send">
					<div class="title">
						<h1 
						style="text-align: center;">
						1:1문의</h1> <!-- 매점명출력 -->
					</div>
					<div style="margin:30px 0 0 60px;"><b>상세 분류</b></div>
					<div class="select">
						<select name="question_category_id" style="width: 300px; height: 30px;">
						<c:forEach var="qclist" items="${qclist }">
						<option value="${qclist.question_category_id }">${qclist.question_category_name }</option>
						</c:forEach>
						</select>
					</div>
					<div style="margin: 0 60px;"><b>제목</b></div>
					<div class="texttitle">
						<input type="text" name="question_title" id="" 
						style="width: 300px; height: 30px;" placeholder="제목을 작성 해주세요"/>
					</div>
					<div style="margin: 0 60px;"><b>문의 내용</b></div>					
					<div class="textarea">					
						<textarea name="question_context" cols="30" rows="10" style="width: 300px; height: 50px;" 
						placeholder="내용을 작성 해주세요" ></textarea>			
					</div>
					<input type="hidden" value="${uvo.user_id }" name="user_id_send">
					<input type="hidden" value="0" name="user_id_receive">
					<input type="hidden" value="답변안함" name="question_check">
					<div class="quest-submit">
						<input type="submit" value="문의 답변" 
						style="width: 300px; height: 30px; background: red; border-radius: 5px;" />
						<br />
						<br />
						<input type="reset" value="답변 취소" 
						style="width: 300px; height: 30px; background: #FFD8D8; border-radius: 5px;" />
					</div>
					</form>
				</div>
</body>
</html>