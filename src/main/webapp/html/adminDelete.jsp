<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>.
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel_admin_Delete</title>
<link href="<%=request.getContextPath()%>/css/adminDelete.css"
	rel="stylesheet" type="text/css" />
<jsp:include page="header.jsp" />
</head>
<body>
	<script>
		function chooseForm(radioName) {
			var radios = document.getElementsByName(radioName);
			for (var i = 0, length = radios.length; i < length; i++) {
				document.getElementById('form_' + radios[i].value).style.display = 'none';
				if (radios[i].checked) {
					document.getElementById('form_' + radios[i].value).style.display = 'block';
				}
			}
		}
	</script>

	<form>
		<div class="radio-group">
			<input type="radio" id="option-one" name="selector" value="1"
				onclick="chooseForm(this.name)"><label id="label"
				for="option-one">상품 패키지</label> <input type="radio" id="option-two"
				name="selector" value="2" onclick="chooseForm(this.name)"><label
				id="label" for="option-two">항공</label> <input type="radio"
				id="option-three" name="selector" value="3"
				onclick="chooseForm(this.name)"><label id="label"
				for="option-three">숙박</label>
		</div>
	</form>

	<div class="container">
		<h1>상품 삭제</h1>
		<div id="form_1">
			<form class="frm" action="<%=request.getContextPath()%>/deleteProduct.do"
				method="post">
				<c:forEach var="pro" items="${proList}">
					<div class="list">
						<input type="checkbox" name="checkbox1" id="checkbox"
							value="${pro.indexNo}" onclick="Prolist(this.form);">
						${pro.proName }
					</div>
				</c:forEach>
				<input type="hidden" value="" name="list">
				<input type="submit" value="삭제하기" id="deleteButton">
			</form>
		</div>
		<div id="form_2" style="display: none;">
			<form class="frm" action="<%=request.getContextPath()%>/deleteAir.do"
				method="post">
				<c:forEach var="air" items="${airList}">
					<div class="list">
						<input type="checkbox" name="checkbox2" id="checkbox"
							value="${air.indexNo }" onclick="Airlist(this.form);">
						${air.toair }(${air.boardingTime }) - ${air.formair }(${air.departureTime })<br>
						${air.classAir }
					</div>
				</c:forEach>
				<input type="hidden" value="" name="list">
				<input type="submit" value="삭제하기" id="deleteButton">
			</form>

		</div>
		<div id="form_3" style="display: none;">
			<form class="frm" action="<%=request.getContextPath()%>/deleteHotel.do"
				method="post">
				<c:forEach var="hotel" items="${hotelList}">
					<div class="list">
						<input type="checkbox" name="checkbox3" id="checkbox"
							value="${hotel.indexNo }" onclick="Hotellist(this.form);">
						${hotel.name }(${hotel.classHotel})
					</div>
				</c:forEach>
				<input type="hidden" value="" name="list">
				<input type="submit" value="삭제하기" id="deleteButton">
			</form>
		</div>
	</div>

	<script>
		let pro = '';
		let air = '';
		let hotel = '';
		function Prolist(frm) {
			pro = '';
			$("input:checkbox[name=checkbox1]:checked").each(function(){
				pro=pro+this.value+",";
			});
			frm.list.value = pro;
		}
		function Airlist(frm) {
			air = '';
			$("input:checkbox[name=checkbox2]:checked").each(function(){
				air=air+this.value+",";
			});
			frm.list.value = air;
		}
		function Hotellist(frm) {
			hotel = '';
			$("input:checkbox[name=checkbox3]:checked").each(function(){
				hotel=hotel+this.value+",";
			});
			frm.list.value = hotel;
		}		
	</script>


</body>
<jsp:include page="footer.jsp" />
</html>