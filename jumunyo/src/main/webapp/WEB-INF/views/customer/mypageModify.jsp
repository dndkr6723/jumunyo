<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2a0d6058ad1aeee56b87fdda98330c43&libraries=services"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style>
.MyInfo-pwCheck {
	width: 50%;
	margin: 100px 25%;
	height: auto;
}
.footer {
	border-top: 2px solid black;
	margin: 20px;
}
.account {
	font-size: 25px;
	margin: 10px 0 10px 10px;
	padding: 10px;
	border-bottom: 1px dashed black; 
}
.nickname {
	font-size: 25px;
	margin: 10px 0 10px 10px;
	padding: 10px;
	border-bottom: 1px dashed black;
}
.nickinput {
	width: 200px; height: 30px; font-size: 15px; border-radius: 20px;
}
.nickbtn {
	width: 140px; height: 30px; font-size: 20px; background: red; border: none; border-radius: 20px;
}
.email {
	font-size: 25px;
	margin: 10px 0 10px 10px;
	padding: 10px;
	border-bottom: 1px dashed black;
}
.emailinput {
	width: 200px; height: 30px; font-size: 15px; border-radius: 20px;
}
.emailbtn {
	width: 140px; height: 30px; font-size: 20px; background: red; border: none; border-radius: 20px;
}
.name {
	font-size: 25px;
	margin: 10px 0 10px 10px;
	padding: 10px;
	border-bottom: 1px dashed black;
}
.pw1input {
	width: 200px; height: 30px; font-size: 20px; border-radius: 20px;
}
.pw2input {
	width: 200px; height: 30px; font-size: 20px; border-radius: 20px;
}
.pw3input {
	width: 200px; height: 30px; font-size: 20px; border-radius: 20px;
}
.newpw1 {
	font-size: 20px;
	margin: 10px 0 10px 10px;
}
.newpw2 {
	font-size: 20px;
	margin: 10px 0 10px 10px;
	padding: 10px 0;
	border-bottom: 1px dashed black;
}
.pwbtn {
	width: 140px; height: 30px; font-size: 20px; background: red; border: none; border-radius: 20px;
}
.tel {
	font-size: 25px;
	margin: 10px 0 10px 10px;
	padding: 10px;
	border-bottom: 1px dashed black;
}
.telinput {
	width: 200px; height: 30px; font-size: 15px; border-radius: 20px;
}
.telbtn {
	width: 140px; height: 30px; font-size: 20px; background: red; border: none; border-radius: 20px;
}
.address {
	font-size: 25px;
	margin: 10px 0 10px 10px;
	padding: 10px 0;
	border-bottom: 1px solid black;
}
.addressinput {
	width: 500px; height: 30px; font-size: 15px; border-radius: 20px;
}
.zipcodebtn {
	width: 150px; height: 30px; font-size: 20px; background: red; border: none; border-radius: 20px;
}
.addressbtn {
	width: 140px; height: 30px; font-size: 20px; background: red; border: none; border-radius: 20px;
}
.userdelete {
	margin: 0 800px;
}
.addressfindbtn {
	width: 140px; height: 30px; font-size: 20px; background: red; border: none; border-radius: 20px;
}
</style>
<script> 	/* 닉네임 확인 */
	$(function() {
		$("#user_nickname")
				.on(
						"keyup", //글자가 입력되면 
						function() {
							/* var user_account = $('user_account').val(); */
							const user_nickname = $("#user_nickname");
							// console.log(idInput.val());
							if (user_nickname.val() === "") {
								// css함수는 디자인을 바꾸는 함수
								user_nickname.css("background", "pink");
								$("#nicknameChk")
										.html(
												"<b style='color:red;'>[닉네임을 입력해주세요]</b>");
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
																	"<b style='color:red;'>[사용 불가능한 닉네임입니다.]</b>");
												} else if (result === "YES") {//mypageCheck.do 컨트롤러 에서 넘어온 결과
													user_nickname.css("background",
															"white");
													$("#nicknameChk")
															.html(
																	"<b style='color:green;'>[사용 가능한 닉네임입니다.]</b>");
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
<script> 	/* 이메일 확인 */
	$(function() {
		$("#user_email")
				.on(
						"keyup", //글자가 입력되면 
						function() {
							/* var user_account = $('user_account').val(); */
							const user_email = $("#user_email");
							// console.log(idInput.val());
							if (user_email.val() === "") {
								// css함수는 디자인을 바꾸는 함수
								user_email.css("background", "pink");
								$("#emailChk")
										.html(
												"<b style='color:red;'>[이메일을 입력해주세요]</b>");
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
																	"<b style='color:red;'>[사용 불가능한 이메일입니다.]</b>");
												} else if (result === "YES") {//mypageCheck.do 컨트롤러 에서 넘어온 결과
													user_email.css("background",
															"white");
													$("#emailChk")
															.html(
																	"<b style='color:green;'>[사용 가능한 이메일입니다.]</b>");
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
													user_password.css("background",
															"pink");
													$("#passwordChk")
															.html(
																	"<b style='color:green;'>[비밀번호 일치]</b>");
												} else if (result === "NO") {
													user_password.css("background",
															"white");
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
	<jsp:include page="../include/header.jsp" />

	<div class="MyInfo-pwCheck">
		<h1 style="text-align: center;">내 정보</h1>
		<div class="account">
			<a>아이디 : </a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

			<b>${sessionScope.userSession.user_account }</b>
		</div>
		<form action="updateUser.do" method="post">
		<div class="nickname">
			<a>닉네임 : </a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="user_nickname" id="user_nickname" class="nickinput" value="${sessionScope.userSession.user_nickname }" /> &nbsp;&nbsp;
			<input type="hidden" name="user_id" value="${sessionScope.userSession.user_id }" />
			<input type="submit" class="nickbtn" id="nick1" value="닉네임 수정" onmouseover="changecolor('nick1');" onmouseout="changeback('nick1');"/>
			<span id="nicknameChk"></span>
		</div>
		</form>
		<form action="updateUser.do" method="post">
		<div class="email">
			<a>이메일 : </a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="user_email" id="user_email" class="emailinput" value="${sessionScope.userSession.user_email }" /> &nbsp;&nbsp;
			<input type="hidden" name="user_id" value="${sessionScope.userSession.user_id }" />
			<input type="submit" class="emailbtn" id="email1" value="이메일 수정" onmouseover="changecolor('email1');" onmouseout="changeback('email1');"/>
			<span id="emailChk"></span>
		</div>
		</form>
		<div class="name">
			<a>성명 : </a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

			<b>${sessionScope.userSession.user_name }</b>
		</div>
		<form action="updateUser.do" method="post">
		<div class="newpw1">
			<a>새 비밀번호 : </a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="password" id="user_password" name="user_password" class="pw2input" value="" /> &nbsp;&nbsp;
			<span id="passwordChk"></span>
		</div>
		<div class="newpw2">
			<a>새 비밀번호 확인 : </a>
			&nbsp;
			<input type="password" id="user_passwordCheck" name="user_passwordCheck" class="pw3input" value="" /> &nbsp;&nbsp;
			<input type="submit" class="pwbtn" id="pw1" value="비밀번호 수정" onmouseover="changecolor('pw1');" onmouseout="changeback('pw1');"/>
		</div>
		</form>
		<form action="updateUser.do" method="post">
		<div class="tel">
			<a>연락처 : </a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="user_tell" class="telinput" value="${sessionScope.userSession.user_tell }" /> &nbsp;&nbsp;
			<input type="hidden" name="user_id" value="${sessionScope.userSession.user_id }" />
			<input type="submit" class="telbtn" id="tel1" value="연락처 수정" onmouseover="changecolor('tel1');" onmouseout="changeback('tel1');"/>
			<span></span>
		</div>
		</form>
		<form action="updateUser.do" method="post">
		<div class="address">
			<a>주소 : </a>
			&nbsp;&nbsp;
			<input type="text" name="user_address" class="addressinput" value="${sessionScope.userSession.user_address }" /> &nbsp;&nbsp;
			<input type="button" id="find1" class="addressfindbtn" onmouseover="changecolor('find1');" onmouseout="changeback('find1');"
			onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
	<div id="map" style="width:500px;height:400px;"></div>
	<script> /* 도로명 주소 api */
		    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		        mapOption = {
		            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		            level: 5 // 지도의 확대 레벨
		        };
		
		    //지도를 미리 생성
		    var map = new daum.maps.Map(mapContainer, mapOption);
		    //주소-좌표 변환 객체를 생성
		    var geocoder = new daum.maps.services.Geocoder();
		    //마커를 미리 생성
		    var marker = new daum.maps.Marker({
		        position: new daum.maps.LatLng(37.537187, 127.005476),
		        map: map
		    });
		
		
		    function sample5_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                var addr = data.address; // 최종 주소 변수
		
		                // 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("user_address").value = addr;
		                // 주소로 상세 정보를 검색
		                geocoder.addressSearch(data.address, function(results, status) {
		                    // 정상적으로 검색이 완료됐으면
		                    if (status === daum.maps.services.Status.OK) {
		
		                        var result = results[0]; //첫번째 결과의 값을 활용
		
		                        // 해당 주소에 대한 좌표를 받아서
		                        var coords = new daum.maps.LatLng(result.y, result.x);
		                        // 지도를 보여준다.
		                        mapContainer.style.display = "block";
		                        map.relayout();
		                        // 지도 중심을 변경한다.
		                        map.setCenter(coords);
		                        // 마커를 결과값으로 받은 위치로 옮긴다.
		                        marker.setPosition(coords)
		                    }
		                });
		            }
		        }).open();
		    }
		</script>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" class="addressbtn" id="add1" value="주소 수정" onmouseover="changecolor('add1');" onmouseout="changeback('add1');" />
		</div>
		</form>
		<form action="deleteUser.do">
		<div class="userdelete">
			<input type="hidden" name="user_id" value="${sessionScope.userSession.user_id }"/>			
			<input type="submit" value="회원탈퇴" />
		</div>
		</form>
	</div>

	<div class="footer">
		<jsp:include page="../include/footer.jsp"/>
		</div>






</body>
<script>
	function changecolor(id) {
		document.getElementById(id).style.background ="blue";
		document.getElementById(id).style.color="red";
		document.getElementById(id).style.fontSize="22px";
		
	}
	function changeback(id) {
		document.getElementById(id).style.background ="red";
		document.getElementById(id).style.color="black";
		document.getElementById(id).style.fontSize="20px";
	}
</script>
</html>