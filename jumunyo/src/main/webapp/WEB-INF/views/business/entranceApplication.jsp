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
<!-- 여기 상단에서 restaurant_accept 체크해서 0이 아니면(신청한적있거나 입점상태면) 튕겨내는 로직-->

<!-- 입점 신청페이지 입니다. -->

<div id="window_div">
	<div id="content_div">
		<div id="back_div">
			<form action="entrance_request">
				<table border="1">
					<figcaption>주문요 입점신청</figcaption>
					<tr>
						<td>매장 이름 </td>
						<td>
							<input type="text" name="restaurant_name">
						</td>
					</tr>
					<tr>
						<td>매장 업종</td>
						<td>
							<select name="category_id">
							<c:forEach var="clist" items="${clist }">
								<option value="${clist.category_id }">${clist.category_name }</option>
							</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>매장 전화번호</td>
						<td>
							<input type="text" name="restaurant_tell">
						</td>
					</tr>
					<tr>
						<td>매장 주소</td>
						<td>
							<input type="text" name="restaurant_address">
							<!-- 주소 api -->
						</td>
					</tr>
					<tr>
						<td>사업자번호</td>
						<td>
							<input type="text" name="restaurant_businessnumber">
						</td>
					</tr>
					<tr>
						<td>사업자등록증 사본</td>
						<td>
							<input type="text" name="restaurant_businessnumber_img">
							<!-- 이미지 넣는 로직 -->
						</td>
					</tr>
					<tr>
						<td>대표자명</td>
						<td>
							<input type="text" name="restaurant_owner">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<table>
								<figcaption>정보 수집 및 이용동의</figcaption>
								<tr>
									<td><input type="checkbox" value="이용약관 전체" onclick="">이용약관 전체</td>
								</tr>
								<tr>
									<td><input type="checkbox" value="이용약관" required="required">이용약관</td>
								</tr>
								<tr>
									<td><input type="checkbox" value="위치정보" required="required">위치정보</td>
								</tr>
								<tr>
									<td><input type="checkbox" value="광고성">광고성</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="확인">
						</td>
						<td>
							<input type="reset" value="취소">
						</td>
					</tr>
				</table>
				<input type="hidden" value=${uvo.user_id } name="user_id">
			</form>
			
		</div>
	</div>
</div>


</body>
</html>