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
		ncell2.innerHTML = "<input type='text' value='' name='room_num'>";
		ncell3.innerHTML = "<input type='text' value='없음' name='room_check'>";
		ncell4.innerHTML = "<input type='button' value='등록' onclick=''>"
						   + "<input type='button' value='취소'>";
		
	}
 	
 	function r_modify(num,chk){
 		
 		
 		var $num = document.getElementById(num);
 		var $chk = document.getElementById(chk);
 		console.log($num);
 		console.log($chk);
 		$num.removeAttribute("disable");
 		$chk.removeAttribute("disable");
 	}
</script>

</head>
<body>
<!-- 매장 좌석 관리 페이지 입니다. -->

<div id="window_div">
	<div id="content_div">
		<div id="upper_div">
			<div>
				(매장명) 좌석/관리
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
						<tr id="${loop.count}">
							<td>
								<input type="hidden" value="${rlist.room_id }" name="room_id" id="roomid_${loop.count}">
								${loop.count} 번 테이블
							</td>
							<td>
								<input type="text" value="${rlist.room_number }" name="room_number" id="roomnum_${loop.count}" disabled="disabled">
							</td>
							<td>
								<input type="text" value="${rlist.room_check }" name="room_check" id="roomchk_${loop.count}" disabled="disabled">
							</td>
							<td>
								<input type="button" value="수정" onclick="r_modify('roomnum_${loop.count}','roomchk_${loop.count}')">
								<input type="button" value="삭제" onclick="">
							</td>
						</tr>
					</c:forEach>
				</table>
				
				
			</div>	
		</div>
	</div>
</div>


</body>
</html>