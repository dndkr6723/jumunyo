<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
  float: left;
  width: 300px;
  background-color: #E2E2E2;
  position: relative;
  margin: 0 200px;
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
</style>
</head>
<body>
	<h1>아이디/비밀번호 찾기</h1>
	<hr />
	<form action="accountFind.do" method="post">
		<div class="login-signup l-attop" id="login">
			<div class="login-signup-title">아이디 찾기</div>
			<div class="login-signup-content">
				<div class="input-name">
					<h2>이메일 입력</h2>
				</div>
				<input type="text" name="user_email" value="" class="field-input"
					required="required" />
				<div class="input-name input-margin">
					<h2>성명</h2>
				</div>
				<input type="text" name="user_name" value="" class="field-input"
					required="required" />
				<div class="input-r">	
				</div>
				<input type="submit" value="아이디 찾기" class="submit-btn" />
			</div>
		</div>
	</form>
	<div>
		<c:choose>
			<c:when test="${mUser_account != null }">	
				<input type="hidden" name="" value="${mUser_account }" id="user_account">
				<script>
					var a = document.getElementById("user_account").value;
					alert("회원님의 아이디는 " + a + " 입니다,");
				</script>
			</c:when>
		</c:choose>
	</div>
	<div>
		<c:choose>
			<c:when test="${mResult == false }">
				<script>
					alert("일치하는 정보가 없습니다");
				</script>
			</c:when>
		</c:choose>
	</div>
	<form action="passwordFind.do" method="post">
		<div class="login-signup l-attop" id="login">
			<div class="login-signup-title">비밀번호 찾기</div>
			<div class="login-signup-content">
				<div class="input-name">
					<h2>이메일 입력</h2>
				</div>
				<input type="text" name="user_email" value="" class="field-input"
					required="required" />
				<div class="input-name input-margin">
					<h2>아이디</h2>
				</div>
				<input type="text" name="user_account" value="" class="field-input"
					required="required" />
				<div class="input-r">	
				</div>
				<input type="submit" value="비밀번호 찾기" class="submit-btn" />
			</div>
		</div>
	</form>
	<div>
		<c:choose>
			<c:when test="${mPasswordResult == true }">	
				<input type="hidden" name="" value="${mUser_changePassword }" id="user_password">
				<script>
					/* var a = document.getElementById("user_email").value; */
					var a = document.getElementById("user_password").value; 
					alert("변경된 비밀번호는 \n " + a + "\n입니다");
				</script>
			</c:when>
		</c:choose>
	</div>
	<div>
		<c:choose>
			<c:when test="${mPasswordResult == false }">
				<script>
					alert("일치하는 정보가 없습니다");
				</script>
			</c:when>
		</c:choose>
	</div>


</body>
</html>