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
<!-- 매장 리뷰 관리 페이지 입니다. -->

<div id="window_div">
	<div id="content_div">
		<div id="upper_div">
			<div>
				${rvo.restaurant_name } 리뷰관리
			</div>
			
			<div>
				매장 평균 평점 : ${rvo.restaurant_grade }
			</div>
		</div>
		
		<div id="under_div"> <!-- 이건 flex -->
			<div>
				여기는 사이드 메뉴바
			</div>
			
			<div> <!-- 메인 구현부 -->
				<c:forEach var="rvlist" items="${rvlist }" varStatus="status">
					<div><!-- 각 리뷰글담는 가장 외곽div -->
						<div><!-- 리뷰의 중간 div (이미지 div와 나누어짐) -->
							<div> <!-- 리뷰작성자 본문의 가장 외곽 div --> <!-- 이것도 flex -->
								<div></div> <!-- 왼쪽 파란색 선꾸미기용 div 상하 100%-->
								<div> <!-- 실제 리뷰 담기는 div -->
									<div><!-- flex 이름,별점,시간 div 담는 div -->
										<div>
											<c:forEach var="ulist" items="${ulist}">
												<c:if test="${ulist.user_id == rvlist.user_id }">
													${ulist.user_nickname}
												</c:if>
									  		</c:forEach>
								  		</div>
										<div>${rvlist.review_grade }</div>
										<div>${rvlist.review_date }</div>
									</div>
									
									<div><!-- 리뷰 내용들어가는 div -->
										${rvlist.review_content }
									</div>
									
								</div>
							</div>
							
							<c:if test="${rplist[status.index].reply_content != null }">
								<div> <!-- 사장님 댓글 들어가는 div -->
									${rvo.restaurant_name } 사장님 답변
									${rplist[status.index].reply_date }
									${rplist[status.index].reply_content }
									<input type="button" value="수정">
									<input type="button" value="삭제">
								</div>
							</c:if>
							
							<c:if test="${rplist[status.index].reply_content == null }">
								<div> <!-- 아직 사장님이 댓글 안달아서 버튼 나옴 -->
									<input type="button" value="댓글 작성하기">
								</div>
							</c:if>
							
						</div>
						
						<div><!-- 이미지 들어가는 div -->
						
						</div>
						
					</div>
				</c:forEach>
				
			</div>
		</div>
	</div>
</div>


</body>
</html>