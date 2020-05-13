<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../../../resources/js/jquery-3.1.1.js"></script>

</head>
<body>
<!-- 매장 메뉴 출력 페이지 입니다. -->

<div id="window_div">
	<div id="content_div">
		<div id="upper_div">
			<div>
				${rvo.restaurant_name } 메뉴관리
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
							<th>메뉴이름</th>
							<th>가격</th>
							<th>이미지</th>
							<th><form action="go_menu_add"><input type="submit" value="신규등록" id="m_add"></form></th>
						</tr>
					
					<c:forEach var="mlist" items="${mlist }" varStatus="loop">
						<tr>
							<td>
								<input type="hidden" value="${mlist.menu_id }" name="menu_id" id="menu_id${loop.count}">
								<input type="text" value="${mlist.menu_name }" name="menu_name" disabled="disabled">
							</td>
							<td>
								<input type="text" value="${mlist.menu_price }" name="menu_price" disabled="disabled">
							</td>
							<td>
								<input type="text" value="${mlist.menu_image }" name="menu_image" disabled="disabled">
							</td>
							<td>
								<form action="go_menu_modify?menu_id=${mlist.menu_id }" method="post"><input type="submit" value="수정" id="m_modify${loop.count}"></form>
								<form action="menu_delete?menu_id=${mlist.menu_id }" method="post"><input type="submit" value="삭제" id="m_delete${loop.count}"></form>
							</td>
						</tr>
					</c:forEach>
				</table>
				
			</div>
			
			<div> <!-- 페이징용 임시 div -->
				<c:if test="${paging.startPage != 1 }">
						<a href="menu_list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a href="menu_list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="menu_list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
			</div>
		</div>
	</div>
</div>

</body>

</html>