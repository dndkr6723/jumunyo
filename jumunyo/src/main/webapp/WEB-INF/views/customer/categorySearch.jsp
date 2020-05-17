<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body {
	margin: 0;
	padding: 0;
	background: #EAEAEA;
}
.category {
	width: 70%;
	height: 50px;
	margin: 50px 280px;
}

.category>a>span {
	float: left;
	width: 8%;
	text-align: center;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	border-left: 0.5px solid #EAEAEA; 
	border-right: 0.5px solid #EAEAEA; 
	padding: 20px 0;
	background: white;
}

.select {
	float:right;
	width: 25%;
}
.border {
	width: 67.5%;
	margin: 0 280px;
	height: 35px;
	border-bottom: 1px dashed black;
}
.restaurant {
	float: left;
	border: 2px solid black;
	width: 30%;
	height: 120px;
	margin: 10px -190px 0 296px;
	background: white;
}
.res_name {
	float: left;
	padding: 10px;
}
.res_name > b {
	font-size: 20px;
}
.star_img {
	position: relative;
	left: 120px;
	top: -85px;
	width:10px;
	margin: 10px 10px;
}
.star_point {
	position: relative;
	left: 135px;
	width: 130px;
	top: -120px;
	margin: 10px 10px;
	font-size: 20px;
	color: black;
}
.star_point > a {
	font-size: 20px;
}
.border2 {
	width: 67.5%;
	margin: 680px 280px 10px 280px;
	height: 35px;
	border-bottom: 1px dashed black;
}
.paging {
	width: 530px;
	float: right;
		
}

.pagingA {
	
}
.paging1 {
	float:left;
 	width: 30px;
 	height: 30px;
 	border: 1px solid black;
 	background: white;
}
.paging2 {
	float:left;
 	width: 30px;
 	height: 30px;
 	border: 1px solid black;
 	background: white;
}
.paging3 {
	float:left;
 	width: 30px;
 	height: 30px;
 	border: 1px solid black;
 	background: white;
}
.paging4 {
	float:left;
 	width: 30px;
 	height: 30px;
 	border: 1px solid black;
 	/* background: white; */
}
.paging5 {
	float:left;
 	width: 30px;
 	height: 30px;
 	border: 1px solid black;
 	background: white;
}
.paging6 {
	float:left;
 	width: 30px;
 	height: 30px;
 	border: 1px solid black;
 	background: white;
}
.paging7 {
	float:left;
 	width: 30px;
 	height: 30px;
 	border: 1px solid black;
}
.paging8 {
	float:left;
 	width: 30px;
 	height: 30px;
 	border: 1px solid black;
 	background: white;
}
.paging9 {
	float:left;
 	width: 30px;
 	height: 30px;
 	border: 1px solid black;
}
.footer {
	width: 100%;
	margin: 50px 0;
	border-top: 2px solid black;
}
</style>
<script>
	function menuon(id) {
		document.getElementById(id).style.background ="gray";
		
	}
	function menuoff(id) {
		document.getElementById(id).style.background ="white";
		
	}
	function reson(id) {
		document.getElementById(id).style.background ="#EAEAEA";
	}
	function resoff(id) {
		document.getElementById(id).style.background ="white";
	}
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div class="category" id="category_menu" >
		<a href="categorySearch.do"> <span id="s1" onmouseover="menuon('s1');" onmouseout="menuoff('s1');"> 
		<b>전체</b> </span></a> 
		<a href="categorySearch.do?category_id=1"> <span id="s2" onmouseover="menuon('s2');" onmouseout="menuoff('s2');"> 
		<b>프렌차이즈</b> </span></a> 
		<a href="categorySearch.do?category_id=2"> <span id="s3" onmouseover="menuon('s3');" onmouseout="menuoff('s3');"> 
		<b>치킨</b> </span></a> 
		<a href="categorySearch.do?category_id=3"> <span id="s4" onmouseover="menuon('s4');" onmouseout="menuoff('s4');"> 
		<b>피자/양식</b> </span></a> 
		<a href="categorySearch.do?category_id=4"> <span id="s5" onmouseover="menuon('s5');" onmouseout="menuoff('s5');"> 
		<b>중국집</b> </span></a> 
		<a href="categorySearch.do?category_id=5"> <span id="s6" onmouseover="menuon('s6');" onmouseout="menuoff('s6');"> 
		<b>한식</b> </span></a> 
		<a href="categorySearch.do?category_id=6"> <span id="s7" onmouseover="menuon('s7');" onmouseout="menuoff('s7');"> 
		<b>일식/돈까스</b> </span></a> 
		<a href="categorySearch.do?category_id=7"> <span id="s8" onmouseover="menuon('s8');" onmouseout="menuoff('s8');"> 
		<b>족발/보쌈</b> </span></a> 
		<a href="categorySearch.do?category_id=8"> <span id="s9" onmouseover="menuon('s9');" onmouseout="menuoff('s9');"> 
		<b>야식</b> </span></a> 
		<a href="categorySearch.do?category_id=9"> <span id="s10" onmouseover="menuon('s10');" onmouseout="menuoff('s10');"> 
		<b>분식</b> </span></a> 
		<a href="categorySearch.do?category_id=10"> <span id="s11" onmouseover="menuon('s11');" onmouseout="menuoff('s11');"> 
		<b>카페/디저트</b> </span></a> 
		<a href="categorySearch.do?category_id=11"> <span id="s12" onmouseover="menuon('s12');" onmouseout="menuoff('s12');"> 
		<b>기타</b> </span></a>
	</div>
	<form action="searchSort.do" id="select_form" method="post">
	<div class="select">
		<select name="calumn_name" id="suntaek1" style="width: 120px; height: 30px;" onchange="change();" >
		<option>정렬</option> 
		<option value="restaurant_grade">별점순</option> 
		<option value="reviewCount">리뷰많은순</option> 
		<option value="restaurant_date">매장등록날짜순</option> 		
		</select>
		<input type="hidden" name="restaurant_name" id="restaurant_name" value="${mrestaurant_name}" />
		<c:if test="${mcategory_id != null}">
			<input type="hidden" name="category_id" id="category_id" value="${mcategory_id}" />
		</c:if>
		
	</div>
	</form>
	<script>
	function change() {
		document.getElementById('select_form').submit();
	}
</script>
	<div class="border"></div>
		<c:forEach var="rvolist" items="${rvolist }" varStatus="status">
		<a href="restaurant_detail.do?restaurant_id=${rvolist.restaurant_id}" style="text-decoration:none; ">
	<div class="restaurant" id="res${status.count}" onmouseover="reson('res${status.count}');" onmouseout="resoff('res${status.count}');">
		<div style="float:left; padding: 10px;">
		<img src="" width="100px" height="100px" /></div>
		<div class="res_name">
			<b>${rvolist.restaurant_name }</b> <!-- 여기는 매장이름 -->
		</div> <br />
		<div class="star_img">
			<img src="resources/image/star2.png" width="15px" height="15px" />
		</div>
		<div class="star_point">
			${rvolist.restaurant_grade} &nbsp;&nbsp;&nbsp;&nbsp;<!-- 여기는 별점 -->
			<a>리뷰 ${rvoCount[status.index]}</a><!-- 여기는 리뷰댓글수 -->
			<br />
			<br />
			<b style="color: #FF0000;">카카오결제</b>
		</div>
	</div>
	</a>
		</c:forEach>
		<div class="border2"></div>
		<div class="paging">
		
		<!--페이징  -->
		<!--검색 후 페이징 하는 경우 -->
		<c:if test="${check == 1}">
			<c:if test="${paging.startPage != 1 }">
				<a class="pagingA" style="text-decoration:none; font-size: 20px;color: black;" href="searchRestaurantName.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&restaurant_name=${mrestaurant_name}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<div class="paging1"><b>${p }</b></div>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<div class="paging2"><a class="pagingA" style="text-decoration:none; font-size: 20px;color: black;" href="searchRestaurantName.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&restaurant_name=${mrestaurant_name}">${p }</a>
					</div>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<div class="paging5" id="page${status.count }" onmouseover="pageon('page${status.count }');" onmouseout="pageoff('page${status.count }');"><a class="pagingA" style="text-decoration:none; font-size: 20px;color: black;" href="searchRestaurantName.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&restaurant_name=${mrestaurant_name}">&gt;</a>
			</div>
			</c:if>
		</c:if>
		
		<!--카테고리를 누른 후 페이징  -->
		<c:if test="${check ==2}">
			<c:if test="${paging.startPage != 1 }">
				<div class="paging5" id="page${status.count }" onmouseover="pageon('page${status.count }');" onmouseout="pageoff('page${status.count }');">
					<a class="pagingA" style="text-decoration:none; font-size: 20px;color: black; text-align: center;" href="categorySearch.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&category_id=${mcategory_id}">&lt;</a>
				</div>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p" varStatus="status">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<div class="paging4">
							<b style="text-decoration:none; font-size: 20px;color: black; text-align: center;">&nbsp;${p }</b>
						</div>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<div class="paging5" id="page${status.count }" onmouseover="pageon('page${status.count }');" onmouseout="pageoff('page${status.count }');">
						<a style="text-decoration:none; font-size: 20px;color: black;" href="categorySearch.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&category_id=${mcategory_id}">&nbsp;${p }</a>
					</div>
					<script>
						function pageon(id) {
							document.getElementById(id).style.background="#EAEAEA";
						}
						function pageoff(id) {
							document.getElementById(id).style.background="white";
						}
					</script>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<div class="paging6" id="page${status.count }" onmouseover="pageon('page${status.count }');" onmouseout="pageoff('page${status.count }');">
					<a class="pagingA" style="text-decoration:none; font-size: 20px;color: black;" href="categorySearch.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&category_id=${mcategory_id}">&gt;</a>
				</div>
			</c:if>
		</c:if>
		
		<!--정렬을 누른 후 페이징  -->
		<c:if test="${check ==3}">
			<c:if test="${paging.startPage != 1 }">
				<div class="paging7">
				<a class="pagingA" style="text-decoration:none; font-size: 20px;color: black;" href="searchSort.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&restaurant_name=${mrestaurant_name}&calumn_name=${calumn_name}&category_id=${mcategory_id}">&lt;</a>
			</div>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<div class="paging7"><b>${p }</b></div>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<div class="paging8">
							<a class="pagingA" style="text-decoration:none; font-size: 20px;color: black;" href="searchSort.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&restaurant_name=${mrestaurant_name}&calumn_name=${calumn_name}&category_id=${mcategory_id}">${p }</a>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<div class="paging5" id="page${status.count }" onmouseover="pageon('page${status.count }');" onmouseout="pageoff('page${status.count }');">
					<a class="pagingA" style="text-decoration:none; font-size: 20px;color: black;" href="searchSort.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&restaurant_name=${mrestaurant_name}&calumn_name=${calumn_name}&category_id=${mcategory_id}">&gt;</a>
			</div>
			</c:if>
		</c:if>
			</div>
	<div class="footer">
		<jsp:include page="../include/footer.jsp"/>
		</div>
</body>
</html>