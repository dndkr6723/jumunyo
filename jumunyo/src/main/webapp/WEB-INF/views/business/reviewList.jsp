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
										<input type="hidden" value="${rvlist.review_id }" id="review_id${status.count }">
									</div>
									
									<div><!-- 리뷰 내용들어가는 div -->
										${rvlist.review_content }
									</div>
									
								</div>
							</div>
							
							<c:if test="${rplist[status.index].reply_content != null }">
								<div id="notnull_div${status.count }">
									<div id="reply_div${status.count }"> <!-- 사장님 댓글 들어가는 div -->
										${rvo.restaurant_name } 사장님 답변
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
				
				<div> <!-- 페이징용 임시 div -->
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
		</div>
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