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
	google.charts.load('current',{'packages':['corechart']});
	google.charts.setOnLoadCallback(drawVisualization)

	
	function drawVisualization(){
		var data = google.visualization.arrayToDataTable([
			['시간','오늘','(전날/전월)대비'],
			['09~11',100,30],
			['11~13',120,30],
			['13~15',130,30],
			['15~17',105,30],
			['17~19',85,30],
			['19~21',71,30],
			['21~23',120,30]
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
					
						<select name="date_term">
							<option value="하루">하루</option>
							<option value="한달">한달</option>
							<option value="일년">일년</option>
						</select>
					
					</div>
				</div>
				
				<div>
					<table>
						<tr><th colspan="3">최고 매출 상품!</th></tr>
						<tr>
							<%-- <c:forEach var="" items=""> --%>
							<td>
								<table>
									<tr><th>1st</th></tr>
									
									<tr>
										<td>
										이미지 들어가는 곳
										</td>
									</tr>
									
									<tr>
										<td>
										몇개 들어가는 곳
										</td>
									</tr>
									
									<tr>
										<td>
										몇원 들어가는곳
										</td>
									</tr>
								</table>
							</td>
							<%-- </c:forEach> --%>
						</tr>
					</table>
				</div>
				
				<div><!-- 시간대별 매출액 나오는곳 -->
					<div> <!-- flex -->
						<div>시간대별 매출액</div>
						<div>날짜고르기</div>
						<div>전날대비</div>
					</div>
					
					<div id="chart" style="width:900px; height:500px;"><!--  차트나오는 div -->
					
					</div>
					${time_sales.get("1") / time_sales.get("8") }
				</div>
				<div>총거래역, 총매출액 나오는곳</div>
				
			</div>	
		</div>
	</div>
</div>


</body>
</html>