<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.category1 {
	margin: 50px 300px;
	padding: 0;
}
.category1> div {
	float: left;
	margin: 0 50px;
	width: 200px;
	height: 200px; 
	border: black solid 1px;
}
.category2 {
	margin: 0 300px;
	position: relative;
	top: 50px;
}
.category2> div {
	float: left;
	margin: 0 50px;
	width: 200px;
	height: 200px; 
	border: black solid 1px;
}
.category3 {
	margin: 0 300px;
	position: relative;
	top: 100px;
}
.category3> div {
	float: left;
	margin: 0 50px;
	width: 200px;
	height: 200px; 
	border: black solid 1px;
}
.footer {
	width: 100%;
	position: absolute;
	top: 940px;
	border-top: 2px solid black;
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div class="category1">
	
	<div class="allCategory">	
	<a href="categorySearch.do" style="text-decoration:none;">
		<img src="resources/image/allCategory.png" alt="allCategory" width="200px" height="200px" />
		
		<br />
		<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전체 보기</b>
	</a>
	</div>
	
	
	<div class="franchise">
	<a href="categorySearch.do?category_id=1" style="text-decoration:none;">
		<img src="resources/image/Franchise.png" alt="Franchise" width="200px" height="200px" />
		
		<br />
		<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;프렌차이즈</b>
	</a>
	</div>
	
	
	<div class="chicken">
	<a href="categorySearch.do?category_id=2" style="text-decoration:none;">
		<img src="resources/image/Chicken.png" alt="Chicken" width="200px" height="200px" />
		
		<br />
		<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;치킨</b>
	</a>
	</div>
	
	
	<div class="pizza">
	<a href="categorySearch.do?category_id=3" style="text-decoration:none;">
		<img src="resources/image/Pizza.png" alt="Pizza" width="200px" height="200px" />
		
		<br />
		<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;피자/양식</b>
	</a>
	</div>
	
	</div>	
	<div class="category2">
	
	<div class="china">
	<a href="categorySearch.do?category_id=4" style="text-decoration:none;">
		<img src="resources/image/China.png" alt="China" width="200px" height="200px" />		
		<br />
		<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;중국집</b>
	</a>
	</div>
	
	
	<div class="korea">
	<a href="categorySearch.do?category_id=5" style="text-decoration:none;">
		<img src="resources/image/Korea.png" alt="Korea" width="200px" height="200px" />		
		<br />
		<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;한식</b>
	</a>
	</div>
	
	
	<div class="japan">
	<a href="categorySearch.do?category_id=6" style="text-decoration:none;">
		<img src="resources/image/Japan.png" alt="Japan" width="200px" height="200px" />
		
		<br />
		<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일식/돈까스</b>
	</a>
	</div>
	
	
	<div class="porkfeet">
	<a href="categorySearch.do?category_id=7" style="text-decoration:none;">
		<img src="resources/image/Porkfeet.png" alt="Porkfeet" width="200px" height="200px" />
		
		<br />
		<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;족발</b>
	</a>
	</div>
	
	</div>
	<div class="category3">
	
	<div class="yasik">
	<a href="categorySearch.do?category_id=8" style="text-decoration:none;">
		<img src="resources/image/Yasik.png" alt="Yasik" width="200px" height="200px" />
		
		<br />
		<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;야식</b>
	</a>
	</div>
	
	
	<div class="boonsik">
	<a href="categorySearch.do?category_id=9" style="text-decoration:none;">
		<img src="resources/image/Boonsik.png" alt="Boonsik" width="200px" height="200px" />
		
		<br />
		<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;분식</b>
	</a>
	</div>
	
	
	<div class="caffe">
	<a href="categorySearch.do?category_id=10" style="text-decoration:none;">
		<img src="resources/image/Caffe.png" alt="Caffe" width="200px" height="200px" />
		
		<br />
		<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;카페/디저트</b>
	</a>
	</div>
	
	
	<div class="other">
	<a href="categorySearch.do?category_id=11" style="text-decoration:none;">
		<img src="resources/image/Other.png" alt="Other" width="200px" height="200px" />
		
		<br />
		<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기타</b>
	</a>
	</div>
	
	</div>
		<div class="footer">
		<jsp:include page="../include/footer.jsp"/>
		</div>




</body>
</html>