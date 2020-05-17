<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.logo {
	margin: 0 400px;
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
.buisness {
	margin: 0 550px;
}
.center {
	margin: 0 100px;
}
.center>b {
	font-size: 30px;
}
.center>a {
	font-size: 10px;
}
</style>
</head>
<body>
	<div class="logo">
	<a href="Index.do" style="text-decoration:none;">
		<b class="a1">주</b>		
		<b class="a2">문</b>		
		<b class="a3">이</b>		
		<b class="a4">요</b>		
	</a>
	</div>
	<div>
		<pre>
										<b>(유)케이지히어로 코리아</b>
										서울시 종로구 종로대로38길 12 마제스타시티 타워2 5층|대표자 : 모모씨|사업자등록번호:111-88-00000
		 								사업자정보확인통신판매업신고:제 2020-서울종로-0000호|개인정보담당자 : abcd123@kgitbank.co.kr
		 								|제휴문의 : abcd1234@kgitbank.co.kr|고객만족센터 : support@kgitbank.co.kr
		 								|호스트서비스사업자 : (주)케이지아이티뱅크
		</pre>
		<div class="buisness">
			<div>
				<c:choose>
					<c:when test="${sessionScope.userSession == null }">
						<div></div>
					</c:when>
					<c:otherwise>
						<div>
							<a href="ready" style="text-decoration:none;"><b>사업자페이지로 이동</b></a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		<span class="center"><b>고객만족센터 1111-0000</b><a>&nbsp;&nbsp; 24시간, 연중무휴</a></span>
		<span class="time"></span>
		</div>
		<pre>
										(유)케이지히어로 코리아는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 
										따라서 상품/ 거래정보 및 거래와 관련하여 주문이요에 등록된 판매자의 고의 또는 과실로 소비자에게 발생하는 손해에 대해
		 								(유)케이지히어로 코리아는 책임을 지지 않습니다. 상품 및 거래에 관하여 보다 정확한 정보는 해당 판매자에게 직접 
		 								확인하여 주시기 바랍니다. Copyright JUMOONYIYO. All Rights Reserved.
		</pre>
	</div>

	
</body>
</html>