<%-- <%@page import="com.finalp.jumunyo.vo.RoomVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 좌석 예약 페이지 입니다. -->


<%
	ArrayList<RoomVO> room_list1 = (ArrayList<RoomVO>)request.getAttribute("getStoreRooms");
%>

<div id="header"></div>


<div id="seat_order">
	<h2>좌석예약하기</h2>
	<hr>
	
	<form action="seat_order.do" method="post">
		<div id="seat_list">
			<table border=1>
				<tr>
					<td>테이블 번호</td>
					<td>좌석 수</td>
					<td>예약</td>
				</tr>
								
				<% for (int i=0; i<room_list1.size(); i++) { %>
					<tr>
						<td><%=room_list1.get(i).getRoom_id() %></td>
						<td><%=room_list1.get(i).getRoom_number() %></td>
						<td><% if (room_list1.get(i).getRoom_check()== 1) { %>
					 	예약중
					 	<% } else if (room_list1.get(i).getRoom_check() == 0) { %>
							<input type="radio" name="seat" value="<%=i %>">
						<% } else { %>
						내부오류 
						<% } %> </td>
					</tr>
				<% } %> <!-- for-end -->
				
			</table>
			
		</div>
		<hr>
	
		<div id="reservation">
			<div id="reservation_date">
				예약날짜 <input type="date" name="booking_date" />
			</div>
	
			<div id="reservation_time">
				예약시간 
				<select name="booking_time">
					<option value="">시간 선택</option>
					<option value="10:00">10:00</option>
					<option value="11:00">11:00</option>
					<option value="12:00">12:00</option>
					<option value="13:00">13:00</option>
					<option value="14:00">14:00</option>
				</select>
			</div>
		
			<input type="submit" value="예약하기" />
		</div>	
	</form>
	
</div>


<div id="footer"></div>

</body>
</html> --%>

<%@page import="com.finalp.jumunyo.vo.RoomVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.reservation-title {
	width: 50%;
	height: 100px;
	border-left: 2px solid #BDBDBD;
	border-right: 2px solid #BDBDBD;
	border-top: 2px solid #BDBDBD;
	border-bottom: 10px solid red;
	margin: 10px 25% 0 25%;
}
.reservations {
	overflow-x: auto;
	overflow-y: auto;
	width: 50%;
	height: 500px;
	border-left: 2px solid #BDBDBD;
	border-right: 2px solid #BDBDBD;
	border-bottom: 10px solid red;
	margin: 0 25%;
}
.seat {
	float: left;
	width: 20%;
	height: 180px;
	margin: 5px 2% 5px 2.5%;
	border: 1px solid #BDBDBD;
}
.seatCount {
	margin: 0 0 0 18%;
	color: blue;
}
.seatCount>a {
	float: left;
}
.seatCount>b {
	float: left;
	margin: 0;
}
.seatImg {
	
}
.seatImg> img {
	width:90%;
	height: 90%;
	margin: 0 8px 0 8px; 
}
.seatImg> a {
	margin: 0 10px 0 30px;
	font-size: 15px;
}
.seatImg> b {
	margin: 0;
	font-size: 35px;
	color: red;
}
.reservate {
	width: 50%;
	height: 200px;
	border-left: 2px solid #BDBDBD;
	border-right: 2px solid #BDBDBD;
	border-bottom: 2px solid #BDBDBD;
	margin: 0 25%;
}
.reservate-date {
	float: left;
	width: 50%;
	height: 100%;
	margin: 20px 0;
}
.reservate-time {
	float: left;
	width: 50%;
	height: 100%;
	margin: 20px 0;
}
.submit {
	position: absolute;
	top: 800px;
	left: 780px;
	width: 280px;
	height: 70px;
	background: red;
	border: double 1 white;
	border-radius: 10px;
}
.footer {
	border-top: 2px solid black;
	margin: 20px;
}
</style>
</head>
<body>
	<%
	ArrayList<RoomVO> room_list1 = (ArrayList<RoomVO>)request.getAttribute("getStoreRooms");
	
	int num = 1;/* 자리수 */ int count = 0;/* 고유번호 */ char seat1 = 64;
	int[] num1={4,4,8,8,2,2,8,4,2,6,6}; int[] result={1,2,2,1,2,1,2,1,1,1,1};
	String str1=""; String str2=""; double opacity = 0;
	%>
	
<jsp:include page="../include/header.jsp" />

	<div class="reservation-title">
	<br /><br />
		<h1 align="center">좌석예약</h1>
	</div>
	
	<form action="seat_order.do" method="post">
		<div class="reservations">
			<%for(int i=0; i<room_list1.size(); i++) { %>
			<%seat1++; %>
			<div class="seat">
				<div class="seatCount"> 
					<%if(room_list1.get(i).getRoom_check()==0){
						str1 = "";
						opacity = 1.0;
						str2 = "none";
					} else {
						str1 = "disabled";
						opacity = 0.5;
						str2 ="block";
					} %>
					<b>좌석 <%=seat1 %>
					<input type="radio" name="seat" id="radio" <%=str1%> value="<%=i %>" /></b>
					<a style="display: <%=str2 %>;color: red;">(예약중)</a>		
				</div>
						
				<div class="seatImg">		
					<img src="image/table.jpg" style="opacity: <%=opacity %>;" />
					<a>좌석수:</a>
					<b><%=room_list1.get(i).getRoom_number() %></b>
					인석
				</div>	
			</div>	
			<% } %> <%-- for-end --%>
		</div>
		
		<div class="reservate">
			<div class="reservate-date">
				&nbsp;&nbsp;&nbsp;&nbsp;예약날짜:
				<img src="image/calendar.png" width="20px" height="20px" />
				<input type="date" name="booking_date" />
			</div>
			
			<div class="reservate-time">
				예약시간:
				<select name="booking_time" id="time">
					<option value="10:00">10:00</option>
					<option value="11:00">11:00</option>
					<option value="12:00">12:00</option>
					<option value="13:00">13:00</option>
					<option value="14:00">14:00</option>
					<option value="15:00">15:00</option>
					<option value="16:00">16:00</option>
					<option value="17:00">17:00</option>
					<option value="18:00">18:00</option>
					<option value="19:00">19:00</option>
					<option value="20:00">20:00</option>
					<option value="21:00">21:00</option>
					<option value="22:00">22:00</option>
					<option value="23:00">23:00</option>
				</select>
				시
			</div>
			
			<input type="submit" value="예약하기" class="submit"/>
		</div>
	</form>
	
<div class="footer">
	<jsp:include page="../include/footer.jsp"/>
</div>
	
</body>
</html>