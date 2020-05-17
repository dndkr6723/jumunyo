<%@page import="com.finalp.jumunyo.vo.CartVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.finalp.jumunyo.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.orderpay {
	width: 50%;
	margin: 30px 25%;
	height: auto;
}
.reservatInfo {
	width: 100%;
}
.reservatInfos {
	width: 100%;
	border-top: 10px solid red;
	font-size: 25px;
}
.footer {
	border-top: 2px solid black;
	margin: 20px;
}
.orderlist {
	margin: 20px 0;
	width: 100%;
}
.orderlists {
	width: 100%;
	border-top: 10px solid red;
}
.menuName {
	color: #FF0000;
	margin: 5px 25px;
}
.menuPrice {
	margin: 5px 25px;
}
.menuCount {
	margin: 5px 25px;
}
.mileage {
	margin: 20px 0;
	width: 100%;
}
.mileages {
	width: 100%;
	border-top: 10px solid red;
}
.pointInput {
	margin: 30px 25px;
}
.pointInput > a {
	color: #FF0000;
	font-size: 12px;
}
.pointInput > p {
	color: #BDBDBD;
	font-size: 12px;
}
.pay {
	margin: 0;
	padding: 0 0 0 720px;
}
.submit {
	width: 220px;
	height: 50px;
}
.submit >input {
	width: 100%;
	height: 100%;
	border-radius: 10px;
	border: none;
	background: red;
	color: blue;
	font-size: 19px;
}
</style>
</head>
<body>
		<%
			UserVO user1 = (UserVO)session.getAttribute("userSession");
			HashMap<String, Object> seat_order1 = new HashMap<String, Object>();
			seat_order1 = (HashMap<String, Object>)request.getAttribute("seat_order1");
			ArrayList<CartVO> cart_list1 = (ArrayList<CartVO>)session.getAttribute("cart_list");
			int total_price=0;

			String display1= "";
			String display2= "";
			int room_check = 1;
			
			if(seat_order1 != null) {
				display1 = "block";
				display2 = "none";
			} else if(cart_list1 != null) {
				display1 = "none";
				display2 = "block";
			} else {
				display1 = "block";
				display2 = "block";
			}
		%>
		<jsp:include page="../include/header.jsp" />
		<form action="payment.do" name="removefrm">
		<div class="orderpay">
		<div class="reservatInfo" style="display: <%=display1%>;">
		<h1>좌석예약 정보</h1>
		<div class="reservatInfos">
		<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b>주문자</b> <input type="text" name="reservater" value="<%=user1.getUser_name() %>" disabled="disabled" 
			style="background: white; border: 1px fuchsia #EAEAEA; font-size: 20px;"/>
			<br />
			<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
			<b>연락처</b> <input type="text" name="tel" value="<%=user1.getUser_tell()%>" disabled="disabled" 
			style="background: white; border: 1px fuchsia #EAEAEA; font-size: 20px;"/>
			<br />
			<br />
		<% String time = (String)seat_order1.get("time");
		if (time == null || time.contains("null")) { 
			seat_order1.put("time", "해당사항 없음");
		} %>	
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b>예약날짜</b> <input type="text" name="time" value="<%=seat_order1.get("time") %>" disabled="disabled" 
			style="background: white; border: 1px fuchsia #EAEAEA; font-size: 20px;"/>
			<br />
			<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b>요청사항</b> <input type="text" name="requests" placeholder="본점도착후 요리시작"
			style="background: white; border: 1px fuchsia #EAEAEA; font-size: 20px;" />
			<br />
			<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b style="color: red;">좌석예약 추가	</b>
			<input type="hidden" name="room_check" value="" />		
		</div>
		</div>
		<div class="reservatInfo" style="display: <%=display2%>;">
		<h1>배달주문 정보</h1>
		<div class="reservatInfos">
		<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b><%=user1.getUser_address() %></b> <input type="text" name="reservater" placeholder="(**도)**시 **동 ****번지"
			style="background: white; border: 1px fuchsia #EAEAEA; font-size: 20px; width: 300px;"/>
			<br />
			<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
			<b><%=user1.getUser_tell() %></b> <input type="text" name="tel" value="010-0000-0000" disabled="disabled" 
			style="background: white; border: 1px fuchsia #EAEAEA; font-size: 20px;"/>
			<br />
			<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b>요청사항</b> <input type="text" name="requests" placeholder="문앞배달"
			style="background: white; border: 1px fuchsia #EAEAEA; font-size: 20px;" />			
		</div>
		</div>
		<div class="orderlist">
			<h1>주문표</h1>
			<div class="orderlists">
				<% for (int i=0; i<cart_list1.size(); i++) { %>				
				<div class="menuName"><b><%=cart_list1.get(i).getCartmenu_name() %></b></div>
				<div class="menuPrice"><%=cart_list1.get(i).getCartmenu_price() %> 원</div>
				<div class="menuCount"><%=cart_list1.get(i).getCartmenu_count() %> EA</div>
				<% total_price += cart_list1.get(i).getCartmenu_price() * cart_list1.get(i).getCartmenu_count(); %>
				<hr />
				<%} %>
			</div>
		</div>
		<div class="mileage">
			<h1>마일리지</h1>
			<div class="mileages">
				<div class="pointInput">
				<b>마일리지 사용 금액</b>
				<input type="text" name="point" id="point" onkeyup="keyup(this.value)" 
				style="width: 30px; text-align: right; font-size: 19px;"/> ,00 
				<a>보유마일리지: 
				<input type="text" id="myMileage" value="<%=user1.getUser_point() %>" 
				style="border: none; background: white; width: 50px; text-align: center;" />
				  point </a>
				  <input type="hidden" id="myMileagehidden" value="<%=user1.getUser_point() %>" />
				<br />				
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;
					마일리지 사용 단위 : 100원</p>
				</div>
			</div>
		</div>
		<div class="pay">
			<div class="orderAmount">
			<b style="font-size: 20px;">주문 금액</b> &nbsp;&nbsp;&nbsp;
			<b id="orderAmount" style="font-size: 20px;" ><%=total_price %></b>
			<b style="font-size: 20px;">원</b>
			</div>
			<div class="saleAmount">
			<b style="font-size: 20px;">할인 금액</b> 
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" id="sale" value="0" disabled="disabled" 
			style="border: none; background: white; color: red; font-size: 20px;width: 70px;" />
			<b style="font-size: 20px;">원</b>
			</div>
			<div class="finaltotal">
			<b style="color: red; font-size: 25px;">최종 금액 </b>
			<input type="text" id="finaltotal" value="<%=total_price %>" 
			style="border: none; background: white; color: red; font-size: 20px;width: 70px;" />
			<b style="color: red; font-size: 25px;">원</b>
			</div>
			<div class="submit">
				<input type="button" value="결제하기" id="submit1" onmouseover="payment('submit1');" onmouseout="reset1('submit1');" onclick="removeCheck()"/>
			</div>
		</div>

		</div>
		</form>
		<div class="footer">
		<jsp:include page="../include/footer.jsp"/>
		</div>
		
<!--카카오페이 api  -->		
<form action="kakaopay.do" method="post"></form>
	<input type="button" value="카카오페이 결제하기" />		
<script>

function removeCheck() {
 	if (confirm("결제하시겠습니까??") == true){    //확인
     document.removefrm.submit();
 	}else{   //취소
     return false;
 	}
}
	
	function keyup(id) {
		var submit1 = document.getElementById('submit1');
		var myMileage = document.getElementById('myMileage').value;
		var myMileagehidden = document.getElementById('myMileagehidden').value;
		var myMileageNum = parseInt(myMileage);
		var myMileagehiddenNum = parseInt(myMileagehidden);
		
		var orderAmount = document.getElementById('orderAmount').innerText;
		var orderAmountNum = parseInt(orderAmount);
		var inputNum = parseInt(id);
		if(id == ""){
		document.getElementById('sale').value=0;
		document.getElementById('finaltotal').value= orderAmountNum
		} else {
			submit1.disabled = false;
			if(inputNum*100 > myMileagehiddenNum) {				
				document.getElementById('sale').value=0;
				document.getElementById('finaltotal').value= 0;
				document.getElementById('submit1').style.background ="gray";
				document.getElementById('submit1').style.color ="white";
				document.getElementById('myMileage').value= myMileagehiddenNum-inputNum*100;
				submit1.disabled = true;
			} else {
				document.getElementById('sale').value=inputNum*100;
				document.getElementById('finaltotal').value= orderAmountNum-inputNum;
				document.getElementById('submit1').style.background ="red";
				document.getElementById('submit1').style.color ="blue";
				document.getElementById('myMileage').value= myMileagehiddenNum-inputNum*100;
				submit1.disabled = false;
			}
			
		}
	}
	function payment(id) {
		document.getElementById(id).style.background ="blue";
		document.getElementById(id).style.color="red";
		document.getElementById(id).style.fontSize="20px";
	}
	function reset1(id) {
		document.getElementById(id).style.background ="red";
		document.getElementById(id).style.color="blue";
		document.getElementById(id).style.fontSize="19px";	
	}
	
</script>



		

</body>
</html>