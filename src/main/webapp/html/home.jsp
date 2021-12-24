<%@page import="org.global.beans.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel_Home</title>
<link href="<%=request.getContextPath()%>/css/home.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
	<jsp:include page="header.jsp"/>
	<section class="page">
		<section class="banner">
			<div id="button">
				<a href="<%=request.getContextPath() %>/booking.do"><img src="./images/예약하기.png" id="예약하기"></a><br> 
				<a href="<%=request.getContextPath() %>/recommendAll.do"><img src="./images/추천 여행지.png" id="추천여행지"></a><br> 
				<a href="<%=request.getContextPath() %>/ProductProc.do"><img src="./images/상품 패키지.png" id="상품패키지"></a>
			</div>

			<input type="radio" name="slide" id="slide01" checked> <input
				type="radio" name="slide" id="slide02"> <input type="radio"
				name="slide" id="slide03">

			<div class="slidewrap">
				<ul class="slidelist">

					<!-- 슬라이드 영역 -->
					<li class="slideitem"><a  href="#"> <img src="<%=request.getContextPath()%>/images/banner1.jpg"></a></li>
					<li class="slideitem"><a  href="#"> <img src="<%=request.getContextPath()%>/images/banner2.jpg"></a></li>
					<li class="slideitem"><a  href="#"> <img src="<%=request.getContextPath()%>/images/banner3.jpg"></a></li>

					<!-- 좌,우 슬라이드 버튼 -->
					<div class="slide-control">
						 <div>
                            <label for="slide03" class="left" onclick="change('#7987d1')"></label>
                            <label for="slide02" class="right" onclick="change('#dbcbb0')"></label>
                        </div>
                        <div>
                            <label for="slide01" class="left" onclick="change('#ffffff')"></label>
                            <label for="slide03" class="right" onclick="change('#7987d1')"></label>
                        </div>
                        <div>
                            <label for="slide02" class="left" onclick="change('#dbcbb0')"></label>
                            <label for="slide01" class="right" onclick="change('#ffffff')"></label>
                        </div>
					</div>
				</ul>
				<!-- 페이징 -->
				<ul class="slide-pagelist">
					<li><label for="slide01"></label></li>
					<li><label for="slide02"></label></li>
					<li><label for="slide03"></label></li>
				</ul>
			</div>
		</section>

		<section class="mid ">
			<div class="i">
				<h1 id="title">크리스마스에 떠나는 캐나다 여행, 추천 여행지</h1>
				<div class="events1">
					<img id="events" src="<%=request.getContextPath()%>/images/퀘벡 구시가지.jpg">
					<h1>
						캐나다<br> &nbsp; 퀘벡시 <br> Quebec
					</h1>
				</div>
				<div class="events2">

					<ul id="events_list1">
						<a href="<%=request.getContextPath()%>/detail.do?p=9"><img id="img1" src="<%=request.getContextPath()%>/images/쁘띠 샹플랭.jpg"></a>
						<a href="<%=request.getContextPath()%>/detail.do?p=9"><img id="img2" src="<%=request.getContextPath()%>/images/나이아가라폭포.jpg"></a>
						<a href="<%=request.getContextPath()%>/detail.do?p=9"><img id="img3" src="<%=request.getContextPath()%>/images/퀘벡 페어몬트샤토 프롱트 낙 호텔.jpg"></a>
					</ul>

					<ul id="events_list2">
						<li id="a">
							<div id="name">쁘띠 샹플랭</div>
							<br>
							<div id="text"><br> 쁘띠 샹플랭 거리</div>
							<div id="text">퀘벡에서 가장 사랑받는 장소 <br> 스키 슬로프를 끼고 있는 럭셔리 호텔!!</div>
							</li>
						</li>
						<li id="b">
							<div id="name">나이아가라 폭포</div>
							<br>
							<div id="text"><br>미국과 캐나다에 걸친 북아메리카에서 가장 큰 폭포</div>
						</li>
						<li id="c">
							<div id="name">퀘벡 페어몬트 르 <br>샤토 프롱트 낙 호텔</div>
							<div id="text"><br>드라마 '도깨비' 촬영지 <br> 유네스코 세계문화유산으로 지정된 <br>올드퀘벡 <br> (어퍼타운 및 로워타운)</div>
							
						</li>
					</ul>
				</div>
			</div>
		
			<div class="i">
				<h1 id="title">아시아 투어, 모두 다른 매력을 가진 여행지들</h1>
				<div class="events1">
					<img id="events" src="<%=request.getContextPath()%>/images/asia.jpg">
					<h1>
						한중일<br> &nbsp; Asia <br> 기획전
					</h1>
				</div>
				<div class="events2">

					<ul id="events_list1">
						<a href="<%=request.getContextPath()%>/detail.do?p=${List_Home[0].getIndexNo()}"><img id="img1" src="<%=request.getContextPath()%>/images/롯데월드.jpg"></a>
						<a href="<%=request.getContextPath()%>/detail.do?p=${List_Home[1].getIndexNo()}"><img id="img2" src="<%=request.getContextPath()%>/images/SKY100 전망대 입장권.jpg"></a>
						<a href="<%=request.getContextPath()%>/detail.do?p=${List_Home[2].getIndexNo()}"><img id="img3" src="<%=request.getContextPath()%>/images/도쿄_조이폴리스.png"></a>
					</ul>

					<ul id="events_list2">
						<li id="a">
							<div id="name">${List_Home[0].getProName()}</div>
							<br>
							<div id="text">${List_Home[0].getText()}</div>
						</li>
						<li id="b">
							<div id="name">${List_Home[1].getProName()}</div>
							<br>
							<div id="text">${List_Home[1].getText()}</div>
						</li>
						<li id="c">
							<div id="name">${List_Home[2].getProName()}</div>
							<br>
							<div id="text">${List_Home[2].getText()}</div>
						</li>
					</ul>
				</div>
			</div>

		</section>
		
		<section class="bottom">
			<p><b>Travel</b>&nbsp;<i class="fas fa-plane "></i></p>
			<p><b>Bit JavaEx - 1조</b></p>
			<p><b>Design by 고현욱 / 김찬호 / 유채현</b></p>
		</section>
	</section>

	<script src="//code.jquery.com/jquery-1.11.0.min.js">
		
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#headers").load("common/header.html"); //헤더 인클루드
			$("#footers").load("Travel/footer.html"); //푸터부분 인클루드
		});
	</script>


	<script>
		$(document).ready(function() {
			$(window).on('scroll', function() {
				if ($(window).scrollTop()) {
					$("header").addClass('bgc');
				} else {
					$("header").removeClass('bgc');
				}
			});
		});
	</script>
	
	<script type="text/javascript">
        function change(color){
            document.body.style.background=color;
        }
   </script>
<jsp:include page="footer.jsp"/>
</body>
</html>