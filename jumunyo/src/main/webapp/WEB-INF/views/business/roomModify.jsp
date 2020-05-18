<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	margin: 0;
	padding: 0;
	background: #EAEAEA;
}
.footer {
	border-top: 2px solid black;
	margin: 20px;
}
.orderhistory {
	width: 50%;
	margin: 30px 25%;
	height: auto;
}
.orderhistorys {
	width: 100%;
	border-top: 10px solid red;
	font-size: 25px;
}
.tablehead {
	margin: 50px 20px 0 0;
	width: 920px;
	height: 50px;
	background: #FCFCFC;
}
.orderId {
	
	margin: 0;
	padding: 0;
	width: 200px;
	height: 100%;
	border-right: 1px dashed #878787;
	font-size: 20px;	
	text-align: center;
}
.orderId > b {
	line-height:50px;
}
.title {
	
	margin: 0;
	padding: 0;
	width: 160px;
	height: 100%;
	border-right: 1px dashed #878787;
	font-size: 20px;	
	text-align: center;
}
.title > b {
	line-height:50px;
}
.title > a {
	line-height:50px;
}
.trans-kinds {
	
	margin: 0;
	padding: 0;
	width: 330px;
	height: 100%;
	border-right: 1px dashed #878787;
	font-size: 20px;	
	text-align: center;
}
.trans-kinds > b {
	line-height:50px;
}
.trans-kinds > a {
	line-height:50px;
}
.created {
	
	margin: 0;
	padding: 0;
	width: 226px;
	height: 100%;
	font-size: 20px;	
	text-align: center;
}
.created {
	line-height:50px;
}
.created {
	line-height:50px;
}
.tabletr {
	margin: 0;
	width: 920px;
	height: 50px;
	background: white;
}
.tabletd > div {
	font-size: 13px;	
}
.modals {
	background: #F15F5F;
	width: auto;
	height: 700px;
	border-radius: 15px;
}
.textarea {
	margin: 20px 0 20px 60px;
	width: 300px;
	height: 50px;
	border: 1px solid black;
	border-radius: 10px; 
	text-align: center;
	line-height: 50px;
	background: #ED4C00;	
}
.texttitle {
	margin: 20px 0 20px 60px;
	width: 300px;
	height: 50px;
	border: 1px solid black;
	border-radius: 10px; 
	text-align: center;
	line-height: 50px;
	background: #ED4C00;
}
.select {
	margin: 20px 0 20px 60px;
	width: 300px;
	height: 50px;
	border: 1px solid black;
	border-radius: 10px; 
	text-align: center;
	line-height: 50px;
	background: #ED4C00;	
}
.sub {
	margin: 0 0 10px 610px;
	width: 320px;
}
.button1 {
	float:left;
	width: 150px;
	height: auto;
	text-align: center;
	padding: 5px;
}
.button2 {
	float:left;
	width: 150px;
	height: auto;
	text-align: center;
	padding: 5px;
}
.quest-submit {
	margin: 0 0 20px 60px;
	width: 100%;
}
.filebox {
	margin: 0 60px;
}
.menuBar {
	position: fixed;
	top: 204px;
	left: 14%;	
}
.dateTitle {
	margin: 0 0 20px 60px;
	width: 100%;
}
.date {
	margin: 20px 0 20px 60px;
	width: 300px;
	height: 50px;
	border: 1px solid black;
	border-radius: 10px; 
	text-align: center;
	line-height: 50px;
	background: #ED4C00;
}
.q-title {
	margin: 0 0 20px 60px;
	width: 100%;
}
.q-content {
	margin: 20px 0 20px 60px;
	width: 300px;
	height: auto;
	border: 1px solid black;
	border-radius: 10px; 
	text-align: center;
	line-height: 50px;
	background: #ED4C00;
}
.td1 {
	width: 98%; height: 90%; background: white; border: none; text-align: center; font-weight: bolder; color: black;
}
.td2 {
	width: 98%; height: 90%; background: white; border: none; text-align: center; font-weight: bolder; color: black;
}
.td3 {
	width: 98%; height: 90%; background: white; border: none; text-align: center; font-weight: bolder; color: black;
}
.td4 {
	float: left; width: 45%; height: 42px; margin: 4px; background: #00D8FF; border-radius: 5px;
}	
.td5 {
	float: left; width: 45%; height: 42px; margin: 4px; background: #FFE08C; border-radius: 5px;
}
.paging {
	width: 150px;
	margin: 0 90%;
	font-size: 20px;
}
</style>
<link rel="stylesheet" type="text/css" href="resources/CSS/roomModify.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<script>
 	function add_tr(){ // 신규등록 눌렀을 때 새로 메뉴 한줄 생기는 메소드
		var lastid = document.getElementById("room_table").lastElementChild.lastElementChild.firstElementChild.firstElementChild.id;
		console.log(lastid);
		
		var lastidstr = lastid.split('_');
		var lastidnum = parseInt(lastidstr[1]);
		
		var nRow = document.getElementById("room_table").insertRow();
		var ncell1 = nRow.insertCell();
		var ncell2 = nRow.insertCell();
		var ncell3 = nRow.insertCell();
		var ncell4 = nRow.insertCell();
		
		ncell1.innerHTML = "<input type='text' value='"+(lastidnum+1)+"번 테이블' class='td1' >";
		ncell2.innerHTML = "<input type='text' value='' name='room_number' id='new_room_number' class='td2' >";
		ncell3.innerHTML = "<input type='text' value='예약없음' disabled='disabled' class='td3' >";
		ncell4.innerHTML = "<input type='button' value='등록' onclick='add_room()' class='td4' >"
						   + "<input type='button' value='취소' onclick='cancel()' class='td5'>";				
		
	}
 	
 	function r_modify(num){ // 수정버튼 눌렀을 시 
 		
 		var $num = document.getElementById(num);
 		$num.removeAttribute("disabled");
 		
 		// 현재 루프의 숫자 알아내서
 		var loop_str = num.split('_');
 		var loop_num = parseInt(loop_str[1]);
 		
 		// 일단 form 컨트롤러 위치 바꾸고
 		document.getElementById("room_form"+loop_num).action = "room_modify";
 		
 		// 기존 버튼 숨기고 수정용 버튼 출현
	 	document.getElementById("roommodify_"+loop_num).style="display : none";
	 	document.getElementById("roomdelete_"+loop_num).style="display : none";
	 	document.getElementById("roomodiconfirm_"+loop_num).style="display : block";
	 	document.getElementById("roomodiconfirm_"+loop_num).style="float: left";
	 	document.getElementById("roomodiconfirm_"+loop_num).style="width: 45%";
	 	document.getElementById("roomodiconfirm_"+loop_num).style="height: 42px";
	 	document.getElementById("roomodiconfirm_"+loop_num).style="margin: 4px";
	 	document.getElementById("roomodiconfirm_"+loop_num).style="background: #00D8FF";
	 	document.getElementById("roomodiconfirm_"+loop_num).style="border-radius: 5px";
	 	document.getElementById("modifycancel_"+loop_num).style="display : block";
	 	document.getElementById("modifycancel_"+loop_num).style="float: left";
	 	document.getElementById("modifycancel_"+loop_num).style="width: 45%";
	 	document.getElementById("modifycancel_"+loop_num).style="height: 42px";
	 	document.getElementById("modifycancel_"+loop_num).style="margin: 4px";
	 	document.getElementById("modifycancel_"+loop_num).style="background: #FFE08C";
	 	document.getElementById("modifycancel_"+loop_num).style="border-radius: 5px";	
 	}
 	
 	// 수정 취소 눌렀을 때 로직
 	function r_modify_cancel(num){
 		
 		var loop_str = num.split('_');
 		var loop_num = parseInt(loop_str[1]);
 		
 		document.getElementById("room_form"+loop_num).action = "go_roomlist";
 		document.getElementById("room_form"+loop_num).submit();
 		
 	}
 	
	function cancel(){ // 신규등록 취소 함수
		var tr = document.getElementById("room_table").getElementsByTagName("TBODY")[0];
		tr.removeChild(tr.lastChild);
	}
	
	function add_room(){
		var r_num = document.getElementById("new_room_number").value;
		document.getElementById("imsi_room_number").value = r_num;
		document.getElementById("add_room_form").submit();
	}
	
</script>

</head>
<body>
<!-- 매장 좌석 관리 페이지 입니다. -->
<c:choose>
	<c:when test="${result != null }">
		<input type="hidden" name="" value="${result }" id="result">
		<script>
			var string = document.getElementById("result").value;
			alert(string);
		</script>
	</c:when>
</c:choose>
<jsp:include page="../include/businessHeader.jsp" />
	<div class="menuBar">
	<jsp:include page="../include/menuBar.jsp" />
	</div>
<div id="window_div" class="orderhistory">
	<div id="content_div">
		<div id="upper_div">
			<h1>${rvo.restaurant_name } 좌석/관리</h1>
		</div>
		
		<div id="under_div" class="orderhistorys"> <!-- 이건 flex -->
		<table border="1" id="room_table" class="tablehead" style="border-style: solid;">
			<tr>
						
				<th><div class="orderId">
					<b>테이블 번호</b>
				</div></th>
				<th><div class="title">
					<b>테이블 좌석수</b>
				</div></th>
				<th><div class="trans-kinds">
					<b>예약 여부</b>
				</div></th>		
				<th><div class="created">								
				<input type="button" value="신규등로" id="r_add" onclick="add_tr()"
				style="width: 150px; height: 40px; background: red; border-radius: 10px;">												
				</div></th>	
				
			</tr>
						
					<c:forEach var="rlist" items="${rlist }" varStatus="loop">
						<form action="room_delete" id="room_form${loop.count}">
						<tr id="tr_${loop.count}" class="tabletr">
						
							<td class="orderId">
								<input type="hidden" value="${rlist.room_id }" name="room_id" id="roomid_${loop.count}">								
								<input type="text" value="${loop.count} 번 테이블" name="table_name" disabled="disabled" class="td1"
							>
							</td>
							<td class="title">						
								<input type="text" value="${rlist.room_number }" name="room_number" id="roomnum_${loop.count}" disabled="disabled" class="td2"
							>
							</td>
							<td class="trans-kinds">
								<c:if test="${rlist.room_check == 0}">								
									<input type="text" value="예약없음" name="room_check" id="roomchk_${loop.count}" disabled="disabled" class="td3"
									>
								</c:if><!-- oracle 쪽에서 튕 -->
								<c:if test="${rlist.room_check == 1}">
									<input type="text" value="예약중" name="room_check" id="roomchk_${loop.count}" disabled="disabled" class="td3"
									>
								</c:if>
							</td>
							<td class="created">
								<input type="button" value="수정" id="roommodify_${loop.count}" onclick="r_modify('roomnum_${loop.count}')" class="td4"
								>
								<input type="submit" value="삭제" id="roomdelete_${loop.count}" class="td5"
								>
								<input type="submit" value="수정완료" id="roomodiconfirm_${loop.count}"
								style="display : none;">
								<input type="button" value="취소" id="modifycancel_${loop.count}" onclick="r_modify_cancel('roomnum_${loop.count}')"
								style="float: left; width: 45%; height: 42px; margin: 4px; background: #FFE08C; border-radius: 5px; display : none;">
							</td>
						
						</tr>
						</form>
					</c:forEach>
				
				</table>
				<!-- 신규등록용 임시 form -->
				
				<form action="room_add" id="add_room_form">
					<input type="hidden" value="${rvo.restaurant_id}" name="restaurant_id">
					<input type="hidden" value="" name="room_number" id="imsi_room_number">
				</form>
				
				
			</div>	
			
		</div>
		<hr />
		<div class="paging"> <!-- 페이징 위치 -->
		</div>
	</div>



</body>
</html>