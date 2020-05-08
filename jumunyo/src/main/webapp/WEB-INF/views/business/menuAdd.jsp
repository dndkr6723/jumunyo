<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
	String result = "";
	if(request.getAttribute("mvo")!=null){
		result = "menu_modify";
	}else{
		result = "menu_add";
	}
%>

</head>
<body>
<!-- 매장 메뉴 추가 페이지 입니다. -->

<div id="window_div">
	<div id="content_div">
		<div id="upper_div">
			<div>
				${rvo.restaurant_name } 메뉴추가/수정
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
			<form action="<%= result%>">
				<table>
					<tr>
						<td>메뉴 이름</td>
						<td>
						<c:if test="${mvo.menu_id != null}">
							<input type="hidden" value="${mvo.menu_id }" name="menu_id">
						</c:if>
							<input type="hidden" value="${rvo.restaurant_id }" name="restaurant_id">
							<input type="text" value="${mvo.menu_name}" name="menu_name" required="required">
						</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>
							<input type="text" value="${mvo.menu_price}" name="menu_price" required="required">
						</td>
					</tr>
					<tr>
						<td>이미지</td>
						<td>
							이미지 넣는 로직
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="등록">
							<input type="reset" value="취소">
						</td>
					</tr>
				</table>
				</form>
				
			</div>	
		</div>
	</div>
</div>


</body>
</html>