<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>

#header{
	height : 150px;
	width : 100%;
	background : yellow;
	display: flex;
}

#sitename{
	height : 150px;
	width : 200px;
	background : green;
	text-align: center;
}

#businesspage{
	height : 150px;
	width : 200px;
	background : yellow;
	text-align: center;
	margin-right:40%;
}

#restaurant_name {
	height : 150px;
	width : 200px;
	background : green;
	text-align: center;
}

#user_name{
	height : 150px;
	width : 200px;
	background : yellow;
	text-align: center;
}

#mypage{
	height : 150px;
	width : 200px;
	background : green;
	text-align: center;
}

#logout{
	height : 150px;
	width : 200px;
	background : yellow;
	text-align: center;
}


</style>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="header">
	<div id="sitename">
		주문이요
	</div>
	<div id="businesspage">
		사업자페이지
	</div>
	<div id="restaurant_name">
		${rvo.restaurant_name }
	</div>
	<div id="user_name">
		${uvo.user_name }
	</div>
	<div id="mypage">
		내정보
	</div>
	<div id="logout">
		로그아웃
	</div>
</div>

</body>
</html>