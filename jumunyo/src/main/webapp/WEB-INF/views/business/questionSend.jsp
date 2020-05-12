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
<!-- 1:1문의 보내기 페이지 입니다. -->

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
			
			<div> <!-- 메인 구현부 -->
				<form action="question_send">
					<table border="1">
							<tr>
								<th>1:1문의 작성</th>
							</tr>
							<tr><td>상세분류</td></tr>
							<tr>
								<td>
									<div>
										<select name="question_category_id">
											<c:forEach var="qclist" items="${qclist }">
												<option value="${qclist.question_category_id }">${qclist.question_category_name }</option>
											</c:forEach>
										</select>
									</div>
								</td>
							</tr>
							<tr><td>제목</td></tr>
							<tr>
								<td>
									<input type="text" name="question_title">
								</td>
							</tr>
							<tr>
								<td>
									문의내용
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" name="question_content">	
									<input type="hidden" value="${uvo.user_id }" name="user_id_send">
									<input type="hidden" value="0" name="user_id_receive">
									<input type="hidden" value="답변대기" name="question_check">
								</td>
							</tr>
							<tr>
								<td>
									<input type="submit" value="보내기">
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