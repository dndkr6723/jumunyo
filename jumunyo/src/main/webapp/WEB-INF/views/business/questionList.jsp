<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
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


</head>
<body>
<!-- 1:1 문의 게시판 입니다. -->

<div id="window_div">
	<div id="content_div">
		<div id="upper_div">
			<div>
				${rvo.restaurant_name } 사업자 1:1 문의
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
				여기가 메인 구현부
				<table border="1">
					<tr>
						<th>상세분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
					
				<c:forEach var="qlist" items="${qlist}" varStatus="loop">
					<tr>
						<td>
							<c:forEach var="qcvo" items="${qcvo}">
								<c:if test="${qcvo.question_category_id == qlist.question_category_id }">
									${qcvo.question_category_name }
								</c:if>
						  	</c:forEach>
						</td>
						<td>
							<a href="#question_detail${loop.count}" rel=modal:open>${qlist.question_title }</a>
						</td>
						<td>
							<c:if test="${qlist.user_id_send == 0}">
								관리자
							</c:if>
							<c:if test="${qlist.user_id_send != 0}">
								${uvo.user_name } 님
							</c:if>
						</td>
						<td>
							${qlist.question_date }
						</td>
					</tr>
					<tr>
						<td colspan="4">
					
					<!-- 여기 모달때문에 만든 임시 trtd -->
				<div id="question_detail${loop.count}" class="modal">
					<table>
						<tr>
							<th>1:1문의 확인</th>
						</tr>
						<tr><td>상세분류</td></tr>
						<tr>
							<td>
								<c:forEach var="qcvo" items="${qcvo}">
								<c:if test="${qcvo.question_category_id == qlist.question_category_id }">
									${qcvo.question_category_name }
								</c:if>
						  		</c:forEach>
							</td>
						</tr>
						<tr><td>제목</td></tr>
						<tr>
							<td>
								${qlist.question_title }
							</td>
						</tr>
						<tr><td>작성자</td></tr>
						<tr>
							<td>
								<c:if test="${qlist.user_id_send == 0}">
								관리자
								</c:if>
								<c:if test="${qlist.user_id_send != 0}">
									${uvo.user_name } 님
								</c:if>
							</td>
						</tr>
						<tr>
							<td>
								작성일
							</td>
						</tr>
						<tr>
							<td>
								${qlist.question_date}	
							</td>
						</tr>
						<tr>
							<td>
								문의내용
							</td>
						</tr>
						<tr>
							<td>
								${qlist.question_content}	
							</td>
						</tr>
					</table>
				</div>
				<!-- 모달 끝 -->
						</td>
					</tr>
				
				</c:forEach>
				</table>
				
				<hr>
				<form action="goquestion_send">
					<input type="submit" value="문의 작성하기">
				</form>
				<input type="button" value="이전페이지로">
				
			</div>
		</div>
	</div>
</div>

</body>
</html>