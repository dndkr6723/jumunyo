<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	
function test() {
    $.ajax({
        url: "go_chart_data",
        type: "post",
        data: "",
        dataType: "json",
        contentType: "application/json",
        success: function(data) {
        	
            alert("성공");
            var ts = data;
           	console.log(ts["1"]);
           	
           	google.charts.load('current',{'packages':['corechart']});
           	google.charts.setOnLoadCallback(drawVisualization)
           	
           	function drawVisualization(){
        		var data = google.visualization.arrayToDataTable([
        			['시간','오늘','(전날/전월)대비'],
        			['09~11',ts["1"],30],
        			['11~13',ts["2"],30],
        			['13~15',ts["3"],30],
        			['15~17',ts["4"],30],
        			['17~19',ts["5"],30],
        			['19~21',ts["6"],30],
        			['21~23',ts["7"],30]
        		]);
        		
        		var options = {
        			title : '시간대별 매출액',
        			vAxis : {title:'금액'},
        			hAxis : {title:'시간별'},
        			seriesType : 'bars',
        			series : {5: {type:'line'}},
        			animation: {
                        startup: true,
                        duration: 1000,
                        easing: 'linear' }
        		};
        		
        		var chart = new google.visualization.ComboChart(document.getElementById('chart'));
        		chart.draw(data,options);
        	}
            
        },
        error: function(errorThrown) {
            alert(errorThrown.statusText);
        }
    });
}

</script>

<script>
	function select_term(){
		document.getElementById("date_term_form").submit();
	}
</script>



</head>
<body>
<!-- 매출 현황 페이지 입니다. -->

<div id="window_div">
	<div id="content_div">
		<div id="upper_div">
			<div>
				(매장명) 매출 현황
			</div>
			
			<div>
				매출 현황표
			</div>
		</div>
		
		<div id="under_div"> <!-- 이건 flex -->
			<div>
				여기는 사이드 메뉴바
			</div>
			
			<div> <!-- 본문 배경 div -->
				<div> <!-- 오늘/하루 나오는 div -->
					<div>
						<input type="date" id="start_date" name="start_date">
					</div>
					
					<div>
						<form action="go_revenue_table" id="date_term_form">
							<select name="date_term" id="date_term" onchange="select_term()">
							<c:choose>
								<c:when test="${term == null }">
									<option value="하루" selected="selected">하루</option>
									<option value="일주일">일주일</option>
									<option value="한달">한달</option>
								</c:when>
								<c:when test="${term.equals('하루')}">
									<option value="하루" selected="selected">하루</option>
									<option value="일주일">일주일</option>
									<option value="한달">한달</option>
								</c:when>
								<c:when test="${term.equals('일주일')}">
									<option value="하루">하루</option>
									<option value="일주일" selected="selected">일주일</option>
									<option value="한달">한달</option>
								</c:when>
								<c:when test="${term.equals('한달')}">
									<option value="하루">하루</option>
									<option value="일주일">일주일</option>
									<option value="한달" selected="selected">한달</option>
								</c:when>
							</c:choose>
							</select>
						</form>
					</div>
				</div>
				
				<div>
					<table>
						<tr><th colspan="3">최고 매출 상품!</th></tr>
						<tr>
							<c:forEach var="top" items="${top }" varStatus="loop">
							<td>
								<table>
									<tr><th>
										<c:choose>
											<c:when test="${loop.count == 1 }">
												1st
											</c:when>
											<c:when test="${loop.count == 2 }">
												2nd
											</c:when>
											<c:when test="${loop.count == 3 }">
												3th
											</c:when>
										</c:choose>
									</th></tr>
									
									<tr>
										<td>
										이미지 들어가는 곳
										%{top.value[4]}
										</td>
									</tr>
									
									<tr>
										<td>
										이름들어가는곳
										${top.value[3]}
										</td>
									</tr>
									
									<tr>
										<td>
										총 갯수
										${top.value[2] }
										</td>
									</tr>
									
									<tr>
										<td>
										총 금액
										${top.value[1] }
										</td>
									</tr>
								</table>
							</td>
							</c:forEach>
						</tr>
					</table>
				</div>
				
				<div><!-- 시간대별 매출액 나오는곳 -->
					<div> <!-- flex -->
						<div>시간대별 매출액</div>
						<div>날짜고르기</div>
						<div>전날대비</div>
						<button onclick="test()" type="button">그래프 확인!</button>
					</div>
					
					<div id="chart" style="width:900px; height:500px;"><!--  차트나오는 div -->
					
					</div>
				</div>
				<div>총거래역, 총매출액 나오는곳</div>
				
			</div>	
		</div>
	</div>
</div>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>



</body>
</html>