<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세부정보</title>
<link href="<%=request.getContextPath()%>/css/detail.css"
	rel="stylesheet" type="text/css" />

</head>
<body>
	<script type="text/javascript">
		function chageSelect() {
			var selectList = document.getElementById("selectItem");
			var selectNum = Number(document.getElementById("selectNum").value);
			var selectPrice = Number(selectList.options[selectList.selectedIndex].value.split(":")[1]);
			var result = selectPrice*selectNum;
			
			if(isNaN(result)||result==0){
				result="옵션을 선택해 주세요"
			}
			document.getElementById('priceItem').value = result;
			
		}
		function checkForm(){
			var valueDate = document.getElementById('date').value;
			var priceItem = document.getElementById('priceItem').value;
			
			if(!valueDate||!Number(priceItem)){
				alert("내용을 입력해 주세요");
				return;
			}
			document.getElementById('tabconForm').submit();
		}
	</script>
	<jsp:include page="header.jsp" />
	<section>
		<nav class="detailNav">
			<div class="tabCon">
				<form class="tabconForm" action="addList.do" method="post" id= "tabconForm">
					날짜 : <input type="date" name="date" id = 'date'/><br />
					옵션 : <select name="option1" onchange="chageSelect()" id="selectItem">
						<option value="">select item</option>
						<c:set var="options" value="${fn:split(pro.option,'/')}" />
						<c:forEach var="option" items="${options}">
							<c:set var="item" value="${fn:split(option,':')}" />
							<option value="${option}">${item[0]}</option>
							
						</c:forEach>
					</select><br /> 인원 : <select name="option2" id="selectNum" onchange="chageSelect()">
						<option value="0">select item</option>
						<option value="1">1 명</option>
						<option value="2">2 명</option>
						<option value="3">3 명</option>
						<option value="4">4 명</option>
						<option value="5">5 명</option>
						<option value="6">6 명</option>
					</select><br>
					가격 : 
					<input type="text" id="priceItem" readonly="readonly" value="" name= "price">
					<input type="hidden" name="proName" value="${pro.proName}">
					<input type="hidden" name="type" value="상품">
					<input type="button" value="장바구니" class="test" onclick="checkForm()">
				</form>
				
			</div>

		</nav>
		<article class="detailArt">
			<section>

				<div class="index-num">${pro.indexNo}</div>
				<h2 id="title">${pro.proName }</h2>

				<div class="img">
					<img src="<%=request.getContextPath() %>/images/${pro.img_root}" class="pic">
				</div>

				<div class="tag">
					<label>Tags</label>
					<ul>
						<li><a href="#">${pro.hashTag }</a></li>
					</ul>
				</div>
				<div class="description">
					<p>${pro.text }</p>
					<p>${pro.detailtext }</p>
				</div>
				<div class="info">
					<p>
						<strong>주소: </strong>${pro.address }
					</p>
					<p>
						<strong>운영 시간: </strong>${pro.date }
					</p>
					<p>
						<strong>전화: </strong>${pro.tel }
					</p>
				</div>
				<div class="map">
					<p style="padding: 0 20px;">
						<b>지도</b>
					</p>
					<iframe src='${pro.mapurl}' width="400" height="300"
						style="border: 0;" allowfullscreen="" loading="lazy"></iframe>
				</div>
				<div class="button-wrap">
					<a class="button" href="#" target="_blank">주변 숙박 시설 보기</a>
				</div>

			</section>
		</article>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>