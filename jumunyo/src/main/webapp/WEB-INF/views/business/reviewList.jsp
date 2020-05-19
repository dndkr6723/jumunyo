<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	margin: 0;
	padding: 0;
	background: #EAEAEA;
}
a {
	font-size: 15px;
}
.footer {
	border-top: 2px solid black;
	margin: 20px;
}
.orderhistory {
	width: 50%;
	margin: 30px 25%;
	height: auto;
}
.orderhistorys {
	background: white;
	width: 100%;
	border-top: 10px solid red;
	font-size: 25px;
}

.menuBar {
	position: fixed;
	top: 204px;
	left: 14%;	
}
.rr {
	margin: 10px;
	border: 2px dotted #BDBDBD;
}
.review-in {
	margin: 10px 5px;
	height: auto;
	border-left: 5px solid #00D8FF;
	background: #C6FFFF;
}
.reply {
	width: 90%;
	height: auto;
	background: #FFFFC6;
	margin: 10px 5px;
	padding: 5px;
}
.paging {
	width: 150px;
	margin: 0 90%;
	font-size: 20px;
}
b {
	font-size: 15px;
}
</style>
<link rel="stylesheet" type="text/css" href="resources/CSS/reviewList.css">
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
			<b>매장 평균 평점 :</b><b style="color: red;"> ${rvo.restaurant_grade }</b> <b>점</b>
		</div>		
			<div class="orderhistorys">										
				<c:forEach var="rvlist" items="${rvlist }" varStatus="status">
					<div><!-- 각 리뷰글담는 가장 외곽div -->
						<div class="rr"><!-- 리뷰의 중간 div (이미지 div와 나누어짐) -->
							<div> <!-- 리뷰작성자 본문의 가장 외곽 div --> <!-- 이것도 flex -->
								
								<div class="review-in"> <!-- 실제 리뷰 담기는 div -->
								<div class="border1"></div> <!-- 왼쪽 파란색 선꾸미기용 div 상하 100%-->
									<div><!-- flex 이름,별점,시간 div 담는 div -->
										<div>
											<c:forEach var="ulist" items="${ulist}">
												<c:if test="${ulist.user_id == rvlist.user_id }">
													<b>${ulist.user_nickname}</b>
												</c:if>
									  		</c:forEach>
										<!-- 여기는 별점수 출력-->
										<c:choose>
										<c:when test="${rvlist.review_grade >=5.0}">										                               
										<img src="resources/image/star2.png" width="20px" height="20px" />
										<img src="resources/image/star2.png" width="20px" height="20px" />
										<img src="resources/image/star2.png" width="20px" height="20px" />
										<img src="resources/image/star2.png" width="20px" height="20px" />
										<img src="resources/image/star2.png" width="20px" height="20px" />
										</c:when>
										<c:when test="${rvlist.review_grade >=4.0}">										
										<img src="resources/image/star2.png" width="20px" height="20px" />
										<img src="resources/image/star2.png" width="20px" height="20px" />
										<img src="resources/image/star2.png" width="20px" height="20px" />
										<img src="resources/image/star2.png" width="20px" height="20px" />
										<img src="resources/image/star1.png" width="20px" height="20px" />									
										</c:when>
										<c:when test="${rvlist.review_grade >=3.0}">									
										<img src="resources/image/star2.png" width="20px" height="20px" />
										<img src="resources/image/star2.png" width="20px" height="20px" />
										<img src="resources/image/star2.png" width="20px" height="20px" />
										<img src="resources/image/star1.png" width="20px" height="20px" />
										<img src="resources/image/star1.png" width="20px" height="20px" />
										</c:when>
										<c:when test="${rvlist.review_grade >=2.0}">
										<img src="resources/image/star2.png" width="20px" height="20px" />
										<img src="resources/image/star2.png" width="20px" height="20px" />
										<img src="resources/image/star1.png" width="20px" height="20px" />
										<img src="resources/image/star1.png" width="20px" height="20px" />
										<img src="resources/image/star1.png" width="20px" height="20px" />
										</c:when>
										<c:when test="${rvlist.review_grade >=1.0}">										
										<img src="resources/image/star2.png" width="20px" height="20px" />
										<img src="resources/image/star1.png" width="20px" height="20px" />
										<img src="resources/image/star1.png" width="20px" height="20px" />
										<img src="resources/image/star1.png" width="20px" height="20px" />
										<img src="resources/image/star1.png" width="20px" height="20px" />
										</c:when>
										<c:otherwise>
										<img src="resources/image/star1.png" width="20px" height="20px" />
										<img src="resources/image/star1.png" width="20px" height="20px" />
										<img src="resources/image/star1.png" width="20px" height="20px" />
										<img src="resources/image/star1.png" width="20px" height="20px" />
										<img src="resources/image/star1.png" width="20px" height="20px" />
										</c:otherwise>
										</c:choose>	
										<b>
										<fmt:formatDate value="${rvlist.review_date }" pattern="yyyy년 MM월 dd일 HH:mm"/></b>
										<input type="hidden" value="${rvlist.review_id }" id="review_id${status.count }">
										</div>
										
									</div>
									
									<div><!-- 리뷰 내용들어가는 div -->
										<a style="color: #0100FF;">${rvlist.review_content }</a>
									</div>
									
								</div>
							</div>
							
							<c:if test="${rplist[status.index].reply_content != null }">
								<div class="reply" id="notnull_div${status.count }">
									<div id="reply_div${status.count }"> <!-- 사장님 댓글 들어가는 div -->
										<a style="font-size: 30px;">&crarr; <br /></a>
										<b>${rvo.restaurant_name } 사장님</b>
										<b>
										<fmt:formatDate value="${rplist[status.index].reply_date }" pattern="yyyy년 MM월 dd일 HH:mm"/>
										</b>
										<br />
										<input type="text" value="${rplist[status.index].reply_content }" name="reply_content" id="reply_content${status.count }" disabled="disabled"
										style="border: none; width: 300px; height: 30px; font: 20px;">
										<input type="button" value="수정" onclick="start_reply_modify('${status.count }')">
										<input type="button" value="삭제" onclick="reply_delete('${status.count }')">
									</div>
									
									<div id="reply_modify_div${status.count }" style = "display : none">
										<input type="text" value="${rplist[status.index].reply_content }" name="reply_content" id="reply_content_modify${status.count }"
										style="border: none; width: 300px; height: 30px; font: 20px;">
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
				
				<div class="paging"> <!-- 페이징용 임시 div -->
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
		
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

/* 사장님 댓글 수정버튼 눌렀을때 div 변화 */
function start_reply_modify(id){
	
	var id_num = id;
	
	document.getElementById("reply_div"+id_num).style= "display : none";
	document.getElementById("reply_modify_div"+id_num).style= "display : block";
	
}

/* 사장님 댓글 수정 */
function reply_modify(id){
	
	var id_num = id;
	
	var content_data = {"reply_content" : $("#reply_content"+id_num).val(), "new_reply_content" : $("#reply_content_modify"+id_num).val()};
	
	$.ajax({
	    url: "reply_modify",
	    type: "post",
	    data: content_data,
	    async:false,
	    dataType: "text",
	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    success: function(data) {
	    	if(data == "success"){
	    		
	    		alert("수정성공!");
	    		document.getElementById("reply_div"+id_num).style = "display : block";
	    		document.getElementById("reply_modify_div"+id_num).style = "display : none";
	    		document.getElementById("reply_content"+id_num).value = $("#reply_content_modify"+id_num).val();
	    		document.getElementById("reply_content_modify"+id_num).value = $("#reply_content_modify"+id_num).val();
	    			
	    	}else if(data == "fail"){
	    		alert("수정실패!");
	    		document.getElementById("reply_div"+id_num).style = "display : block";
	    		document.getElementById("reply_modify_div"+id_num).style = "display : none";
	    	}
	    	
	    },
		error: function(errorThrown) {
        alert(errorThrown.statusText);
    	}
	});
}

// 사장님 댓글 수정 취소
function reply_modify_cancel(id){
	
	var id_num = id;
	document.getElementById("reply_div"+id_num).style= "display : block";
	document.getElementById("reply_modify_div"+id_num).style= "display : none";
	document.getElementById("reply_content_modify"+id_num).value= $("#reply_content"+id_num).val();
	
}

/* 사장님 댓글 삭제 */
function reply_delete(id){
	
	var id_num = id;
	
	var content_data = {"reply_content" : $("#reply_content"+id_num).val()}
	
	$.ajax({
	    url: "reply_delete",
	    type: "post",
	    data: content_data,
	    async:false,
	    dataType: "text",
	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    success: function(data) {
	    	if(data == "success"){
	    		
	    		alert("삭제성공!");
	    		location.href='review_list';
	    			
	    	}else if(data == "fail"){
	    		alert("삭제실패!");
	    		location.href='review_list';
	    	}
	    	
	    },
		error: function(errorThrown) {
        alert(errorThrown.statusText);
    	}
	});
	
}

// 댓글 작성하기 눌러서 댓글 작성하는 div 여는 함수
function reply_open(id){
	
	var id_num = id;
	
	document.getElementById("reply_button_div"+id_num).style= "display : none";
	document.getElementById("reply_add_div"+id_num).style= "display : block";
	
}

// 댓글 추가하는 이벤트
function reply_add(id){
	
var id_num = id;
	
	var content_data = {"reply_content" : $("#reply_content_new"+id_num).val(), "review_id" : $("#review_id"+id_num).val()}
	
	$.ajax({
	    url: "reply_add",
	    type: "post",
	    data: content_data,
	    async:false,
	    dataType: "text",
	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    success: function(data) {
	    	if(data == "success"){
	    		
	    		alert("댓글달기 성공!");
	    		location.href='review_list';
	    			
	    	}else if(data == "fail"){
	    		alert("댓글달기 실패!");
	    		location.href='review_list';
	    	}
	    	
	    },
		error: function(errorThrown) {
        alert(errorThrown.statusText);
    	}
	});
	
}

// 댓글 추가 취소 이벤트
function reply_cancel(id){
	
	var id_num = id;
	
	document.getElementById("reply_button_div"+id_num).style= "display : block";
	document.getElementById("reply_add_div"+id_num).style= "display : none";
	document.getElementById("reply_content_new"+id_num).value= "";
	
}

</script>

</body>
</html>