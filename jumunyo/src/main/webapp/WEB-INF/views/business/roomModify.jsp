<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function aa(){
		
		var a = document.getElementById(id)
		var ia = parseInt(a);
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
				
				<table border="1">
					
						<tr>
							<th>테이블 번호</th>
							<th>테이블 좌석수</th>
							<th>예약 여부</th>
							<th><input type="button" value="신규등록" id="r_add" onclick=""></th>
						</tr>
					
					<c:forEach var="rlist" items="${rlist }" varStatus="loop">
						<tr>
							<td>
								<input type="text" value="${rlist.room_id }" name="room_id" disabled="disabled">
							</td>
							<td>
								<input type="text" value="${rlist.room_number }" name="room_number" disabled="disabled">
							</td>
							<td>
								<input type="text" value="${rlist.room_check }" name="room_check" disabled="disabled">
							</td>
							<td>
								<input type="button" value="수정">
								<input type="submit" value="삭제">
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