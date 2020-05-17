<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.img {
	margin: 5% 40%;
}
#showDate {
	
}
</style>
 <script type='text/javascript' src='http://code.jquery.com/jquery-1.10.2.min.js'></script>
 <script>
 function historyback() {
		window.location="Index.do"
	}
 </script>
       <script type='text/javascript'>
           $(document).ready(function() {
               var seconds = 5;

               function calculate() {
                   setTimeout(calculate, 1000);
                   $('#showDate').html( seconds + ' 초 후에 ');
                   seconds--;
                   if (seconds < 0) {
                	   $('#showDate').html('0 초 후에');                    
                   }
               }
               calculate();
           });
       </script>
</head>
<body onLoad="setTimeout('historyback()',5000)">
	<div class="img">
	<img src="resources/image/loginfail.png" alt="loginfail" width="300px" height="200px;" /> <!-- resources/image/loginfail.png -->
	</div>
	<div style="margin: 0 0 0 40%; width: 330px;">
	<h2><b style="color: red;">회원가입</b>에 실패하셨습니다.</h2>
	<div id='showDate'></div>
	<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
	<a href="">홈으로 이동합니다</a>
	</div>
	
	
</body>
</html>