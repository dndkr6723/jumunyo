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
.window_div {
	width: 50%;
	margin: 30px 25%;
	height: auto;
}
.menuBar {
	position: fixed;
	top: 204px;
	left: 14%;	
}
.date1 {
	width: 100%;
	height: auto;
	border-top: 10px solid red;
	font-size: 25px;
	
}
.dateinput {
	
	margin: 10px 0 0 0;
}
.dateselect {
	margin: 10px 0 0 0;
}
.topSales {
	width: 100%;
	margin: 0;
	height: auto;
	font-size: 25px;
}
.topborder {
	margin: 0;
	border: thick double #FFE400;
}
.table1 {
	width: 100%;
}
.table2 {
	text-align: center;
}
.tr1 {
	width: 33.3%;
}
.tr2 {
	width: 33.3%;
}
.tr3 {
	width: 33.3%;
}
.tr4 {
	width: 33.3%;
}
.tr5 {
	width: 33.3%;
}
.time1 {
	margin: 10px 0;
	width: 99%;
	border: thick double #FFE400;
}
.grafButton {
	box-shadow:inset 0px 0px 15px 3px #9fb4f2;
	background:linear-gradient(to bottom, #7892c2 5%, #476e9e 100%);
	background-color:#7892c2;
	border-radius:17px;
	border:1px solid #4e6096;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 13px;
	text-decoration:none;
	text-shadow:0px 1px 0px #283966;
}
.grafButton:hover {
	background:linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
	background-color:#476e9e;
}
.grafButton:active {
	position:relative;
	top:1px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" type="text/css" href="resources/CSS/revenueTable.css">
<script>
	var todate = new Date().toISOString().substring(0,10);
	document.getElementById("start_date").value = todate;
</script>
</head>
<body>
<!-- 매출 현황 페이지 입니다. -->
	<jsp:include page="../include/businessHeader.jsp" />
	<div class="menuBar">
	<jsp:include page="../include/menuBar.jsp" />
	</div>	
	<div class="window_div">		
			<h1>${rvo.restaurant_name } 매출 현황</h1>

			<div class="date1"> <!-- 오늘/하루 나오는 div -->
						<form action="go_revenue_table" id="date_term_form">
					<div class="dateinput">
						<c:choose>
							<c:when test="${date == null }">
								<input type="date" id="start_date" name="start_date" value ="" onchange="select_term()"
								style="width: 150px; height: 30px; border-radius: 10px; border: 1px solid #BDBDBD;"/>
							</c:when>
							<c:when test="${date != null }">
								<input type="date" id="start_date" name="start_date" value = "${date }" onchange="select_term()"
								style="width: 150px; height: 30px; border-radius: 10px; border: 1px solid #BDBDBD;"/>
							</c:when>
						</c:choose>
					</div>
					
					<div class="dateselect">
							<select name="date_term" id="date_term" 
							style="width: 150px; height: 30px; border-radius: 10px; border: 2px solid black;" onchange="select_term()" >
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
					</div>
						</form>
			</div>
			<div class="topSales">
					<div class="topborder">
						<table class="table1" >
						<tr><th colspan="3">최고 매출 상품!</th></tr>
						<tr>
							<c:forEach var="top" items="${top }" varStatus="loop">
							
							<td>
								<table class="table2">
									<tr>
									<th class="tr1">
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
									</th>
									</tr>
									
									<tr>
										<td class="tr2">
										<img src="../image/Korea.png" alt="" width="100%" height="100px"/>
										${top.value[4]}
										</td>
									</tr>
									
									<tr>
										<td class="tr3">
										<b>${top.value[3]}</b>
										</td>
									</tr>
									
									<tr>
										<td class="tr4">
										<a>${top.value[2] } 개</a>
										</td>
									</tr>
									
									<tr>
										<td class="tr5">
										<a><fmt:formatNumber value="${top.value[1] }" type="currency"/></a>
										</td>
									</tr>
								</table>
								</td>
								
							</c:forEach>
						</tr>
					</table>
				</div>
	</div>
	<div class="time1"><!-- 시간대별 매출액 나오는곳 -->
					<div> <!-- flex -->
						<div><h2>시간대별 매출액</h2></div>
						
						<div class="dateinput"><input type="date" id="select_date" name="select_date"  value=""
						style="width: 150px; height: 30px; border-radius: 10px; border: 1px solid #BDBDBD;"/></div>
						
						<div class="dateselect">
							<select name="compare_date" id="compare_date" 
							style="width: 150px; height: 30px; border-radius: 10px; border: 2px solid black;">
								<option value="없음" selected="selected">대비없음</option>
								<option value="전날">전날 대비</option>
								<option value="일주일">일주일 평균대비</option>
								<option value="한달">한달 평균대비</option>
							</select>
						</div>
						<br />
						<button onclick="graph()" class="grafButton" type="button">그래프 확인!</button>
					</div>
					
					<div id="chart" style="width:900px; height:500px;"><!--  차트나오는 div -->
					
					</div>
				</div>
				<div><b style="color: #0100FF; font-size: 25px;">총거래역 : ${total_mount } 회 / 총매출액 :<fmt:formatNumber value="${total_price }" type="currency"/></b></div>
				
			</div>	
		
	

<script type="text/javascript">

function graph() {
	var select_date = {"select_date" : $("#select_date").val(), "compare_date" : $("#compare_date option:selected").val()};
	
    $.ajax({
        url: "go_chart_data",
        type: "post",
        data: select_date,
        async:false,
        dataType: "json",
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        success: function(data) {
        	
            alert("성공");
            var ts = data;
           	
           	google.charts.load('current',{'packages':['corechart']});
           	google.charts.setOnLoadCallback(drawVisualization)
           	
           	function drawVisualization(){
        		var data = google.visualization.arrayToDataTable([
        			['시간','오늘','(전날/전월)대비'],
        			['09~11',ts["1"],ts["11"]],
        			['11~13',ts["2"],ts["12"]],
        			['13~15',ts["3"],ts["13"]],
        			['15~17',ts["4"],ts["14"]],
        			['17~19',ts["5"],ts["15"]],
        			['19~21',ts["6"],ts["16"]],
        			['21~23',ts["7"],ts["17"]]
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
	var todate = new Date().toISOString().substring(0,10);
	document.getElementById("select_date").value = todate;
</script>

<script>
	var todate = new Date().toISOString().substring(0,10);
	var date_value = document.getElementById("start_date").value;
	if(date_value == ""){
		document.getElementById("start_date").value = todate;
	}
</script>

<script>
	function select_term(){
		document.getElementById("date_term_form").submit();
	}
</script>

</body>
</html>