<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		
		ncell1.innerHTML = lastidnum+1+" 번 테이블";
		ncell2.innerHTML = "<input type='text' value='' name='room_number' id='new_room_number'>";
		ncell3.innerHTML = "<input type='text' value='예약없음' disabled='disabled'>";
		ncell4.innerHTML = "<input type='button' value='등록' onclick='add_room()'>"
						   + "<input type='button' value='취소' onclick='cancel()'>";
		
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
	 	document.getElementById("modifycancel_"+loop_num).style="display : block";
	 	
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

<div id="window_div">
	<div id="content_div">
		<div id="upper_div">
			<div>
				${rvo.restaurant_name } 좌석/관리
			</div>
			
			<div>
				사장님 문의게시판
			</div>
		</div>
		
		<div id="under_div"> <!-- 이건 flex -->
			<div>
				여기는 사이드 메뉴바
			</div>
			
			<div>
				
				<table border="1" id="room_table">
					
						<tr>
							<th>테이블 번호</th>
							<th>테이블 좌석수</th>
							<th>예약 여부</th>
							<th><input type="button" value="신규등록" id="r_add" onclick="add_tr()"></th>
						</tr>
					
					<c:forEach var="rlist" items="${rlist }" varStatus="loop">
						<form action="room_delete" id="room_form${loop.count}">
						<tr id="tr_${loop.count}">
							<td>
								<input type="hidden" value="${rlist.room_id }" name="room_id" id="roomid_${loop.count}">
								${loop.count} 번 테이블
							</td>
							<td>
								<input type="text" value="${rlist.room_number }" name="room_number" id="roomnum_${loop.count}" disabled="disabled">
							</td>
							<td>
								<c:if test="${rlist.room_check == 0}">
									<input type="text" value="예약없음" name="room_check" id="roomchk_${loop.count}" disabled="disabled">
								</c:if><!-- oracle 쪽에서 튕 -->
								<c:if test="${rlist.room_check == 1}">
									<input type="text" value="예약중" name="room_check" id="roomchk_${loop.count}" disabled="disabled">
								</c:if>
							</td>
							<td>
								<input type="button" value="수정" id="roommodify_${loop.count}" onclick="r_modify('roomnum_${loop.count}')">
								<input type="submit" value="삭제" id="roomdelete_${loop.count}">
								<input type="submit" value="수정완료" id="roomodiconfirm_${loop.count}" style="display : none">
								<input type="button" value="취소" id="modifycancel_${loop.count}" style="display : none" onclick="r_modify_cancel('roomnum_${loop.count}')">
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
	</div>
</div>


</body>
</html>