<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 매장 거래내역 페이지 입니다. -->

<!-- 1:1 문의 게시판 입니다. -->

<div id="window_div">
	<div id="content_div">
		<div id="upper_div">
			<div>
				매장명 거래내역
			</div>
			
			<div>
				주문번호 검색  상세검색
			</div>
		</div>
		
		<div id="under_div"> <!-- 이건 flex -->
			<div>
				여기는 사이드 메뉴바
			</div>
			
			<div> <!-- 메인 구현부 -->
				<table border="1">
					<tr>
						<th>주문번호</th>
						<th>거래종류</th>
						<th>이용시간</th>
						<th>이용좌석</th>
						<th>금액</th>
					</tr>
					<c:forEach var="olist" items="${olist }">
					
						<tr>
							<td>
								${olist.order_id }
							</td>
							
							<td>
								${olist.order_type }
							</td>
							
							<td>
								${olist.order_date }
							</td>
							
							<td>
								${olist.seat_order_id }
							</td>
							
							<td>
								${olist.order_price }
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