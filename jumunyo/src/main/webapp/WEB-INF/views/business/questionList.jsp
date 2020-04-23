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

<% 
/* 	 model 로 넘긴 해쉬맵값 풀어해치는 방법 
	HashMap cc = request.getAttribute("cg");
	HashMap cg = new HashMap();
	Map map = request.getParameterMap();
	Iterator it = map.keySet().iterator();
	Object key = null;
	String[] value = null;

	 while(it.hasNext()){
		 key = it.next();
		 value = (String[]) map.get(key);

		 for(int i = 0 ; i < value.length; i++) {
			 cg.put(key,value[i]);
		 }
	 }
	 System.out.print(cg.get(1)); */
 %>

</head>
<body>
<!-- 1:1 문의 게시판 입니다. -->

<div id="window_div">
	<div id="content_div">
		<div id="upper_div">
			<div>
				사업자 1:1 문의
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
						<th>확인여부</th>
					</tr>
					
				<c:forEach var="qlist" items="${qlist}">
					<tr>
						<td>
							<%-- ${cg.get(1) } --%>
							${qlist.question_category_id }
						</td>
						<td>
							${qlist.question_title }
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
						<td>
							${qlist.question_check }
						</td>
					</tr>
				</c:forEach>
				
				</table>
			</div>
		</div>
	</div>
</div>

</body>
</html>