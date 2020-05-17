<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../CSS/reviewList.css">
</head>
<body>
<!-- 매장 리뷰 관리 페이지 입니다. -->
		<jsp:include page="../include/businessHeader.jsp" />
		<div class="menuBar">
			<jsp:include page="../include/menuBar.jsp" />
		</div>
		<div class="orderhistory">
	<div id="content_div">
		<div id="upper_div">
			<h1>${rvo.restaurant_name } 리뷰 관리</h1>	
		</div>
		<div>
			<b>매장 평균 평점 :</b><b style="color: red;"> ${rvo.restaurant_grade }  3.5 </b> <b>점</b>
		</div>		
			<div class="orderhistorys">										
				<c:forEach var="rvlist" items="${rvlist }" varStatus="status">
					<div><!-- 각 리뷰글담는 가장 외곽div -->
						<div><!-- 리뷰의 중간 div (이미지 div와 나누어짐) -->
							<div> <!-- 리뷰작성자 본문의 가장 외곽 div --> <!-- 이것도 flex -->
								
								<div class="review-in"> <!-- 실제 리뷰 담기는 div -->
								<div class="border1"></div> <!-- 왼쪽 파란색 선꾸미기용 div 상하 100%-->
									<div><!-- flex 이름,별점,시간 div 담는 div -->
										<div>
											<c:forEach var="ulist" items="${ulist}">
												<c:if test="${ulist.user_id == rvlist.user_id }">
													<a>${ulist.user_nickname} 님네임</a>
												</c:if>
									  		</c:forEach>
										<a>${rvlist.review_grade }3.5</a> <!-- 여기는 별점수 출력-->
										<c:choose>
										<c:when test="${rvlist.review_grade >=5.0}">											                               
										<img src="../image/star2.png" width="20px" height="20px" />
										<img src="../image/star2.png" width="20px" height="20px" />
										<img src="../image/star2.png" width="20px" height="20px" />
										<img src="../image/star2.png" width="20px" height="20px" />
										<img src="../image/star2.png" width="20px" height="20px" />
										</c:when>
										<c:when test="${rvlist.review_grade >=4.0}">										
										<img src="../image/star2.png" width="20px" height="20px" />
										<img src="../image/star2.png" width="20px" height="20px" />
										<img src="../image/star2.png" width="20px" height="20px" />
										<img src="../image/star2.png" width="20px" height="20px" />
										<img src="../image/star1.png" width="20px" height="20px" />									
										</c:when>
										<c:when test="${rvlist.review_grade >=3.0}">									
										<img src="../image/star2.png" width="50px" height="50px" />
										<img src="../image/star2.png" width="50px" height="50px" />
										<img src="../image/star2.png" width="50px" height="50px" />
										<img src="../image/star1.png" width="50px" height="50px" />
										<img src="../image/star1.png" width="50px" height="50px" />
										</c:when>
										<c:when test="${rvlist.review_grade >=2.0}">
										<img src="../image/star2.png" width="20px" height="20px" />
										<img src="../image/star2.png" width="20px" height="20px" />
										<img src="../image/star1.png" width="20px" height="20px" />
										<img src="../image/star1.png" width="20px" height="20px" />
										<img src="../image/star1.png" width="20px" height="20px" />
										</c:when>
										<c:when test="${rvlist.review_grade >=1.0}">										
										<img src="../image/star2.png" width="20px" height="20px" />
										<img src="../image/star1.png" width="20px" height="20px" />
										<img src="../image/star1.png" width="20px" height="20px" />
										<img src="../image/star1.png" width="20px" height="20px" />
										<img src="../image/star1.png" width="20px" height="20px" />
										</c:when>
										<c:otherwise>
										<img src="../image/star1.png" width="20px" height="20px" />
										<img src="../image/star1.png" width="20px" height="20px" />
										<img src="../image/star1.png" width="20px" height="20px" />
										<img src="../image/star1.png" width="20px" height="20px" />
										<img src="../image/star1.png" width="20px" height="20px" />
										</c:otherwise>
										</c:choose>	
										<a>${rvlist.review_date } 2020-05-15 12:05</a>
										<input type="hidden" value="${rvlist.review_id }" id="review_id${status.count }">
										</div>
										
									</div>
									
									<div><!-- 리뷰 내용들어가는 div -->
										${rvlist.review_content }
										<b>대박 맛있었습니다! 사장님 짱!</b>
									</div>
									
								</div>
							</div>
							
							<c:if test="${rplist[status.index].reply_content != null }">
								<div id="notnull_div${status.count }">
									<div id="reply_div${status.count }"> <!-- 사장님 댓글 들어가는 div -->
										<a>${rvo.restaurant_name } 사장님 답변</a>
										${rplist[status.index].reply_date }
										<input type="text" value="${rplist[status.index].reply_content }" name="reply_content" id="reply_content${status.count }" disabled="disabled">
										<input type="button" value="수정" onclick="start_reply_modify('${status.count }')">
										<input type="button" value="삭제" onclick="reply_delete('${status.count }')">
									</div>
									
									<div id="reply_modify_div${status.count }" style = "display : none">
										<input type="text" value="${rplist[status.index].reply_content }" name="reply_content" id="reply_content_modify${status.count }">
										<input type="button" value="수정완료" onclick="reply_modify('${status.count }');">
										<input type="button" value="취소" onclick="reply_modify_cancel('${status.count }');">
									</div>
								</div>
							</c:if>
							
							<c:if test="${rplist[status.index].reply_content == null }">
								<div id="null_div${status.count }">
									<div id="reply_button_div${status.count }"> <!-- 아직 사장님이 댓글 안달아서 버튼 나옴 -->
										<input type="button" value="댓글 작성하기" id="reply_open${status.count }" onclick="reply_open('${status.count }');">
									</div>
									
									<div id="reply_add_div${status.count }" style="display : none">
										<input type="text" name="reply_content" id="reply_content_new${status.count }">
										<input type="button" value="댓글등록" onclick="reply_add('${status.count }');">
										<input type="button" value="취소" onclick="reply_cancel('${status.count }');">
									</div>
								</div>
							</c:if>
							
						</div>
						
						<div><!-- 이미지 들어가는 div -->
						
						</div>
						
					</div>
				</c:forEach>
				
				<div class="paging"> <!-- 페이징용 임시 div -->1. 2. 3. 4. 5
				<c:if test="${paging.startPage != 1 }">
						<a href="review_list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a href="review_list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="review_list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>	
					
					
				
				</div>
				
				<hr>
				
			</div>
		</div>


</body>
</html>