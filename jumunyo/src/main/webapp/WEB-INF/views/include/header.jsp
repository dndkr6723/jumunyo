<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2a0d6058ad1aeee56b87fdda98330c43&libraries=services"></script>
<style>
body {
	margin: 0;
	padding: 0;
}

.header { 
	width: 100%;
	height: 50px;
	background: linear-gradient(to bottom, #FFA7A7, #B7F0B1, #f69d3c);
}

#logo {
	float: left;
	width: 160px;
	margin: 0 0 0 18%;
	line-height:50px;
}

.search {
	float: left;
	margin: 3px 0 0 5%;
	width: 595px;
	height: 40px;
	background: white;
	border-radius: 20px;
	border: 2px dashed black;
}
.login-link {
	float: left;
	text-decoration: none;
	margin: 0 0 0 5%;
	line-height:50px;
}
.join-link {
	float: left;
	text-decoration: none;
	margin: 0 0 0 5%;
	line-height:50px;
}
.glass {
	float: left;
	width: 12%;
	
}

#glass {
	padding: 5px;
}

.input {
	float: left;
	margin: 0 0;
}

#inputText {
	float: left;
	margin: 2px 0 0 -40px;
	padding: 3px;
	width: 475px;
	height: 28px;
	border: 1px solid rgba(0, 0, 0, 0.02);
	background: white;
	border-radius: 20px;
} 
.searchbtn {
	float: left;
	width: 80px;
	height: 40px;
	border-radius: 20px;
	border: 2px solid black;
	background: black;
	color: white; 
}

.welcome {
	float: left;
	margin: 0 0 0 5%;
	width: 300px;
	line-height: 50px;
}
.welcome > a {
	font-size: 20px;
	
}
.a1 {
	font-size: 30px;
	font-weight: bold;
	color: #A566FF;
	font-family: 'Nanum Pen Script', cursive;
}

.a2 {
	font-size: 30px;
	font-weight: bold;
	color: #1DDB16;
	font-family: 'Nanum Pen Script', cursive;
}

.a3 {
	font-size: 30px;
	font-weight: bold;
	color: #003399;
	font-family: 'Nanum Pen Script', cursive;
}

.a4 {
	font-size: 30px;
	font-weight: bold;
	color: #F29661;
	font-family: 'Nanum Pen Script', cursive;
}

body 
div,
span,
applet,
object,
iframe,
h1,
h2 {
  margin: 0;
  padding: 0;
  border: 0;
}
input,
button {
  outline: 0;
}

.login-signup {
  width: 300px;
  background-color: #E2E2E2;
  position: relative;
  margin: 0 70px;
}

.login-signup-title {
  padding: 15px;
  width: calc(100% - 30px);
  text-align: center;
  font-size: 16px;
  color: black;
  background-color: #00D8FF;
}

.login-signup-content {
  width: calc(100% - 50px);
  position: relative;
  padding: 25px;
  background-color: #FFF;
  border: 1px solid #E2E2E2;
}

.input-name {
  font-size: 14px;
}

.input-margin {
  margin-top: 25px;
}

.input-name h2 {
  padding-bottom: 5px;
  float: left;
}

input.field-input {
  width: calc(100% - 24px);
  margin-top: 12px;
  background-color: rgba(2, 2, 2, 0.07);
  border: 1px solid rgba(0, 0, 0, 0.02);
  border-radius: 8px;
  padding: 6px 12px;
  border-radius: 20px;
}

.check-input {
  width: 16px;
  height: 16px;
  position: relative;
  float: left;
}

input.checkme {
  position: relative;
  top: 2px;
}

div.rememberme {
  font-size: 12px;
  top: 6px;
  position: relative;
  margin-left: 8px;
  float: left;
}

.check-input label {
  cursor: pointer;
  position: absolute;
  width: 14px;
  height: 14px;
  border-radius: 4px;
  top: 5px;
  left: 3px;
  background-color: #FFAB91;
}

.input-r {
  margin-top: 15px;
  position: relative;
}

.check-input label:after {
  opacity: 0;
  content: "";
  position: absolute;
  width: 7px;
  height: 4px;
  background: transparent;
  top: 3px;
  left: 3px;
  border: 2px solid #FFF;
  border-top: none;
  border-right: none;
  -webkit-transform: rotate(-45deg);
  -moz-transform: rotate(-45deg);
  -o-transform: rotate(-45deg);
  -ms-transform: rotate(-45deg);
  transform: rotate(-45deg);
}

.check-input label:hover:after {
  -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
  filter: alpha(opacity=50);
  opacity: 0.5;
}

.check-input input[type=checkbox]:checked + label:after {
  -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=100)";
  filter: alpha(opacity=100);
  opacity: 1;
}

.submit-btn {
  width: 100%;
  margin-top: 28px;
  text-align: center;
  padding: 5px 0;
  border-radius: 20px;
  background-color: #00D8FF;
  color: #FFF;
  border: none;
  transition: 0.5s cubic-bezier(0.72, 0.15, 0.53, 0.84);
}
.modal {
	width: auto; 
	margin: 0; 
	padding: 0;
	border: medium double rgb(000,255,255);
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script> 	/* 아이디 중복 체크 */

	$(function() {
		$("#user_account")
				.on(
						"keyup", //글자가 입력되면 
						function() {
							/* var user_account = $('user_account').val(); */
							const user_account = $("#user_account");
							// console.log(idInput.val());
							if (user_account.val() === "") {
								// css함수는 디자인을 바꾸는 함수
								user_account.css("background", "pink");
								$("#accountChk")
										.html(
												"<b style='color:red;'>[아이디는 필수 정보입니다!]</b>");

							} else if (user_account.val() !== "") {


								/*
									# AJAX 비동기 통신
									- 비동기 통신은 페이지를 새로고침하지 않고
									화면을 유지하면서 서버와 실시간으로 통신하는 기술입니다.
								 */

							 	$.ajax({
											type : "POST", // http 요청방식
											url : "accountCheck.do", // 서버의 어디로 요청할 것인지

											data : {
												"user_account" : user_account.val()
											}, // 통신 시에 서버쪽으로 전달할 데이터, parameter로 전송된다
											success : function(result) { // result 에는 서버가 보내준 데이터가 들어옴
												console.log("통신 성공!")
				
												// console.log("result: ", result);
												result = $.trim(result); // result의 앞뒤 공백 제거. (통신도중 의미없는 공백문자열이 추가되는 것을 방지)
												if (result === "NO") {    //idCheck.do 컨트롤러 에서 넘어온 결과
													user_account.css("background",
															"pink");
													$("#accountChk")
															.html(
																	"<b style='color:red;'>[중복된 아이디입니다.]</b>");
												} else if (result === "YES") {//accountCheck.do 컨트롤러 에서 넘어온 결과
													user_account.css("background",
															"white");
													$("#accountChk")
															.html(
																	"<b style='color:green;'>[사용가능한 아이디입니다.]</b>");
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
<script>
	/* 닉네임 중복 체크 */
	$(function() {
		$("#user_nickname")
				.on(
						"keyup", //글자가 입력되면 
						function() {
							const user_nickname = $("#user_nickname");
							if (user_nickname.val() === "") {
								// css함수는 디자인을 바꾸는 함수
								user_nickname.css("background", "pink");
								$("#nicknameChk")
										.html(
												"<b style='color:red;'>[닉네임은 필수 정보입니다!]</b>");

							} else if (user_nickname.val() !== "") {


								/*
									# AJAX 비동기 통신
									- 비동기 통신은 페이지를 새로고침하지 않고
									화면을 유지하면서 서버와 실시간으로 통신하는 기술입니다.
								 */

							 	$.ajax({
											type : "POST", // http 요청방식
											url : "nicknameCheck.do", // 서버의 어디로 요청할 것인지

											data : {
												"user_nickname" : user_nickname.val()
											}, // 통신 시에 서버쪽으로 전달할 데이터, parameter로 전송된다
											success : function(result) { // result 에는 서버가 보내준 데이터가 들어옴
												console.log("통신 성공!")
				
												// console.log("result: ", result);
												result = $.trim(result); // result의 앞뒤 공백 제거. (통신도중 의미없는 공백문자열이 추가되는 것을 방지)
												if (result === "NO") {    //idCheck.do 컨트롤러 에서 넘어온 결과
													user_nickname.css("background",
															"pink");
													$("#nicknameChk")
															.html(
																	"<b style='color:red;'>[중복된 닉네임입니다.]</b>");
												} else if (result === "YES") {//accountCheck.do 컨트롤러 에서 넘어온 결과
													user_nickname.css("background",
															"white");
													$("#nicknameChk")
															.html(
																	"<b style='color:green;'>[사용가능한 닉네임입니다.]</b>");
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
<script>
	<!-- 이메일 중복 체크 -->
	$(function() {
		$("#user_email")
				.on(
						"keyup", //글자가 입력되면 
						function() {
							const user_email = $("#user_email");
							if (user_email.val() === "") {
								// css함수는 디자인을 바꾸는 함수
								user_email.css("background", "pink");
								$("#emailChk")
										.html(
												"<b style='color:red;'>[이메일은 필수 정보입니다!]</b>");

							} else if (user_email.val() !== "") {


								/*
									# AJAX 비동기 통신
									- 비동기 통신은 페이지를 새로고침하지 않고
									화면을 유지하면서 서버와 실시간으로 통신하는 기술입니다.
								 */

							 	$.ajax({
											type : "POST", // http 요청방식
											url : "emailCheck.do", // 서버의 어디로 요청할 것인지

											data : {
												"user_email" : user_email.val()
											}, // 통신 시에 서버쪽으로 전달할 데이터, parameter로 전송된다
											success : function(result) { // result 에는 서버가 보내준 데이터가 들어옴
												console.log("통신 성공!")
				
												// console.log("result: ", result);
												result = $.trim(result); // result의 앞뒤 공백 제거. (통신도중 의미없는 공백문자열이 추가되는 것을 방지)
												if (result === "NO") {    //idCheck.do 컨트롤러 에서 넘어온 결과
													user_email.css("background",
															"pink");
													$("#emailChk")
															.html(
																	"<b style='color:red;'>[중복된 이메일입니다.]</b>");
												} else if (result === "YES") {//accountCheck.do 컨트롤러 에서 넘어온 결과
													user_email.css("background",
															"white");
													$("#emailChk")
															.html(
																	"<b style='color:green;'>[사용가능한 이메일입니다.]</b>");
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
<script>
/* 비밀번호 일치 체크 */
	$(function() {
		$("#user_passwordCheck")
				.on(
						"keyup", //글자가 입력되면 
						function() {
							const user_password = $("#user_password");
							const user_passwordCheck = $("#user_passwordCheck");
							if (user_password.val() === "") {
								// css함수는 디자인을 바꾸는 함수
								user_password.css("background", "pink");
								$("#passwordChk")
										.html(
												"<b style='color:red;'>[비밀번호는 필수 정보입니다!]</b>");

							} else if (user_password.val() !== "") {


								/*
									# AJAX 비동기 통신
									- 비동기 통신은 페이지를 새로고침하지 않고
									화면을 유지하면서 서버와 실시간으로 통신하는 기술입니다.
								 */

							 	$.ajax({
											type : "POST", // http 요청방식
											url : "passwordCheck.do", // 서버의 어디로 요청할 것인지

											data : {
												"user_password" : user_password.val(),"user_passwordCheck" : user_passwordCheck.val()
											}, // 통신 시에 서버쪽으로 전달할 데이터, parameter로 전송된다
											success : function(result) { // result 에는 서버가 보내준 데이터가 들어옴
												console.log("통신 성공!")
				
												// console.log("result: ", result);
												result = $.trim(result); // result의 앞뒤 공백 제거. (통신도중 의미없는 공백문자열이 추가되는 것을 방지)
												if (result === "YES") {   
													user_password.css("background","pink");
													$("#passwordChk")
															.html(
																	"<b style='color:green;'>[비밀번호 일치]</b>");
												} else if (result === "NO") {
													user_password.css("background","white");
													$("#passwordChk")
															.html(
																	"<b style='color:red;'>[비밀번호 불일치]</b>");
												}

											}, //통신 성공시 클라이언트에서 해야할 일들을 함수로 기술한다.
											error : function() {
												console.log("통신 실패");
											}
										});
							}
						});
	}); // end JQuery  
</script>
</head>
<body>
	<div class="header">		
			<div id="logo" onmouseover="logo1();" onmouseout="logo2();">
				<a href="Index.do" style="text-decoration: none;"> 
					<b class="a1">주</b> 
					<b class="a2">문</b> 
					<b class="a3">이</b> 
					<b class="a4">요</b>
				</a>
			</div>
			<form action="searchRestaurantName.do">
			<div class="search">
				<div class="glass">
					<img alt="Magnifying Glass" src="resources/image/돋보기.png" width="30px"
						height="30px" id="glass">
				</div>
				<div class="input">
					<input type="text" name="restaurant_name" id="inputText" />
					<input type="submit" class="searchbtn" value="검색"/>	
				</div>
			</div>
			</form>
			<c:choose>
			<c:when test="${sessionScope.userSession == null }">
			<div id="ex1" class="modal">
				<div class="loginmodal">
					<form action="loginCheck.do" method="post">
						<div class="login-signup l-attop" id="login">
							<div class="login-signup-title"><b>로그인</b></div>
							<div class="login-signup-content">
								<div class="input-name">
									<h2>아이디</h2>
								</div>
								<input type="text" name="user_account" value="" class="field-input"
									required="required" />
								<div class="input-name input-margin">
									<h2>비밀번호</h2>
								</div>
								<input type="password" name="user_password" value="" class="field-input"
									required="required" />
								<div class="input-r">
									<div class="check-input">
										<input type="checkbox" id="remember-me-2" name="rememberme"
											value="" class="checkme"> <label
											class="remmeberme-blue" for="remember-me-2"></label>
									</div>
									<div class="rememberme">
										<label for="remember-me-2">자동로그인</label>
									</div>
								</div>								
								<input type="submit" value="로그인" class="submit-btn" />
							
								<div class="forgot-pass">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<!-- <a href="../customer/idFind.jsp" style="text-decoration: none;">아이디/비밀번호 찾기</a> -->
									<a href="idFindPage.do" style="text-decoration: none;">아이디/비밀번호 찾기</a>
								</div>

							</div>
						</div>
					</form>
					
				</div>
			</div>
			<div id="ex2" class="modal">
				<div class="loginmodal">
					<form action="join.do" method="post">
					<div class="login-signup s-atbottom" id="signup">
  						<div class="login-signup-title">
     					회원가입
  						</div>
  					<div class="login-signup-content">
    					<div class="input-name">
    	 				<h2>아이디</h2>
    					</div>
    				<input type="text" name="user_account" id="user_account" value="" class="field-input" required="required"/>
    						 <span id="accountChk"></span><!-- div 태그안에 ajax 경고문이 들어갈 공간-->
    				<div class="input-name input-margin">
      				<h2>닉네임</h2>
    				</div>
    				<input type="text" name="user_nickname" id="user_nickname" value="" class="field-input" required="required"/>
    					 <span id="nicknameChk"></span><!-- div 태그안에 ajax 경고문이 들어갈 공간 -->
    				<div class="input-name input-margin">
      				<h2>비밀번호</h2>
    				</div>
    				<input type="text" name="user_password" id="user_password" value="" class="field-input" />
					<div class="input-name input-margin">
      				<h2>비밀번호 확인</h2>
    				</div>
    				<input type="text" name="user_passwordCheck" id="user_passwordCheck" value="" class="field-input" />
    					 <span id="passwordChk"></span><!-- div 태그안에 ajax 경고문이 들어갈 공간 -->
    				<div class="input-name input-margin">
      				<h2>이름</h2>
    				</div>
    				<input type="text" name="user_name" value="" class="field-input" />
    				<div class="input-name input-margin">
      				<h2>휴대폰</h2>
    				</div>
    				<input type="text" name="user_tell" value="" class="field-input" />
    				<div class="input-name input-margin">
      				<h2>이메일</h2>
    				</div>
    				<input type="text" name="user_email" id="user_email" value="" class="field-input" />
    					 <span id="emailChk"></span><!-- div 태그안에 ajax 경고문이 들어갈 공간 -->
    				<div class="input-name input-margin">
      				<h2>주소</h2>
    				</div>
    				<input type="text" name="user_address" id="user_address" value="" class="field-input" />
    				<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
				<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
				<div id="map1" style="width:250px;height:250px;"></div>
				<!--주소 api  -->
				<script>
					var mapContainer = document.getElementById('map1'), // 지도를 표시할 div
					mapOption = {
						center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
						level : 5
					// 지도의 확대 레벨
					};

					//지도를 미리 생성
					var map = new daum.maps.Map(mapContainer, mapOption);
					//주소-좌표 변환 객체를 생성
					var geocoder = new daum.maps.services.Geocoder();
					//마커를 미리 생성
					var marker = new daum.maps.Marker({
						position : new daum.maps.LatLng(37.537187, 127.005476),
						map : map
					});

					function sample5_execDaumPostcode() {
						new daum.Postcode(
								{
									oncomplete : function(data) {
										var addr = data.address; // 최종 주소 변수

										// 주소 정보를 해당 필드에 넣는다.
										document
												.getElementById("user_address").value = addr;
										// 주소로 상세 정보를 검색
										geocoder
												.addressSearch(
														data.address,
														function(results,
																status) {
															// 정상적으로 검색이 완료됐으면
															if (status === daum.maps.services.Status.OK) {

																var result = results[0]; //첫번째 결과의 값을 활용

																// 해당 주소에 대한 좌표를 받아서
																var coords = new daum.maps.LatLng(
																		result.y,
																		result.x);
																// 지도를 보여준다.
																mapContainer.style.display = "block";
																map.relayout();
																// 지도 중심을 변경한다.
																map
																		.setCenter(coords);
																// 마커를 결과값으로 받은 위치로 옮긴다.
																marker
																		.setPosition(coords)
															}
														});
									}
								}).open();
					}
				</script>
		            		<input type="submit" value="회원가입" class="submit-btn" />
  					</div>
					</div>
					</form>
				</div>
			</div>
				<a class="login-link" href="#ex1" rel=modal:open style="text-decoration: none;"> <b
					style="font-size: 20px; color: black; font-family: 'Jeju Gothic';">
						로그인 </b></a>
						
				<a class="join-link" href="#ex2" rel=modal:open style="text-decoration: none;"> <b
					style="font-size: 20px; color: black; font-family: 'Jeju Gothic'; margin: 0 20px;">
						회원가입</b></a>
			</c:when>
		<c:otherwise>
		<div class="welcome">
			<a href="mypageMenuPage.do" style="text-decoration: none;"><b>${userSession.user_name }님 환영합니다.</b></a>
			<a href="logOut.do" style="text-decoration: none;"><b>로그아웃</b></a>
			</div>
		</c:otherwise>
	</c:choose>
		
	</div>


</body>
</html>