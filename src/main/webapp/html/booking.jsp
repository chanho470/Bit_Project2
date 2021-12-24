<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<link href="<%=request.getContextPath()%>/css/booking.css"
	rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			var today = new Date();
			var date = today.getFullYear()+ '-' +(today.getMonth()+1) + '-' + today.getDate();
			$("#date").val(date);
			$("#dateStart").val(date);
			$("#dateEnd").val(date);
			var airArray = setAirArray();
			setAirFrm(airArray);
		});
		
		function setAirArray() {
			var airArray  = []; 
			<c:forEach var="items" items="${airList}">
			 	var airList = new Object();
			 	airList["indexNo"]="${items.indexNo}";
			 	airList["imgurl"]="${items.imgurl}";
			 	airList["toair"]="${items.toair}";
			 	airList["formair"]="${items.formair}";
			 	airList["boardingTime"]="${items.boardingTime}";
			 	airList["departureTime"]="${items.departureTime}";
				airList["classAir"]="${items.classAir}";
			 	airList["price"]=Number("${items.price}");

			 	airArray.push(airList);
			</c:forEach> 
			return airArray;
		}
		
		function setHotelArray() {
			var HotelArray  = []; 
			<c:forEach var="items" items="${hotelList}">
			 	var HotelList = new Object();
			 	HotelList["indexNo"]="${items.indexNo}";
			 	HotelList["imgurl"]="${items.imgurl}";
			 	HotelList["name"]="${items.name}";
			 	HotelList["classHotel"]="${items.classHotel}";
			 	HotelList["checkin"]="${items.checkin}";
			 	HotelList["checkout"]="${items.checkout}";
			 	HotelList["nation"]="${items.nation}";
			 	HotelList["address"]="${items.address}";
			 	HotelList["price"]="${items.price}";
			 	
			 	HotelArray.push(HotelList);
			</c:forEach> 
			return HotelArray;
		}
		
		function setAirFrm(airArray) {
			for(var index=0;index<airArray.length;index++){
				var item=airArray[index];
				$('article').append(function(){
					var output ='<form action="<%=request.getContextPath()%>/addList.do" method="post" class="bookingin">';
					output += '<div class="top"><img src="<%=request.getContextPath()%>/images/'+item.imgurl+'"></div>';
					output += '<div class="middle">';
					output += '<div class="mid1">';
					output += '<div><h3>'+item.toair+'</h3></div>';
					output += '<div><img src="images/air.png"></div>';
					output += '<div><h3>'+item.formair+'</h3></div></div>';
					output += '<hr><div class="mid2">';
					output += '<div class="mid2Side">BOARDING TIME<h3>'+item.boardingTime+'</h3></div>';
					output += '<div class="mid2Center"><h1>-</h1></div>';
					output += '<div class="mid2Side">DEPARTURE TIME<h3>'+item.departureTime+'</h3></div></div></div>';
					output += '<div class="bottom">';
					output += '<div class="bottomdiv">'+item.price+'원</div>';
					output += '<div class="bottomdiv">'+item.classAir+'</div>';
					output += '<div class="bottomdiv">';
					output += '<input type="hidden" value="'+item.indexNo+'" name="indexNo" />';
					output += '<input type="hidden" value="'+$('#num option:selected').val()+'" name="num" />';
					output += '<input type="hidden" value="항공" name="type" />';
					output += '<input id="Apply" type="submit" value="Apply">';
					output += '</div></div></form>';
					return output;
				});
			}
		}
		
		function setHotelFrm(HotelArray) {
			for(var index=0;index<HotelArray.length;index++){
				var item=HotelArray[index];
				$('article').append(function(){
					var output ='<form action="<%=request.getContextPath()%>/addList.do" method="post" class="bookingin">';
					output += '<div class="top"><img src="<%=request.getContextPath()%>/images/'+item.imgurl+'"></div>';
					output += '<div class="middle">';
					output += '<div class="mid1">';
					output += '<div><h3>'+item.name+'</h3></div>';
					output += '<div><h3>'+item.classHotel+'</h3></div>';
					output += '<div><img src="images/hotel.png"></div></div>';
					output += '<hr><div class="mid2">';
					output += '<div class="mid2Side">CHECKIN<h3>'+item.checkin+'</h3></div>';
					output += '<div class="mid2Center"><h1>-</h1></div>';
					output += '<div class="mid2Side">CHECKOUT<h3>'+item.checkout+'</h3></div></div></div>';
					output += '<div class="bottom">';
					output += '<div class="bottomdiv">'+item.price+'원</div>';
					output += '<div class="bottomdiv">'+item.nation+" "+item.address+'</div>';
					output += '<div class="bottomdiv">';
					output += '<input type="hidden" value="'+item.indexNo+'" name="indexNo" />';
					output += '<input type="hidden" value="'+$('#hotelnum option:selected').val()+'" name="num" />';
					output += '<input type="hidden" value="'+$('#dateStart').val()+'" name="dateStart" />';
					output += '<input type="hidden" value="'+$('#dateEnd').val()+'" name="dateEnd" />';
					output += '<input type="hidden" value="숙박" name="type" />';
					output += '<input id="Apply" type="submit" value="Apply">';
					output += '</div></div></form>';
					return output;
				});
			}
			
		}
		
		function removeChild() {
			$('article').children().remove();
		}
		
		function checkAirFrm() {
			var date = $('#date').val().split('-');
			var startArea = $('#startArea option:selected').val();
			var endArea = $('#endArea option:selected').val();
			var num = $('#num option:selected').val();
			var airArray = setAirArray();
			var resultArray = [];
			for(var i = 0; i<airArray.length;i++){
				var item=airArray[i];
				var airdate = setDate(item.boardingTime);
				if(date[0]<=airdate[0]&&date[1]<=airdate[1]&&date[2]<=airdate[2]||date==""){
					if(startArea==item.toair||startArea==""){
						if(endArea==item.formair||endArea==""){
							item.price = item.price*num;
							resultArray.push(item);
						}
					}
				}
			}
			removeChild();
			setAirFrm(resultArray);
		}
		
		function checkHotelFrm() {
			var Area = $('#Area option:selected').val();
			var num = $('#hotelnum option:selected').val();
			var hotelArray = setHotelArray();
			var resultArray = [];
			for(var i = 0; i<hotelArray.length;i++){
				var item=hotelArray[i];
				if(Area==item.nation||Area==""){
					item.price = item.price*Number(num);
					resultArray.push(item);
				}
			}
			removeChild();
			setHotelFrm(resultArray);
		}
		
		function setDate(date) {
			var dateSplit = date.split(' ');
			var dateYear = dateSplit[3];
			var dateMon;
			var dateDay = dateSplit[2];
			switch (dateSplit[1]) {
			case 'JAN.':
				dateMon = 1;
				break;
			case 'FEB.':
				dateMon = 2;
				break;
			case 'MAR.':
				dateMon = 3;
				break;
			case 'APR.':
				dateMon = 4;
				break;
			case 'MAY.':
				dateMon = 5;
				break;
			case 'JUN.':
				dateMon = 6;
				break;
			case 'JUL.':
				dateMon = 7;
				break;
			case 'AUG.':
				dateMon = 8;
				break;
			case 'SEP.':
				dateMon = 9;
				break;
			case 'OCT.':
				dateMon = 10;
				break;
			case 'NOV.':
				dateMon = 11;
				break;
			case 'DEP.':
				dateMon = 12;
				break;	
			default:
				dateMon = 0;
				break;
			}
			
			return [dateYear,dateMon,dateDay];
		}
		
		function checkRadio() {
			if($('input[name=tabmenu]:checked').val()=="숙박"){
				removeChild();
				
				var HotelArray = setHotelArray();
				setHotelFrm(HotelArray);
			}
			else{
				removeChild();
				var airArray = setAirArray();
				setAirFrm(airArray);
			}
		}
	</script>
	<jsp:include page="header.jsp" />
	<section class="main">
		<nav>
			<div class="tabmenu">
				<ul>
					<li id="tab1" class="btnCon"><input type="radio" checked
						name="tabmenu" id="tabmenu1" onclick="checkRadio()" value="항공">
						<label for="tabmenu1">항공</label>
						<div class="tabCon">
							<div>
								가는 날 : <br /> 출발지 : <br /> 도착지 : <br /> 인원 : <br />
							</div>

							<form>
								<input type="date" id="date" /><br />
								<select id="startArea">
									<option value="">선택하세요</option>
									<option value="SEOUL">서울</option>
									<option value="HONGKONG">홍콩</option>
									<option value="TOKYO">도쿄</option>
									<option value="NEWYORK">뉴욕</option>
									<option value="SANFRANCISCO">샌프란시스코</option>
								</select><br />
								<select id="endArea">
									<option value="">선택하세요</option>
									<option value="SEOUL">서울</option>
									<option value="HONGKONG">홍콩</option>
									<option value="TOKYO">도쿄</option>
									<option value="NEWYORK">뉴욕</option>
									<option value="SANFRANCISCO">샌프란시스코</option>
								</select><br /> <select id="num">
									<option value="1">선택하세요</option>
									<option value="1">1명</option>
									<option value="2">2명</option>
									<option value="3">3명</option>
									<option value="4">4명</option>
									<option value="5">5명</option>
									<option value="6">6명</option>
								</select><br /> <input type="button" value="검색하기" onclick="checkAirFrm()">
							</form>
						</div></li>
					<li id="tab2" class="btnCon">
					<input type="radio" name="tabmenu" id="tabmenu2" onclick="checkRadio()" value="숙박">
						<label for="tabmenu2">숙박</label>
						<div class="tabCon">
							<div>
								체크인 : <br /> 체크아웃 : <br /> 위치 : <br /> 인원 : <br />
							</div>

							<form>
								<input type="date" id="dateStart"/><br />
								<input type="date" id="dateEnd"/><br /> <select
									id="Area">
									<option value="">선택하세요</option>
									<option value="대한민국">대한민국</option>
									<option value="일본">일본</option>
									<option value="중국">중국</option>
									<option value="태국">태국</option>
								</select><br />
								<select id="hotelnum">
									<option value="1">선택하세요</option>
									<option value="1">1명</option>
									<option value="2">2명</option>
									<option value="3">3명</option>
									<option value="4">4명</option>
									<option value="5">5명</option>
									<option value="6">6명</option>
								</select><br /> <input type="button" value="검색하기" onclick="checkHotelFrm()">
							</form>
						</div>
					</li>
				</ul>
			</div>
		</nav>
		<article>
		</article>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>