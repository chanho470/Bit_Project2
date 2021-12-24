<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel_admin_Add</title>
<link href="<%=request.getContextPath()%>/css/adminAdd.css"
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
		<h1>상품 추가</h1>
		<!--패키지--------------------------------------------------------------------------------------------  -->
		<form class="frm"
			action="<%=request.getContextPath()%>/updateProduct.do"
			enctype="multipart/form-data" method="post">

			<div id="form_1">
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="상품 이름"
						name="proName" id='proName' required /> <label for="proName"
						class="form__label">상품 이름(상품 패키지)</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="가격"
						name="price" id='price' required /> <label for="price "
						class="form__label">가격</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="대륙"
						name="continent" id='continent' required /> <label
						for="continent" class="form__label">대륙</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="국가"
						name="nation" id='nation' required /> <label for="nation"
						class="form__label">국가 </label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="상품 주소"
						name="address" id='address' required /> <label for="address"
						class="form__label">상품 주소</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="운영시간"
						name="date" id='date' required /> <label for="date "
						class="form__label">운영시간</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="전화번호"
						name="tel" id='tel' required /> <label for="tel"
						class="form__label">전화번호</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="요약 글"
						name="text" id='text' required /> <label for="text"
						class="form__label">요약 글</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="장문"
						name="detailtext" id='detailtext' required /> <label
						for="detailtext" class="form__label">장문</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="해쉬태그"
						name="hashTag" id='hashTag' required /> <label for="hashTag"
						class="form__label">해쉬태그</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="지도 URL"
						name="mapurl" id='mapurl' required /> <label for="mapurl"
						class="form__label">지도 URL</label>
				</div>
				<div class="form__group field">
					<input type="file" class="form__field" name="img_root"
						id='img_root' required> <label for="img_root"
						class="form__label">이미지</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field"
						placeholder="옵셥명:가격/옵션명:가격..." name="options" id='options'
						required /> <label for="options" class="form__label">옵션</label>
				</div>
				<input type="submit" value="추가하기" id="submit">
			</div>
		</form>
		<!--항공--------------------------------------------------------------------------------------------  -->
		<form class="frm" action="<%=request.getContextPath()%>/updateAir.do"
			enctype="multipart/form-data" method="post">
			<div id="form_2" style="display: none;">
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="가격"
						name="price" id='price' required /> <label for="price "
						class="form__label">가격</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="클래스"
						name="class" id='class' required /> <label for="class"
						class="form__label">클래스</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="출발지"
						name="toair" id='toair' required /> <label for="toair"
						class="form__label">출발지</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="도착지"
						name="formair" id='formair' required /> <label for="formair"
						class="form__label">도착지</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="출발시간"
						name="boardingTime" id='boardingTime' required /> <label
						for="boardingTime" class="form__label">출발시간</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="도착시간"
						name="departuretime" id='departuretime' required /> <label
						for="departuretime" class="form__label">도착시간</label>
				</div>

				<div class="form__group field">
					<input type="file" class="form__field" name="img_root"
						id='img_root' required> <label for="img_root"
						class="form__label">이미지</label>
				</div>
				<input type="submit" value="추가하기" id="submit">
			</div>
		</form>
		<!--호텔--------------------------------------------------------------------------------------------  -->
		<form class="frm"
			action="<%=request.getContextPath()%>/updateHotel.do"
			enctype="multipart/form-data" method="post">
			<div id="form_3" style="display: none;">
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="상품 이름"
						name="proName" id='proName' required /> <label for="proName"
						class="form__label">상품 이름(숙박)</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="가격"
						name="price" id='price' required /> <label for="price "
						class="form__label">가격</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="클래스"
						name="class" id='class' required /> <label for="class"
						class="form__label">클래스</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="체크인"
						name="checkin" id='checkin' required /> <label for="checkin"
						class="form__label">체크인</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="체크아웃"
						name="checkout" id='checkout' required /> <label for="checkout"
						class="form__label">체크아웃</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="국가"
						name="nation" id='nation' required /> <label for="nation"
						class="form__label">국가</label>
				</div>
				<div class="form__group field">
					<input type="input" class="form__field" placeholder="주소"
						name="address" id='address' required /> <label for="address"
						class="form__label">주소</label>
				</div>
				<div class="form__group field">
					<input type="file" class="form__field" name="img_root"
						id='img_root' required> <label for="img_root"
						class="form__label">이미지</label>
				</div>
				<input type="submit" value="추가하기" id="submit">
			</div>

		</form>

	</div>
</body>
<jsp:include page="footer.jsp" />
</html>