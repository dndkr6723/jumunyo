<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1 { 
	text-align: center
}
.review {
	margin: 60px 10%;
	width: 380px;;
	height: 550px;
	background: #F15F5F;
	border-radius: 30px;
}
.starpoint {
	margin: 0 70px;
	background: #F15F5F;
}
.textarea {
	margin: 10px 60px;
	width: 260px;
}
.photoUpload {
	margin: 10px 60px;
}
.submit {
	margin: 50px 60px;
	width: auto;
	height: auto;
}
.submit>input {
	width: 250px;
	height: 50px;
	background: #A50000;
	font: 20px bolder;
}
.filebox {
	margin: 0 60px;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>

	$(document).ready(function() {
		$('input[type=file]').change(function(e) {
			$(this).parent().find(".file_name").text(e.target.files[0].name);
			var filename = document.getElementById('p1').innerText;
			document.getElementById('filename').value = filename;
		});
	});
</script>

</head>
<body>
		<form action="mypageInsertReview.do" method="post">
		<div class="review">
			<div class="title">
				<h1>${mrestaurant_name}</h1> <!-- 매점명출력 -->
			</div>
			<div class="starpoint" >
				<input type="button" class="star" value="☆" id="s1" name="s1" onclick="sp1();"
				style="border: none; background: #F15F5F; font-size: 30px; color: #FFDF24;"/>								
				<input type="button" class="star" value="☆" id="s2" name="s2" onclick="sp2();"
				style="border: none; background: #F15F5F; font-size: 30px; color: #FFDF24;"/>								
				<input type="button" class="star" value="☆" id="s3" name="s3" onclick="sp3();"
				style="border: none; background: #F15F5F; font-size: 30px; color: #FFDF24;" /> 
				<input type="button" class="star" value="☆" id="s4" name="s4" onclick="sp4();"
				style="border: none; background: #F15F5F; font-size: 30px; color: #FFDF24;"/>								
				<input type="button" class="star" value="☆" id="s5" name="s5" onclick="sp5();"
				style="border: none; background: #F15F5F; font-size: 30px; color: #FFDF24;"/>
				<input type="hidden" name="review_grade" id="starp" value="0" />
			</div>	
			<div class="textarea">
				<textarea name="review_content" cols="30" rows="10" style="width: 250px;" 
				onfocus="this.select()" >주문해주셔서 감사합니다!!!
리뷰를 작성해주세요!</textarea>			
			</div>
			<div class="filebox"> 
			<input type="file" name="" id="" />
			<p class="file_name" id="p1" style="color:#F15F5F;"></p>
			<input type="hidden" name="review_img" id="filename" />
			</div>
			<input type="hidden" name="user_id" value="${sessionScope.userSession.user_id}"/>
			<input type="hidden" name="restaurant_id" value="${mrestaurant_id}"/>
			<input type="hidden" name="review_check" value="1"/>
			<div class="submit">
				<input type="submit" value="리뷰작성" />
			</div>
		</div>
		</form>
</body>
<script>
							var star1 = "★";
							var star2 = "☆";

								function sp1() {
									if(document.getElementById('starp').value == 0) {
									document.getElementById('s1').value = star1;									
									document.getElementById('s2').value = star2;									
									document.getElementById('s3').value = star2;									
									document.getElementById('s4').value = star2;									
									document.getElementById('s5').value = star2;
									document.getElementById('starp').value = 1;
									} else {
										document.getElementById('s1').value = star2;									
										document.getElementById('s2').value = star2;									
										document.getElementById('s3').value = star2;									
										document.getElementById('s4').value = star2;									
										document.getElementById('s5').value = star2;
										document.getElementById('starp').value = 0;
									}
								}
								function sp2() {																	
									document.getElementById('s1').value = star1;
									document.getElementById('s2').value = star1;
									document.getElementById('s3').value = star2;
									document.getElementById('s4').value = star2;
									document.getElementById('s5').value = star2;
									document.getElementById('starp').value = 2;
								}
								function sp3() {									
									document.getElementById('s1').value = star1;
									document.getElementById('s2').value = star1;
									document.getElementById('s3').value = star1;
									document.getElementById('s4').value = star2;
									document.getElementById('s5').value = star2;
									document.getElementById('starp').value = 3;
								}
								function sp4() {								
									document.getElementById('s1').value = star1;
									document.getElementById('s2').value = star1;
									document.getElementById('s3').value = star1;
									document.getElementById('s4').value = star1;
									document.getElementById('s5').value = star2;
									document.getElementById('starp').value = 4;
								}
								function sp5() {								
									document.getElementById('s1').value = star1;
									document.getElementById('s2').value = star1;
									document.getElementById('s3').value = star1;
									document.getElementById('s4').value = star1;
									document.getElementById('s5').value = star1;
									document.getElementById('starp').value = 5;
								}
							
							
					</script>
</html>