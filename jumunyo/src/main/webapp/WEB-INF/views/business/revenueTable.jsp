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
<!-- 매출 현황 페이지 입니다. -->

<div id="window_div">
	<div id="content_div">
		<div id="upper_div">
			<div>
				(매장명) 매출 현황
			</div>
			
			<div>
				매출 현황표
			</div>
		</div>
		
		<div id="under_div"> <!-- 이건 flex -->
			<div>
				여기는 사이드 메뉴바
			</div>
			
			<div> <!-- 본문 배경 div -->
				<div> <!-- 오늘/하루 나오는 div -->
					<div>
						<input type="date" id="start_date" name="start_date">
					</div>
					
					<div>
					
						<select name="date_term">
							<option value="하루">하루</option>
							<option value="한달">한달</option>
							<option value="일년">일년</option>
						</select>
					
					</div>
				</div>
				
				<div>
					<table>
						<tr><th colspan="3">최고 매출 상품!</th></tr>
						<tr>
							<c:forEach var="" items="">
							<td>
								<table>
									<tr><th>1st</th></tr>
									
									<tr>
										<td>
										이미지 들어가는 곳
										</td>
									</tr>
									
									<tr>
										<td>
										몇개 들어가는 곳
										</td>
									</tr>
									
									<tr>
										<td>
										몇원 들어가는곳
										</td>
									</tr>
								</table>
							</td>
							</c:forEach>
						</tr>
					</table>
				</div>
				
				<div>시간대별 매출액 나오는곳</div>
				<div>총거래역, 총매출액 나오는곳</div>
				
			</div>	
		</div>
	</div>
</div>




</body>
</html>