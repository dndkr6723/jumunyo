<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 매장 예약 관리 페이지 입니다. -->

<div id="window_div">
	<div id="content_div">
		<div id="upper_div">
			<div>
				${rvo.restaurant_name } 예약관리
			</div>
			
			<div>
				예약전체보기
			</div>
		</div>
		
		<div id="under_div"> <!-- 이건 flex -->
			<div>
				여기는 사이드 메뉴바
			</div>
			
			<div> <!-- 메인 구현부 -->
				<table border="1">
					<tr>
						<th>이용시간</th>
						<th>이용좌석</th>
						<th>이용회원</th>
						<th>연락처</th>
						<th>비고</th>
						<th>현황</th>
					</tr>
					<c:forEach var="relist" items="${relist }">
					
					<tr>
						<td>
								${relist.reservation_time }
						</td>
							
						<td>
								${relist.room_id }
						</td>
							
						<c:forEach var="ulist" items="${ulist }">
						<c:if test="${relist.user_id == ulist.user_id }">
						<td>	
								${ulist.user_name }
						</td>
							
						<td>
								${ulist.user_tell }
						</td>
						</c:if>	
						</c:forEach>
						<td>
								${solist.request }
						</td>
							
						<td>
								여기 이용 현황
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