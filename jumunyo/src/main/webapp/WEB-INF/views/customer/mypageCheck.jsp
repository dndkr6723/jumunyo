<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.MyInfo-pwCheck {
	width: 50%;
	margin: 100px 25%;
	height: 500px;
}
.pwCheck {
	width: 100%;
	border-top: 10px solid red;
}
.title {
	margin: 50px 25px;
}
.account {
	font-size: 25px;
	margin: 100px 0 0 10px;
}
.password {
	font-size: 25px;
	margin: 0 0 0 10px;
}
.submit {
	margin: 100px 200px;
}
.footer {
	border-top: 2px solid black;
	margin: 20px;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script>
	function changecolor(id) {
		document.getElementById(id).style.background ="blue";
		document.getElementById(id).style.borderBottomStyle ="outset";
		document.getElementById(id).style.color="red";
		document.getElementById(id).style.fontSize="20px";
	}
	function changeback(id) {
		document.getElementById(id).style.background ="red";
		document.getElementById(id).style.borderBottomStyle ="double";
		document.getElementById(id).style.color="blue";
		document.getElementById(id).style.fontSize="17px";
	}
</script>
<script> 	/* 비밀번호 확인 */

	$(function() {
		$("#user_password")
				.on(
						"keyup", //글자가 입력되면 
						function() {
							/* var user_account = $('user_account').val(); */
							const user_password = $("#user_password");
							// console.log(idInput.val());
							if (user_password.val() === "") {
								// css함수는 디자인을 바꾸는 함수
								user_password.css("background", "pink");
								$("#passwordChk")
										.html(
												"<b style='color:red;'>[아이디는 필수 정보입니다!]</b>");

							} else if (user_password.val() !== "") {


								/*
									# AJAX 비동기 통신
									- 비동기 통신은 페이지를 새로고침하지 않고
									화면을 유지하면서 서버와 실시간으로 통신하는 기술입니다.
								 */

							 	$.ajax({
											type : "POST", // http 요청방식
											url : "mypageCheck.do?sessionPassword=${sessionScope.userSession.user_password }", // 서버의 어디로 요청할 것인지

											data : {
												"user_password" : user_password.val()
											}, // 통신 시에 서버쪽으로 전달할 데이터, parameter로 전송된다
											success : function(result) { // result 에는 서버가 보내준 데이터가 들어옴
												console.log("통신 성공!")
				
												// console.log("result: ", result);
												result = $.trim(result); // result의 앞뒤 공백 제거. (통신도중 의미없는 공백문자열이 추가되는 것을 방지)
												if (result === "NO") {    //idCheck.do 컨트롤러 에서 넘어온 결과
													user_password.css("background",
															"pink");
													$("#passwordChk")
															.html(
																	"<b style='color:red;'>[일치하는 정보가 없습니다.]</b>");
												} else if (result === "YES") {//mypageCheck.do 컨트롤러 에서 넘어온 결과
													user_password.css("background",
															"white");
													$("#passwordChk")
															.html(
																	"<b style='color:green;'>[비밀번호가 일치합니다.]</b>");
												}

											}, //통신 성공시 클라이언트에서 해야할 일들을 함수로 기술한다.
											error : function() {
												console.log("통신 실패");
											}
										});
							}
						}); // end accountInput Event
	}); // end JQuery  
	</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<form action="mypageModifySubmit.do" method="post">
	<div class="MyInfo-pwCheck">
		<h1>내 정보</h1>
		<div class="pwCheck">
		<div class="title"><h2>비밀번호 확인</h2></div>
		<div class="account">
			<hr />
			<a>아이디 : </a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

			<b>${sessionScope.userSession.user_account }</b>
			<hr />
		</div>
		<div class="password">
			<hr />
			<a>비밀번호 : </a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="password" name="user_password" id="user_password"
			style="width: 200px; height: 30px; font-size: 25px;"  />
			<span id="passwordChk"></span>
			<hr />
			<input type="hidden" value="${sessionScope.userSession.user_password }" name="sessionPassword"/>
		</div>
		<div class="submit">
			<input type="submit" id="submit1" value="확인" onmouseover="changecolor('submit1');" onmouseout="changeback('submit1');" 
			style="width: 200px; height: 50px; background: red; border-radius: 20px; font-size: 17px;" />
			<input type="reset" id="reset1" value="취소" onmouseover="changecolor('reset1');" onmouseout="changeback('reset1');"
			style="width: 200px; height: 50px; background: red; border-radius: 20px; font-size: 17px;" />
		</div>
		</div>
	
	
	</div>
	</form>
	<div class="footer">
		<jsp:include page="../include/footer.jsp"/>
		</div>
</body>
</html>