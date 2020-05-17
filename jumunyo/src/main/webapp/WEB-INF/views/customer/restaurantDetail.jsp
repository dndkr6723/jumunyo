<%@page import="java.util.*"%>
<%@page import="com.finalp.jumunyo.vo.ReplyVO"%>
<%@page import="com.finalp.jumunyo.vo.ReviewVO"%>
<%@page import="com.finalp.jumunyo.vo.MenuVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.finalp.jumunyo.vo.RestaurantVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
.res-name {
	width: 50%;
	height: 50px;
	border: 1px solid #BDBDBD;
	margin: 10px 25% 0 25%;
}
.btn {
	margin: 5px 0 5px 70%; 
	padding: 0;
	width: 80px;
	height: 50px;
	border-radius: 20px;
	border: none;
	background-color: #740000;
	font-size: 20px;
	color: #FFF;
}
.menu {
  width: 50%;
  height: 330px;
  margin: 0 0 50px 25%;
  align-items: center;
  justify-content: center;
  
  font-family: 'Ropa Sans', sans-serif;
  border: 1px solid #BDBDBD;
} 
.reviewtitle {
	width: 50%;
	height: 30px;
	border: 1px solid #BDBDBD;
	margin: 50px 25% 0 25%;
	font-family: Helvetica, Dotum, '돋움', Apple SD Gothic Neo, sans-serif; 
}
.starpoint {
	width: 50%;
	height: 100px;
	text-align: center;
	font-size: 30px;
	border-left: 1px solid #BDBDBD;
	border-right: 1px solid #BDBDBD;
	border-bottom: 1px solid #BDBDBD;
	margin: 0 25% 0 25%;
}
.slider {
  width: 950px;
  text-align: center;
  overflow: hidden;
}

.slides {
  display: flex;
  overflow-x: auto;  
  border-radius: 5px;
}

.slides > div {
  flex-shrink: 0;
  width: 250px;
  height: 290px;
  border-radius: 10px;
  background: #eee;
  transform: scale(1);
  transition: transform 0.5s;
  font-size: 20px;
  margin: 0 5px;
}
.slider > a {
  width: 30px;
  height: 30px;
  background: white;
  text-decoration: none;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  margin: 0 0 2rem 0;
  position: relative;
}
.slider > a:active {
  top: 1px;
}
.slider > a:focus {
  background: #000;
}

.review-count {
	width: 50%;
	height: 20px;
	border-left: 1px solid #BDBDBD;
	border-right: 1px solid #BDBDBD;
	border-bottom: 1px solid #BDBDBD;
	margin: 0 25% 0 25%;
}
.review-content {
	width: 50%;
	margin: 0 25% 0 25%;
	height: auto;
	background: #F2FFED;
	border-left: 1px solid #BDBDBD;
	border-right: 1px solid #BDBDBD;
	border-bottom: 1px solid #BDBDBD;
}
.nickname {
	float: left;
	width: auto;
	margin: 0 5px;
	font-family: 'Nanum Pen Script', cursive;
}
.review-date {
	width: auto;
	font-family: 'Nanum Pen Script', cursive;
}
.user-star {
	float: left;
}
.user-starpoint {
	margin: 0 10px;
	font-family: 'Nanum Pen Script', cursive;
}
.review-menu {
	color: #C6C6C6;
}
.review-img {
	margin: 0 2%;
	width: 90%;
	height: 200px;
	border: 1px solid #BDBDBD;
}
.review-text {
	margin: 0 5%;
	width: 80%;
	font-size: 20px;
}
.reply {
	width: 50%;
	margin: 10px 25% 0 25%;
	height: auto;
	background: #EAEAEA;
	border-left: 1px solid #BDBDBD;
	border-right: 1px solid #BDBDBD;
	border-bottom: 1px solid #BDBDBD;
}
.arrow {
	margin: -10px 0;
}
.buisnessman {
	float: left;
	width: auto;
	margin: 0 20px;
	font-family: 'Nanum Pen Script', cursive;
}
.paging {
	width: 50%;
	margin:0 40%;
	display: inline-block;
}
.paging> a {
	color: black;
  	float: left;
  	padding: 8px 16px;
  	text-decoration: none;
  	margin: -10px;
}
.info-title {
	width: 50%;
	height: 30px;
	border: 1px solid #BDBDBD;
	margin: 50px 25% 0 25%;
	font-family: Helvetica, Dotum, '돋움', Apple SD Gothic Neo, sans-serif;
}
.info {
	width: 50%;
	margin: 0 25% 0 25%;
	padding: 0;
	height: auto;
	border-left: 1px solid #BDBDBD;
	border-right: 1px solid #BDBDBD;
	border-bottom: 1px solid #BDBDBD;
}
.info-titles {
	font-family: Helvetica, Dotum, '돋움', Apple SD Gothic Neo, sans-serif;
	color: red; 
	margin: 0 15px;
}
.info-map-title {
	font-family: Helvetica, Dotum, '돋움', Apple SD Gothic Neo, sans-serif;
	color: red; 
	margin: 20px 15px 0 15px;
}
.order {
	position: fixed;
	top: 100px;
	left: 80%;
	width: 300px;
	height: auto;
	border: 1px solid #BDBDBD;
}
.order-title {
	width: 100%;
	height: 50px;
	background: #980000;
	text-align: center;
	padding: 20px 0 0 0;
	font: cursive;
	font-size: 30px;
}
.orderlist {
	width: 100%;
	height: auto;
	font: cursive;
	font-size: 20px;
}
.button {/* 
	position: relative;
	top: -280px; */
}
.addmenuname {
	overflow-x: auto;
	overflow-y: auto;
	height: 300px;
	margin: 3px 5px 3px 5px;
}
.order::-webkit-scrollbar {
	width: 10px;
  	height: 10px;
}
.order::-webkit-scrollbar-thumb {
	background: black;
  	border-radius: 10px;
}
.order::-webkit-scrollbar-track {
	background: transparent;
}
.Calculation {
	width: 100%;
	height: 50px;
	color: red;
	font-size: 30px;
	border-top: 1px solid #BDBDBD;
}
.footer {
	border-top: 2px solid black;
	margin: 20px;
}
.menuname {
	font-size: 15px;
}
.deleteimg {
	display: none;	
	margin: 0 5px;
}
.submit {
	width: 100%;
	height: auto;
	border-left: 1px solid #BDBDBD;
	border-right: 1px solid #BDBDBD;
}
.input-btn {
	width: 100%;
	height: 50px;
	border: none;
	background: red;
}
</style>

<body>
<!-- 매장 상세 페이지 입니다. (주문메뉴/좌석예약/지도 등등) -->
<%
	RestaurantVO res1 = (RestaurantVO)session.getAttribute("getOneStore");
	ArrayList<MenuVO> menu_list1 = (ArrayList<MenuVO>)session.getAttribute("getStoreMenu");
	ArrayList<ReviewVO> review_list1 = (ArrayList<ReviewVO>)session.getAttribute("getStoreReview");
	HashMap<String, ReplyVO> reply_list1 = (HashMap<String, ReplyVO>)session.getAttribute("getReviewReply");

	int count1 = 0; int count2 = 0; int count3 = 1;
%>


	<jsp:include page="../include/header.jsp" />
	<div class="res-name">
		<h1 align="center"><%=res1.getRestaurant_name() %></h1>
		<!-- 여기는 매장명 출력 -->
	</div>	
	<div class="reservation">
		<input type="button" value="좌석예약" class="btn" onclick="location.href='seat_order'"/>
	</div>
	<div class="menu">
		<div class="slider">
		
			
			
			<div class="slides">
				<%for(int i=0; i<menu_list1.size(); i++) {%>
				<%count2++; %>
				<div id="slide-<%=count2%>" > <!-- 여기는 메뉴이미지,메뉴이름,메뉴가격 출력 -->
				<img src="resources/image/Chicken.png" style="padding: 5px"/>
				<ul style="padding: 0; margin: 0; list-style-type: none;">
				<li id="id<%=count2 %>" style="display: none;"><%=menu_list1.get(i).getMenu_id() %></li> 
				<li id="name<%=count2 %>"><%=menu_list1.get(i).getMenu_name() %></li> 
				<li id="price<%=count2 %>"><%=menu_list1.get(i).getMenu_price() %>원</li>
				</ul>
				
				<input type="hidden" id="priceNum<%=count2 %>" value="<%=menu_list1.get(i).getMenu_price() %>" />
				<input type="button" class="button" value="주문표에추가" id="btn<%=count2 %>" />
				
				
				</div> 
				
				<%} %>
			</div>
			<%for(int i=0; i<menu_list1.size(); i++) {%>
			<%count1++; %>
			<a href="#slide-<%=count1%>"><%=menu_list1.get(i).getMenu_name() %><!-- 여기는 메뉴이름 출력 --></a> 
			
			<%} %>
		</div>
	</div>
	<div class="reviewtitle">
		<h1 align="center">리뷰</h1>
	</div>
	<div class="starpoint">
		<% double starPoint = 3.5; %>
		<b><%=starPoint %></b> <!-- 여기는 별점수 출력-->
		<br />
		<% if(starPoint>=5.0) {%>
		<img src="resources/image/star2.png" width="50px" height="50px" />
		<img src="resources/image/star2.png" width="50px" height="50px" />
		<img src="resources/image/star2.png" width="50px" height="50px" />
		<img src="resources/image/star2.png" width="50px" height="50px" />
		<img src="resources/image/star2.png" width="50px" height="50px" />
		<%} else if(starPoint>=4.0) {%>
		<img src="resources/image/star2.png" width="50px" height="50px" />
		<img src="resources/image/star2.png" width="50px" height="50px" />
		<img src="resources/image/star2.png" width="50px" height="50px" />
		<img src="resources/image/star2.png" width="50px" height="50px" />
		<img src="resources/image/star1.png" width="50px" height="50px" />
		<%} else if(starPoint>=3.0) {%>
		<img src="resources/image/star2.png" width="50px" height="50px" />
		<img src="resources/image/star2.png" width="50px" height="50px" />
		<img src="resources/image/star2.png" width="50px" height="50px" />
		<img src="resources/image/star1.png" width="50px" height="50px" />
		<img src="resources/image/star1.png" width="50px" height="50px" />
		<%} else if(starPoint>=2.0) {%>
		<img src="resources/image/star2.png" width="50px" height="50px" />
		<img src="resources/image/star2.png" width="50px" height="50px" />
		<img src="resources/image/star1.png" width="50px" height="50px" />
		<img src="resources/image/star1.png" width="50px" height="50px" />
		<img src="resources/image/star1.png" width="50px" height="50px" />
		<%} else if(starPoint>=1.0) {%>
		<img src="resources/image/star2.png" width="50px" height="50px" />
		<img src="resources/image/star1.png" width="50px" height="50px" />
		<img src="resources/image/star1.png" width="50px" height="50px" />
		<img src="resources/image/star1.png" width="50px" height="50px" />
		<img src="resources/image/star1.png" width="50px" height="50px" />
		<%} else {%>
		<img src="resources/image/star1.png" width="50px" height="50px" />
		<img src="resources/image/star1.png" width="50px" height="50px" />
		<img src="resources/image/star1.png" width="50px" height="50px" />
		<img src="resources/image/star1.png" width="50px" height="50px" />
		<img src="resources/image/star1.png" width="50px" height="50px" />
		<%} %>
 	</div>
	<div class="review-count">
		<%= review_list1.size() %> <!-- 여기는 리뷰의 갯수 출력-->
	</div>
	<%for(int i=0; i<review_list1.size(); i++) {%>
	<div class="review-content">
		<div class="nickname">
		<%= review_list1.get(i).getUser_id() %>
		</div>
		<div class="review-date">
		<%= review_list1.get(i).getReview_date() %>
		</div>
		<div class="user-star">
		<% double userStarPoint = review_list1.get(i).getReview_grade(); %>
		<% if(userStarPoint>=5.0) {%>
		<img src="resources/image/star2.png" width="20px" height="20px" />
		<img src="resources/image/star2.png" width="20px" height="20px" />
		<img src="resources/image/star2.png" width="20px" height="20px" />
		<img src="resources/image/star2.png" width="20px" height="20px" />
		<img src="resources/image/star2.png" width="20px" height="20px" />
		<%} else if(userStarPoint>=4.0) {%>
		<img src="resources/image/star2.png" width="20px" height="20px" />
		<img src="resources/image/star2.png" width="20px" height="20px" />
		<img src="resources/image/star2.png" width="20px" height="20px" />
		<img src="resources/image/star2.png" width="20px" height="20px" />
		<img src="resources/image/star1.png" width="20px" height="20px" />
		<%} else if(userStarPoint>=3.0) {%>
		<img src="resources/image/star2.png" width="20px" height="20px" />
		<img src="resources/image/star2.png" width="20px" height="20px" />
		<img src="resources/image/star2.png" width="20px" height="20px" />
		<img src="resources/image/star1.png" width="20px" height="20px" />
		<img src="resources/image/star1.png" width="20px" height="20px" />
		<%} else if(userStarPoint>=2.0) {%>
		<img src="resources/image/star2.png" width="20px" height="20px" />
		<img src="resources/image/star2.png" width="20px" height="20px" />
		<img src="resources/image/star1.png" width="20px" height="20px" />
		<img src="resources/image/star1.png" width="20px" height="20px" />
		<img src="resources/image/star1.png" width="20px" height="20px" />
		<%} else if(userStarPoint>=1.0) {%>
		<img src="resources/image/star2.png" width="20px" height="20px" />
		<img src="resources/image/star1.png" width="20px" height="20px" />
		<img src="resources/image/star1.png" width="20px" height="20px" />
		<img src="resources/image/star1.png" width="20px" height="20px" />
		<img src="resources/image/star1.png" width="20px" height="20px" />
		<%} else {%>
		<img src="resources/image/star1.png" width="20px" height="20px" />
		<img src="resources/image/star1.png" width="20px" height="20px" />
		<img src="resources/image/star1.png" width="20px" height="20px" />
		<img src="resources/image/star1.png" width="20px" height="20px" />
		<img src="resources/image/star1.png" width="20px" height="20px" />
		<%} %>
		</div>
		<div class="user-starpoint">
		<%=userStarPoint %>
		</div>
		<div class="review-menu">
		주문 메뉴와 수량
		</div>
			<img src="resources/image/Pizza.png" class="review-img" />
		<div class="review-text">
		<p><%=review_list1.get(i).getReview_content() %></p>
		</div>
	</div>
	
	<%		
		ReplyVO reply1 = reply_list1.get(""+review_list1.get(i).getReview_id());
		String display1= "";
	%>
	
	<% if(reply1 != null && reply1.getReply_content() != "댓글없음") { 
		display1 = "block";
	} else {
		display1 = "none";
	}
	%>
	
	<div class="reply" style="display: <%= display1%>">
		<div class="arrow">
			<img src="resources/image/arrow.png" width="15px" height="15px"/>
		</div>
		<div class="buisnessman">
		사장님
		</div>
		<div class="review-date">
		<%= reply1.getReply_date() %>
		</div>
		<div class="review-text">
		<p><%= reply1.getReply_content() %></p>
		</div>
	</div>
	
	<%} %>
		<div class="paging">
			<a href="#" id="s1" onmouseover="menuon('s1');" onmouseout="menuoff('s1');">&laquo;</a>
  			<a href="#" id="s2" onmouseover="menuon('s2');" onmouseout="menuoff('s2');">1</a>
  			<a href="#" id="s3" onmouseover="menuon('s3');" onmouseout="menuoff('s3');">2</a>
  			<a href="#" id="s4" onmouseover="menuon('s4');" onmouseout="menuoff('s4');">3</a>
  			<a href="#" id="s5" onmouseover="menuon('s5');" onmouseout="menuoff('s5');">4</a>
  			<a href="#" id="s6" onmouseover="menuon('s6');" onmouseout="menuoff('s6');">5</a>
  			<a href="#" id="s7" onmouseover="menuon('s7');" onmouseout="menuoff('s7');">6</a>
  			<a href="#" id="s8" onmouseover="menuon('s8');" onmouseout="menuoff('s8');">&raquo;</a>
		</div>
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
		<div class="info-title">
			<h1 align="center">정보</h1>
		</div>
		<div class="info">
		<div class="info-titles">
			<h2>업체정보</h2>
		</div>
		<div class="Info-tel">
			전화번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=res1.getRestaurant_tell() %>
		</div>
		<div class="buisnessnumber">
			사업자등록번호 &nbsp;&nbsp;&nbsp;
			<%=res1.getRestaurant_businessnumber() %>
		</div>
		<div class="buisness-name">
			상호명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=res1.getRestaurant_name() %>
		</div>
		<div class="info-map-title">
			<h2>지도</h2>
		</div>
		<div class="res-address">
		<script>
		var restaurant_address = getRestaurant_address();
		</script>
		<br>주소 :  ${getOneStore.restaurant_address}
		<%-- 	주소 : <%=res1.getRestaurant_address() %> --%>
		
		<!-- 지도 aip -->
		<!-- 사업자 등록시 입력했던 주소값을 기초로 api에 담아야한다 -->
		<%-- <input type="text" name="restaurant_address" class="addressinput" value=${ restaurant_address} /> --%>
		<input type="hidden" id="find1" class="addressfindbtn" onmouseover="changecolor('find1');" onmouseout="changeback('find1');"
			onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
		<div id="map" style="width:500px;height:400px;"></div>
			<script>
				/* 도로명 주소 api */
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div
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
									document.getElementById("restaurant_address").value = addr;
									// 주소로 상세 정보를 검색
									geocoder
											.addressSearch(
													data.address,
													function(results, status) {
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


		</div>
		<div class="map">
			
		</div>
	</div>
		<div class="order">
			<div class="order-title">
				<b>주문표</b>
			</div>
			<div class="orderlist">
			<form action="cart.do" method="post">
				<div class="addmenuname" id="add">
					<%for(int i=0; i< menu_list1.size(); i++) { %>
					<div class="menuname" id="menu<%=count3%>">
					<div class="deleteimg" id="deleteimg<%=count3%>">
					<input type="button" value="취소" id="delete<%=count3%>" 					
					style="border-radius: 50px; border:double white; background: red;" />	
					<input type="button" value="+" id="plus<%=count3%>" 
					style="border-radius: 50px; border:double black; background: white; 
					margin: 0 0 0 0; float: right;" />
					<input type="button" value="-" id="minus<%=count3%>" 
					style="border-radius: 50px; border:double black; background: white;
					margin: 0 0 0 0; float: right;" />
					</div>
					<input type="hidden" id="menuid" name="menuId-<%=count3%>" value="<%=menu_list1.get(i).getMenu_id() %>"  />
					<input type="hidden" name="menu_name-<%=count3 %>" value="<%=menu_list1.get(i).getMenu_name() %>">
					<input type="hidden" name="price-<%=count3%>" id="price-<%=count3%>"
						 value="<%=menu_list1.get(i).getMenu_price() %>" />
					<input type="hidden" name="menu_count<%=count3 %>" id="ea<%=count3 %>" />
					<input type="hidden" name="menu_price-<%=count3%>" 
						 value="<%=menu_list1.get(i).getMenu_price() %>" />										
					</div>
					<% count3++;
					} %>
				</div>
				
				<div class="Calculation" >
				<input type="text" value="총 합계 :" disabled="disabled"
				style="width: 100px; height: 30px; background: white; border: none; font-size: 25px; margin: 0 0 10px 0;"/>
				
				<input type="text" name="total" id="total1" value="0" disabled="disabled" 
				style="width: 100px; height: 30px; background: white; border: none; font-size: 30px; margin: 10px 0 0 0;"/>
				<a>원</a>
				
				</div>
				<div class="addinput" id="addinput">
					<input type="hidden" name="a" id="a" />
				</div>
				<div class="submit">
					<input type="submit" value="주문하기" class="input-btn" value=""/>
				</div>
				</form>
			</div>
			
		</div>
		
		<div class="footer">
		<jsp:include page="../include/footer.jsp"/>
		</div> 
</body>
<script>
		var name1 = document.getElementById("name1").innerHTML;
		var price1 = document.getElementById("price1").innerHTML;
		if(document.getElementById("name2")) {
			var name2 = document.getElementById("name2").innerHTML;
			var price2 = document.getElementById("price2").innerHTML;
		}
		
		if(document.getElementById("name3")) {
			var name3 = document.getElementById("name3").innerHTML;
			var price3 = document.getElementById("price3").innerHTML;
		}
		
		if(document.getElementById("name4")) {
			var name4 = document.getElementById("name4").innerHTML;
			var price4 = document.getElementById("price4").innerHTML;
		}
		
		if(document.getElementById("name5")) {
			var name5 = document.getElementById("name5").innerHTML;
			var price5 = document.getElementById("price5").innerHTML;
		}
		
		if(document.getElementById("name6")) {
			var name6 = document.getElementById("name6").innerHTML;
			var price6 = document.getElementById("price6").innerHTML;
		}
		
		if(document.getElementById("name7")) {
			var name7 = document.getElementById("name7").innerHTML;
			var price7 = document.getElementById("price7").innerHTML;
		}
		
		if(document.getElementById("name8")) {
			var name8 = document.getElementById("name8").innerHTML;
			var price8 = document.getElementById("price8").innerHTML;
		}
		if(document.getElementById("name9")) {
			var name9 = document.getElementById("name9").innerHTML;
			var price9 = document.getElementById("price9").innerHTML;	
		}
		
		if(document.getElementById("name10")) {
			var name10 = document.getElementById("name10").innerHTML;
			var price10 = document.getElementById("price10").innerHTML;	
		}	
		var priceNum1 = parseInt(price1);
		var priceNum2 = parseInt(price2);
		var priceNum3 = parseInt(price3);
		var priceNum4 = parseInt(price4);
		var priceNum5 = parseInt(price5);
		var priceNum6 = parseInt(price6);
		var priceNum7 = parseInt(price7);
		var priceNum8 = parseInt(price8);
		var priceNum9 = parseInt(price9);
		var priceNum10 = parseInt(price10);
		
		var num1 = priceNum1;
		var num2 = priceNum2;
		var num3 = priceNum3;
		var num4 = priceNum4;
		var num5 = priceNum5;
		var num6 = priceNum6;
		var num7 = priceNum7;
		var num8 = priceNum8;
		var num9 = priceNum9;
		var num10 = priceNum10;
	    btn1 = document.getElementById('btn1');
	    btn2 = document.getElementById('btn2');
	    btn3 = document.getElementById('btn3');
	    btn4 = document.getElementById('btn4');
	    btn5 = document.getElementById('btn5');
	    btn6 = document.getElementById('btn6');
	    btn7 = document.getElementById('btn7');
	    btn8 = document.getElementById('btn8');
	    btn9 = document.getElementById('btn9');
	    btn10 = document.getElementById('btn10');
	    ibtn1 = document.getElementById('delete1');
	    ibtn2 = document.getElementById('delete2');
	    ibtn3 = document.getElementById('delete3');
	    ibtn4 = document.getElementById('delete4');
	    ibtn5 = document.getElementById('delete5');
	    ibtn6 = document.getElementById('delete6');
	    ibtn7 = document.getElementById('delete7');
	    ibtn8 = document.getElementById('delete8');
	    ibtn9 = document.getElementById('delete9');
	    ibtn10 = document.getElementById('delete10');
	    pbtn1 = document.getElementById('plus1');
	    pbtn2 = document.getElementById('plus2');
	    pbtn3 = document.getElementById('plus3');
	    pbtn4 = document.getElementById('plus4');
	    pbtn5 = document.getElementById('plus5');
	    pbtn6 = document.getElementById('plus6');
	    pbtn7 = document.getElementById('plus7');
	    pbtn8 = document.getElementById('plus8');
	    pbtn9 = document.getElementById('plus9');
	    pbtn10 = document.getElementById('plus10');
	    mbtn1 = document.getElementById('minus1');
	    mbtn2 = document.getElementById('minus2');
	    mbtn3 = document.getElementById('minus3');
	    mbtn4 = document.getElementById('minus4');
	    mbtn5 = document.getElementById('minus5');
	    mbtn6 = document.getElementById('minus6');
	    mbtn7 = document.getElementById('minus7');
	    mbtn8 = document.getElementById('minus8');
	    mbtn9 = document.getElementById('minus9');
	    mbtn10 = document.getElementById('minus10');
	    var countstr = 0;
	    var count1 = parseInt(countstr);
	    var count2 = parseInt(countstr);
	    var count3 = parseInt(countstr);
	    var count4 = parseInt(countstr);
	    var count5 = parseInt(countstr);
	    var count6 = parseInt(countstr);
	    var count7 = parseInt(countstr);
	    var count8 = parseInt(countstr);
	    var count9 = parseInt(countstr);
	    var count10 = parseInt(countstr);
	    var idnum1 = 0;
    	var idnum = parseInt(idnum1); 
    	var str = "";
    	var istr = 0;
    	var i1 = parseInt(istr);
    	var i2 = parseInt(istr);
    	var i3 = parseInt(istr);
    	var i4 = parseInt(istr);
    	var i5 = parseInt(istr);
    	var i6 = parseInt(istr);
    	var i7 = parseInt(istr);
    	var i8 = parseInt(istr);
    	var i9 = parseInt(istr);
    	var i10 = parseInt(istr);
	    btn1.onclick = function() {
	    	i1++;
	    	document.getElementById('plus1').style.display="block";
	    	document.getElementById('minus1').style.display="block";
	    	count1++;		    	
	    	var div1 = document.createElement("div");	    	
	    	div1.className = "newdiv1";
	    	div1.id = "na";	    	
	    	document.getElementById("menu1").appendChild(div1);	 
 	    	var node1 = document.createElement("B");
			var node11 = document.createElement("A");
			var hr = document.createElement("hr");
			node1.append(name1+" :  "+priceNum1+"원 ");	
			node11.append(" x ");	
			document.getElementById("na").append(node1);
			document.getElementById("na").append(node11);
	        num1=priceNum1*i1;		
	        document.getElementById('price-1').value=num1-priceNum1;
	        document.getElementById('deleteimg1').style.display="block";
	        var na = document.getElementById("na").innerText;
	        var str = "";	    	 
	    	str+="<input type='text' value='"+na+"' id='input1' name='tb1'>";
	    	str+="<input type='text' value='"+count1+"' id='input11' name='tb11'>";
	    	
	    	var addedDiv = document.getElementById("na");
	    	addedDiv.innerHTML = str;
	    	document.getElementById("input1").style.width="200px";
	    	document.getElementById("input1").style.height="50px";
	    	document.getElementById("input1").style.border="none";
	    	document.getElementById("input1").style.background="white";
	    	document.getElementById("input1").disabled="disabled";
	    	document.getElementById("input11").style.width="20px";
	    	document.getElementById("input11").style.height="10px";
	    	document.getElementById("input11").style.border="none";
	    	document.getElementById("input11").style.background="white";
	    	document.getElementById("input11").disabled="disabled";
	    	document.getElementById("na").append(hr);
	    	document.getElementById("ea1").value = count1;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum1;
			document.getElementById('total1').value=total11;
	    	
	    }
	    ibtn1.onclick = function() {
	    	count1 = 0;
	    	var id1 = document.getElementById("na");
	    	var id1 = document.querySelector(".newdiv1");    	
	    	num1=0;
	    	document.getElementById('price-1').value=0;    	
	    		if(num1==0) {
	    			document.getElementById('deleteimg1').style.display="none";
	    			document.getElementById("menu1").removeChild(id1);
	    			count1 = 0;
	    		}
	    		var total1 = document.getElementById("total1").value;
				total11 = parseInt(total1);
				if(i1>0) {
				total11 = total11-(priceNum1*i1);
				i1=0;
				}
				document.getElementById('total1').value=total11;
		    	document.getElementById("ea1").value = 0;

				
	    	} 
	    pbtn1.onclick = function() {
	    	i1++;
	    	count1++;
	    	document.getElementById('minus1').style.display="block";
    		var input11 = document.getElementById('input11').value;
			input111 = parseInt(input11);
			input111++;
			document.getElementById('input11').value=input111;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum1;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea1").value = count1;

		}
	    mbtn1.onclick = function() {
	    	i1--;
    		var input11 = document.getElementById('input11').value;
			input111 = parseInt(input11);
			input111--;
			document.getElementById('input11').value=input111;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11-priceNum1;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea1").value = count1;
			if(i1==0) {			
			document.getElementById('minus1').style.display="none";
			count1=0;
	    	}
		}

		btn2.onclick = function() {
			i2++;
			document.getElementById('plus2').style.display="block";
	    	document.getElementById('minus2').style.display="block";
			count2++;
	    	var div2 = document.createElement("div");
	    	div2.className = "newdiv2";
	    	div2.id = "nd";
	    	document.getElementById("menu2").appendChild(div2);
			var node2 = document.createElement("B");
			var node12 = document.createElement("A");
			var hr = document.createElement("hr");
			node2.append(name2+" : "+priceNum2+"원");			
			node12.append(" x ");			
			document.getElementById("nd").append(node2);
			document.getElementById("nd").append(node12);
			document.getElementById("nd").append(hr);
			num2=num2+priceNum2;
	        document.getElementById('price-2').value=num2-priceNum2;
	        document.getElementById('deleteimg2').style.display="block";
	        var nd = document.getElementById("nd").innerText;
	        var str = "";	    	 
	    	str+="<input type='text' value='"+nd+"' id='input2' name='tb2'>";
	    	str+="<input type='text' value='"+count2+"' id='input22' name='tb22'>";
	    	var addedDiv = document.getElementById("nd");
	    	addedDiv.innerHTML = str;
	    	document.getElementById("input2").style.width="200px";
	    	document.getElementById("input2").style.height="20px";
	    	document.getElementById("input2").style.border="none";
	    	document.getElementById("input2").style.background="white";
	    	document.getElementById("input2").disabled="disabled";
	    	document.getElementById("input22").style.width="20px";
	    	document.getElementById("input22").style.height="20px";
	    	document.getElementById("input22").style.border="none";
	    	document.getElementById("input22").style.background="white";
	    	document.getElementById("input22").disabled="disabled";
	    	document.getElementById("nd").append(hr);
	    	var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum2;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea2").value = count2;

		}
		ibtn2.onclick = function() {	    	
	    	count2 = 0;
	    	var id2 = document.getElementById("nd");
	    	var id2 = document.querySelector(".newdiv2");    	
	    	num2=0;
	    	document.getElementById('price-2').value=0;    	
	    		if(num2==0) {
	    			document.getElementById('deleteimg2').style.display="none";
	    			document.getElementById("menu2").removeChild(id2);
	    			count2=0;
	    		}
	    		var total1 = document.getElementById("total1").value;
				total11 = parseInt(total1);
				if(i2>0) {
				total11 = total11-(priceNum2*i2);
				i2=0;
				}
				document.getElementById('total1').value=total11;
		    	document.getElementById("ea2").value = 0;

	    } 
		pbtn2.onclick = function() {
			i2++;
			count2++;
	    	document.getElementById('minus2').style.display="block";
	    	document.getElementById('minus2').style.display="block";
    		var input22 = document.getElementById('input22').value;
			input222 = parseInt(input22);
			input222++;
			document.getElementById('input22').value=input222;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum2;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea2").value = count2;

		}
	    mbtn2.onclick = function() {
	    	i2--;
    		var input22 = document.getElementById('input22').value;
			input222 = parseInt(input22);
			input222--;
			document.getElementById('input22').value=input222;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11-priceNum2;
			document.getElementById('total1').value=total11;
			if(i2==0) {			
			document.getElementById('minus2').style.display="none";
			count2=0;
	    	}
	    	document.getElementById("ea2").value = count2;

		}
		btn3.onclick = function() {
			i3++;
			document.getElementById('plus3').style.display="block";
	    	document.getElementById('minus3').style.display="block";
			count3++;
	    	var div3 = document.createElement("div");
	    	div3.className = "newdiv3";
	    	div3.id = "nb";
	    	document.getElementById("menu3").appendChild(div3);
			var node3 = document.createElement("B");
			var node13 = document.createElement("A");
			var hr = document.createElement("hr");			
			node3.append(name3+" : "+priceNum3+"원");			
			node13.append(" x ");
			document.getElementById("nb").append(node3);
			document.getElementById("nb").append(node13);
			document.getElementById("nb").append(hr);
			num3=num3+priceNum3;
	        document.getElementById('price-3').value=num3-priceNum3;
	        document.getElementById('deleteimg3').style.display="block";
	        var nb = document.getElementById("nb").innerText;
	        var str = "";	    	 
	    	str+="<input type='text' value='"+nb+"' id='input3' name='tb3'>";
	    	str+="<input type='text' value='"+count3+"' id='input33' name='tb33'>";
	    	var addedDiv = document.getElementById("nb");
	    	addedDiv.innerHTML = str;
	    	document.getElementById("input3").style.width="200px";
	    	document.getElementById("input3").style.height="20px";
	    	document.getElementById("input3").style.border="none";
	    	document.getElementById("input3").style.background="white";
	    	document.getElementById("input3").disabled="disabled";
	    	document.getElementById("input33").style.width="20px";
	    	document.getElementById("input33").style.height="20px";
	    	document.getElementById("input33").style.border="none";
	    	document.getElementById("input33").style.background="white";
	    	document.getElementById("input33").disabled="disabled";
	    	document.getElementById("nb").append(hr);
	    	var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum3;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea3").value = count3;

		}
		ibtn3.onclick = function() {	    	
			count3 = 0;
	    	var id3 = document.getElementById("nb");
	    	var id3 = document.querySelector(".newdiv3");    	
	    	num3=0;
	    	document.getElementById('price-3').value=0;    	
	    		if(num3==0) {
	    			document.getElementById('deleteimg3').style.display="none";
	    			document.getElementById("menu3").removeChild(id3);
	    			count3=0;
	    		}
	    		var total1 = document.getElementById("total1").value;
				total11 = parseInt(total1);
				if(i3>0) {
				total11 = total11-(priceNum3*i3);
				i3=0;
				}
				document.getElementById('total1').value=total11;
		    	document.getElementById("ea3").value = 0;

	    } 
		pbtn3.onclick = function() {
			i3++;
			count3++;
	    	document.getElementById('minus3').style.display="block";
    		var input33 = document.getElementById('input33').value;
			input333 = parseInt(input33);
			input333++;
			document.getElementById('input33').value=input333;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum3;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea3").value = count3;

		}
	    mbtn3.onclick = function() {	 
	    	i3--;
    		var input33 = document.getElementById('input33').value;
			input333 = parseInt(input33);
			input333--;
			document.getElementById('input33').value=input333;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11-priceNum3;
			document.getElementById('total1').value=total11;
			if(i3==0) {			
			document.getElementById('minus3').style.display="none";
			count3=0;
	    	}
	    	document.getElementById("ea3").value = count3;

		}
		btn4.onclick = function() {	
			i4++;
			document.getElementById('plus4').style.display="block";
	    	document.getElementById('minus4').style.display="block";
			count4++;
	    	var div4 = document.createElement("div");
	    	div4.className = "newdiv4";
	    	div4.id = "nc";
	    	document.getElementById("menu4").appendChild(div4);
			var node4 = document.createElement("B");
			var node14 = document.createElement("A");
			var hr = document.createElement("hr");
			node4.append(name4+" : "+priceNum4+"원");			
			node14.append(" x ");
			document.getElementById("nc").append(node4);
			document.getElementById("nc").append(node14);
			document.getElementById("nc").append(hr);
			num4=num4+priceNum4;
	        document.getElementById('price-4').value=num4-priceNum4;
	        document.getElementById('deleteimg4').style.display="block";
	        var nc = document.getElementById("nc").innerText;
	        var str = "";	    	 
	    	str+="<input type='text' value='"+nc+"' id='input4' name='tb4'>";
	    	str+="<input type='text' value='"+count4+"' id='input44' name='tb44'>";
	    	var addedDiv = document.getElementById("nc");
	    	addedDiv.innerHTML = str;
	    	document.getElementById("input4").style.width="200px";
	    	document.getElementById("input4").style.height="20px";
	    	document.getElementById("input4").style.border="none";
	    	document.getElementById("input4").style.background="white";
	    	document.getElementById("input4").disabled="disabled";
	    	document.getElementById("input44").style.width="20px";
	    	document.getElementById("input44").style.height="20px";
	    	document.getElementById("input44").style.border="none";
	    	document.getElementById("input44").style.background="white";
	    	document.getElementById("input44").disabled="disabled";
	    	document.getElementById("nc").append(hr);
	    	var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum4;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea4").value = count4;

		}
		ibtn4.onclick = function() {	    	
			count4 = 0;
	    	var id4 = document.getElementById("nc");
	    	var id4 = document.querySelector(".newdiv4");    	
	    	num4=0;
	    	document.getElementById('price-4').value=0;    	
	    		if(num4==0) {
	    			document.getElementById('deleteimg4').style.display="none";
	    			document.getElementById("menu4").removeChild(id4);
	    			count4=0;
	    		}
	    		var total1 = document.getElementById("total1").value;
				total11 = parseInt(total1);
				if(i4>0) {
				total11 = total11-(priceNum4*i4);
				i4=0;
				}
				document.getElementById('total1').value=total11;
		    	document.getElementById("ea4").value = 0;

	    } 
		pbtn4.onclick = function() {
			i4++;
			count4++;
	    	document.getElementById('minus4').style.display="block";
    		var input44 = document.getElementById('input44').value;
			input444 = parseInt(input44);
			input444++;
			document.getElementById('input44').value=input444;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum4;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea4").value = count4;

		}
	    mbtn4.onclick = function() {	
	    	i4--;
    		var input44 = document.getElementById('input44').value;
			input444 = parseInt(input44);
			input444--;
			document.getElementById('input44').value=input444;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11-priceNum4;
			document.getElementById('total1').value=total11;
			if(i4==0) {			
			document.getElementById('minus4').style.display="none";
			count4=0;
	    	}
	    	document.getElementById("ea4").value = count4;

		}
		btn5.onclick = function() {	
			i5++;
			document.getElementById('plus5').style.display="block";
	    	document.getElementById('minus5').style.display="block";
			count5++;
	    	var div5 = document.createElement("div");
	    	div5.className = "newdiv5";
	    	div5.id = "ne";
	    	document.getElementById("menu5").appendChild(div5);
			var node5 = document.createElement("B");
			var node15 = document.createElement("A");
			var hr = document.createElement("hr");
			node5.append(name5+" : "+priceNum5+"원");			
			node15.append(" x ");
			document.getElementById("ne").append(node5);
			document.getElementById("ne").append(node15);
			document.getElementById("ne").append(hr);
			num5=num5+priceNum5;
	        document.getElementById('price-5').value=num5-priceNum5;
	        document.getElementById('deleteimg5').style.display="block";
	        var ne = document.getElementById("ne").innerText;
	        var str = "";	    	 
	    	str+="<input type='text' value='"+ne+"' id='input5' name='tb5'>";
	    	str+="<input type='text' value='"+count5+"' id='input55' name='tb55'>";
	    	var addedDiv = document.getElementById("ne");
	    	addedDiv.innerHTML = str;
	    	document.getElementById("input5").style.width="200px";
	    	document.getElementById("input5").style.height="20px";
	    	document.getElementById("input5").style.border="none";
	    	document.getElementById("input5").style.background="white";
	    	document.getElementById("input5").disabled="disabled";
	    	document.getElementById("input55").style.width="20px";
	    	document.getElementById("input55").style.height="20px";
	    	document.getElementById("input55").style.border="none";
	    	document.getElementById("input55").style.background="white";
	    	document.getElementById("input55").disabled="disabled";
	    	document.getElementById("ne").append(hr);
	    	var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum5;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea5").value = count5;

		}
		ibtn5.onclick = function() {	    	
			count5 = 0;
	    	var id5 = document.getElementById("ne");
	    	var id5 = document.querySelector(".newdiv5");    	
	    	num5=0;
	    	document.getElementById('price-5').value=0;    	
	    		if(num5==0) {
	    			document.getElementById('deleteimg5').style.display="none";
	    			document.getElementById("menu5").removeChild(id5);
	    			count5=0;
	    		}
	    		var total1 = document.getElementById("total1").value;
				total11 = parseInt(total1);
				if(i5>0) {
				total11 = total11-(priceNum5*i5);
				i5=0;
				}
				document.getElementById('total1').value=total11;
		    	document.getElementById("ea5").value = 0;

	    } 
		pbtn5.onclick = function() {
			i5++;
			count5++;
	    	document.getElementById('minus5').style.display="block";
    		var input55 = document.getElementById('input55').value;
			input555 = parseInt(input55);
			input555++;
			document.getElementById('input55').value=input555;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum5;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea5").value = count5;

		}
	    mbtn5.onclick = function() {	
	    	i5--;
    		var input55 = document.getElementById('input55').value;
			input555 = parseInt(input55);
			input555--;
			document.getElementById('input55').value=input555;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11-priceNum5;
			document.getElementById('total1').value=total11;
			if(i5==0) {			
			document.getElementById('minus5').style.display="none";
			count5=0;
	    	}
	    	document.getElementById("ea5").value = count5;

		}
		btn6.onclick = function() {	
			i6++;
			document.getElementById('plus6').style.display="block";
	    	document.getElementById('minus6').style.display="block";
			count6++;
	    	var div6 = document.createElement("div");
	    	div6.className = "newdiv6";
	    	div6.id = "nf";
	    	document.getElementById("menu6").appendChild(div6);
			var node6 = document.createElement("B");
			var node16 = document.createElement("A");
			var hr = document.createElement("hr");
			node6.append(name6+" : "+priceNum6+"원");			
			node16.append(" x ");
			document.getElementById("nf").append(node6);
			document.getElementById("nf").append(node16);
			document.getElementById("nf").append(hr);
			num6=num6+priceNum6;
	        document.getElementById('price-6').value=num6-priceNum6;
	        document.getElementById('deleteimg6').style.display="block";
	        var nf = document.getElementById("nf").innerText;
	        var str = "";	    	 
	    	str+="<input type='text' value='"+nf+"' id='input6' name='tb6'>";
	    	str+="<input type='text' value='"+count6+"' id='input66' name='tb66'>";
	    	var addedDiv = document.getElementById("nf");
	    	addedDiv.innerHTML = str;
	    	document.getElementById("input6").style.width="200px";
	    	document.getElementById("input6").style.height="20px";
	    	document.getElementById("input6").style.border="none";
	    	document.getElementById("input6").style.background="white";
	    	document.getElementById("input6").disabled="disabled";
	    	document.getElementById("input66").style.width="20px";
	    	document.getElementById("input66").style.height="20px";
	    	document.getElementById("input66").style.border="none";
	    	document.getElementById("input66").style.background="white";
	    	document.getElementById("input66").disabled="disabled";
	    	document.getElementById("nf").append(hr);
	    	var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum6;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea6").value = count6;

		}
		ibtn6.onclick = function() {	    	
			count6 = 0;
	    	var id6 = document.getElementById("nf");
	    	var id6 = document.querySelector(".newdiv6");    	
	    	num6=0;
	    	document.getElementById('price-6').value=0;    	
	    		if(num6==0) {
	    			document.getElementById('deleteimg6').style.display="none";
	    			document.getElementById("menu6").removeChild(id6);
	    			count6=0;
	    		}
	    		var total1 = document.getElementById("total1").value;
				total11 = parseInt(total1);
				if(i6>0) {
				total11 = total11-(priceNum6*i6);
				i6=0;
				}
				document.getElementById('total1').value=total11;
		    	document.getElementById("ea6").value = 0;

	    } 
		pbtn6.onclick = function() {
			i6++;
			count6++;
	    	document.getElementById('minus6').style.display="block";
    		var input66 = document.getElementById('input66').value;
			input666 = parseInt(input66);
			input666++;
			document.getElementById('input66').value=input666;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum6;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea6").value = count6;

		}
	    mbtn6.onclick = function() {	
	    	i6--;
    		var input66 = document.getElementById('input66').value;
			input666 = parseInt(input66);
			input666--;
			document.getElementById('input66').value=input666;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11-priceNum6;
			document.getElementById('total1').value=total11;
			if(i6==0) {			
			document.getElementById('minus6').style.display="none";
			count6=0;
	    	}
	    	document.getElementById("ea6").value = count6;

		}
		btn7.onclick = function() {	
			i7++;
			document.getElementById('plus7').style.display="block";
	    	document.getElementById('minus7').style.display="block";
			count7++;
	    	var div7 = document.createElement("div");
	    	div7.className = "newdiv7";
	    	div7.id = "ng";
	    	document.getElementById("menu7").appendChild(div7);
			var node7 = document.createElement("B");
			var node17 = document.createElement("A");
			var hr = document.createElement("hr");
			node7.append(name7+" : "+priceNum7+"원");			
			node17.append(" x ");
			document.getElementById("ng").append(node7);
			document.getElementById("ng").append(node17);
			document.getElementById("ng").append(hr);
			num7=num7+priceNum7;
	        document.getElementById('price-7').value=num7-priceNum7;
	        document.getElementById('deleteimg7').style.display="block";
	        var ng = document.getElementById("ng").innerText;
	        var str = "";	    	 
	    	str+="<input type='text' value='"+ng+"' id='input7' name='tb7'>";
	    	str+="<input type='text' value='"+count7+"' id='input77' name='tb77'>";
	    	var addedDiv = document.getElementById("ng");
	    	addedDiv.innerHTML = str;
	    	document.getElementById("input7").style.width="200px";
	    	document.getElementById("input7").style.height="20px";
	    	document.getElementById("input7").style.border="none";
	    	document.getElementById("input7").style.background="white";
	    	document.getElementById("input7").disabled="disabled";
	    	document.getElementById("input77").style.width="20px";
	    	document.getElementById("input77").style.height="20px";
	    	document.getElementById("input77").style.border="none";
	    	document.getElementById("input77").style.background="white";
	    	document.getElementById("input77").disabled="disabled";
	    	document.getElementById("ng").append(hr);
	    	var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum7;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea7").value = count7;

		}
		ibtn7.onclick = function() {
			count7 = 0;
	    	var id7 = document.getElementById("ng");
	    	var id7 = document.querySelector(".newdiv7");    	
	    	num7=0;
	    	document.getElementById('price-7').value=0;    	
	    		if(num7==0) {
	    			document.getElementById('deleteimg7').style.display="none";
	    			document.getElementById("menu7").removeChild(id7);
	    			count7=0;
	    		}
	    		var total1 = document.getElementById("total1").value;
				total11 = parseInt(total1);
				if(i7>0) {
				total11 = total11-(priceNum7*i7);
				i7=0;
				}
				document.getElementById('total1').value=total11;
		    	document.getElementById("ea7").value = 0;

	    }
		pbtn7.onclick = function() {
			i7++;
			count7++;
	    	document.getElementById('minus7').style.display="block";
    		var input77 = document.getElementById('input77').value;
			input777 = parseInt(input77);
			input777++;
			document.getElementById('input77').value=input777;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum7;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea7").value = count7;

		}
	    mbtn7.onclick = function() {	
	    	i7--;
    		var input77 = document.getElementById('input77').value;
			input777 = parseInt(input77);
			input777--;
			document.getElementById('input77').value=input777;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11-priceNum7;
			document.getElementById('total1').value=total11;
			if(i7==0) {			
			document.getElementById('minus7').style.display="none";
			count7=0;
	    	}
	    	document.getElementById("ea7").value = count7;

		}
		btn8.onclick = function() {	
			i8++;
			document.getElementById('plus8').style.display="block";
	    	document.getElementById('minus8').style.display="block";
			count8++;
	    	var div8 = document.createElement("div");
	    	div8.className = "newdiv8";
	    	div8.id = "nh";
	    	document.getElementById("menu8").appendChild(div8);
			var node8 = document.createElement("B");
			var node18 = document.createElement("A");
			var hr = document.createElement("hr");
			node8.append(name8+" : "+priceNum8+"원");			
			node18.append(" x ");
			document.getElementById("nh").append(node8);
			document.getElementById("nh").append(node18);
			document.getElementById("nh").append(hr);
			num8=num8+priceNum8;
	        document.getElementById('price-8').value=num8-priceNum8;
	        document.getElementById('deleteimg8').style.display="block";
	        var nh = document.getElementById("nh").innerText;
	        var str = "";	    	 
	    	str+="<input type='text' value='"+nh+"' id='input8' name='tb8'>";
	    	str+="<input type='text' value='"+count8+"' id='input88' name='tb88'>";
	    	var addedDiv = document.getElementById("nh");
	    	addedDiv.innerHTML = str;
	    	document.getElementById("input8").style.width="200px";
	    	document.getElementById("input8").style.height="20px";
	    	document.getElementById("input8").style.border="none";
	    	document.getElementById("input8").style.background="white";
	    	document.getElementById("input8").disabled="disabled";
	    	document.getElementById("input88").style.width="20px";
	    	document.getElementById("input88").style.height="20px";
	    	document.getElementById("input88").style.border="none";
	    	document.getElementById("input88").style.background="white";
	    	document.getElementById("input88").disabled="disabled";
	    	document.getElementById("nh").append(hr);
	    	var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum8;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea8").value = count8;

		}
		ibtn8.onclick = function() {	    	
			count8 = 0;
	    	var id8 = document.getElementById("nh");
	    	var id8 = document.querySelector(".newdiv8");    	
	    	num8=0;
	    	document.getElementById('price-8').value=0;    	
	    		if(num8==0) {
	    			document.getElementById('deleteimg8').style.display="none";
	    			document.getElementById("menu8").removeChild(id8);
	    			count8=0;
	    		}
	    		var total1 = document.getElementById("total1").value;
				total11 = parseInt(total1);
				if(i8>0) {
				total11 = total11-(priceNum8*i8);
				i8=0;
				}
				document.getElementById('total1').value=total11;
		    	document.getElementById("ea8").value = 0;
	    }
		pbtn8.onclick = function() {
			i8++;
			count8++;
	    	document.getElementById('minus8').style.display="block";
    		var input88 = document.getElementById('input88').value;
			input888 = parseInt(input88);
			input888++;
			document.getElementById('input88').value=input888;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum8;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea8").value = count8;

		}
	    mbtn8.onclick = function() {	
	    	i8--;
    		var input88 = document.getElementById('input88').value;
			input888 = parseInt(input88);
			input888--;
			document.getElementById('input88').value=input888;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11-priceNum8;
			document.getElementById('total1').value=total11;
			if(i8==0) {			
			document.getElementById('minus8').style.display="none";
			count8=0;
	    	}
	    	document.getElementById("ea8").value = count8;

		}
		btn9.onclick = function() {	
			i9++;
			document.getElementById('plus9').style.display="block";
	    	document.getElementById('minus9').style.display="block";
			count9++;
	    	var div9 = document.createElement("div");
	    	div9.className = "newdiv9";
	    	div9.id = "ni";
	    	document.getElementById("menu9").appendChild(div9);
			var node9 = document.createElement("B");
			var node19 = document.createElement("A");
			var hr = document.createElement("hr");
			node9.append(name9+" : "+priceNum9+"원");			
			node19.append(" x ");
			document.getElementById("ni").append(node9);
			document.getElementById("ni").append(node19);
			document.getElementById("ni").append(hr);
			num9=num9+priceNum9;
	        document.getElementById('price-9').value=num9-priceNum9;
	        document.getElementById('deleteimg9').style.display="block";
	        var ni = document.getElementById("ni").innerText;
	        var str = "";	    	 
	    	str+="<input type='text' value='"+ni+"' id='input9' name='tb9'>";
	    	str+="<input type='text' value='"+count9+"' id='input99' name='tb99'>";
	    	var addedDiv = document.getElementById("ni");
	    	addedDiv.innerHTML = str;
	    	document.getElementById("input9").style.width="200px";
	    	document.getElementById("input9").style.height="20px";
	    	document.getElementById("input9").style.border="none";
	    	document.getElementById("input9").style.background="white";
	    	document.getElementById("input9").disabled="disabled";
	    	document.getElementById("input99").style.width="20px";
	    	document.getElementById("input99").style.height="20px";
	    	document.getElementById("input99").style.border="none";
	    	document.getElementById("input99").style.background="white";
	    	document.getElementById("input99").disabled="disabled";
	    	document.getElementById("ni").append(hr);
	    	var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum9;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea9").value = count9;

		}
		ibtn9.onclick = function() {	    	
			count9 = 0;
	    	var id9 = document.getElementById("ni");
	    	var id9 = document.querySelector(".newdiv9");    	
	    	num9=0;
	    	document.getElementById('price-9').value=0;    	
	    		if(num9==0) {
	    			document.getElementById('deleteimg9').style.display="none";
	    			document.getElementById("menu9").removeChild(id9);
	    			count9=0;
	    		}
	    		var total1 = document.getElementById("total1").value;
				total11 = parseInt(total1);
				if(i9>0) {
				total11 = total11-(priceNum9*i9);
				i9=0;
				}
				document.getElementById('total1').value=total11;
		    	document.getElementById("ea9").value = 0;

	    }
		pbtn9.onclick = function() {
			i9++;
			count9++;
	    	document.getElementById('minus9').style.display="block";
    		var input99 = document.getElementById('input99').value;
			input999 = parseInt(input99);
			input999++;
			document.getElementById('input99').value=input999;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum9;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea9").value = count9;

		}
	    mbtn9.onclick = function() {	
	    	i9--;
    		var input99 = document.getElementById('input99').value;
			input999 = parseInt(input99);
			input999--;
			document.getElementById('input99').value=input999;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11-priceNum9;
			document.getElementById('total1').value=total11;
			if(i9==0) {			
			document.getElementById('minus9').style.display="none";
			count9=0;
	    	}
	    	document.getElementById("ea9").value = count9;

		}
		btn10.onclick = function() {
			i10++;
			document.getElementById('plus10').style.display="block";
	    	document.getElementById('minus10').style.display="block";
			count10++;
	    	var div10 = document.createElement("div");
	    	div10.className = "newdiv10";
	    	div10.id = "nj";
	    	document.getElementById("menu10").appendChild(div10);
			var node10 = document.createElement("B");
			var node20 = document.createElement("A");
			var hr = document.createElement("hr");
			node10.append(name10+" : "+priceNum10+"원");			
			node20.append(" x "+count10);
			document.getElementById("nj").append(node10);
			document.getElementById("nj").append(node20);
			document.getElementById("nj").append(hr);
			num10=num10+priceNum10;
	        document.getElementById('price-10').value=num10-priceNum10;
	        document.getElementById('deleteimg10').style.display="block";
	        var nj = document.getElementById("nj").innerText;
	        var str = "";	    	 
	    	str+="<input type='text' value='"+nj+"' id='input10' name='tb10'>";
	    	str+="<input type='text' value='"+count10+"' id='input100' name='tb100'>";
	    	var addedDiv = document.getElementById("nj");
	    	addedDiv.innerHTML = str;
	    	document.getElementById("input10").style.width="200px";
	    	document.getElementById("input10").style.height="20px";
	    	document.getElementById("input10").style.border="none";
	    	document.getElementById("input10").style.background="white";
	    	document.getElementById("input10").disabled="disabled";
	    	document.getElementById("input100").style.width="20px";
	    	document.getElementById("input100").style.height="20px";
	    	document.getElementById("input100").style.border="none";
	    	document.getElementById("input100").style.background="white";
	    	document.getElementById("input100").disabled="disabled";
	    	document.getElementById("nj").append(hr);
	    	var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum10;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea10").value = count10;

		}
		ibtn10.onclick = function() {	    	
			count10 = 0;
	    	var id10 = document.getElementById("nj");
	    	var id10 = document.querySelector(".newdiv10");    	
	    	num10=0;
	    	document.getElementById('price-10').value=0;    	
	    		if(num10==0) {
	    			document.getElementById('deleteimg10').style.display="none";
	    			document.getElementById("menu10").removeChild(id10);
	    			count10=0;
	    		}
	    		var total1 = document.getElementById("total1").value;
				total11 = parseInt(total1);
				if(i10>0) {
				total11 = total11-(priceNum10*i10);
				i10=0;
				}
				document.getElementById('total1').value=total11;
		    	document.getElementById("ea10").value = 0;

	    }	
		pbtn10.onclick = function() {
			i10++;
			count10++;
	    	document.getElementById('minus10').style.display="block";
    		var input100 = document.getElementById('input100').value;
			input1000 = parseInt(input100);
			input1000++;
			document.getElementById('input100').value=input1000;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11+priceNum10;
			document.getElementById('total1').value=total11;
	    	document.getElementById("ea10").value = count10;

		}
	    mbtn10.onclick = function() {
	    	i10--;
    		var input100 = document.getElementById('input100').value;
			input1000 = parseInt(input100);
			input1000--;
			document.getElementById('input100').value=input1000;
			var total1 = document.getElementById("total1").value;
			total11 = parseInt(total1);
			total11 = total11-priceNum10;
			document.getElementById('total1').value=total11;
			if(i10==0) {			
			document.getElementById('minus10').style.display="none";
			count10=0;
	    	}
	    	document.getElementById("ea10").value = count10;

		}
	</script>
	
</body>
</html>