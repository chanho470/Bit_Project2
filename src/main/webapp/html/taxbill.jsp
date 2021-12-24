<%@page import="org.global.beans.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel_taxbill</title>
<link href="<%=request.getContextPath()%>/css/taxbill.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

	<jsp:include page="header.jsp" />
	<section class="page">
		<form name='form'>
			<section class="taxbill">
				<h1 id="smallTitle">담은 상품</h1>

				<c:if test="${not empty CartList }">
					<c:forEach var="cart" items="${CartList}">
						<div class="stack">
							<div id="name">
								<h6>상품이름</h6>
								<h2>
									<b>${cart.proName}</b>
								</h2>
							</div>
							<br>
							<div id="Date">
								<h6>날짜</h6>
								<h2>
									<b>${cart.date} </b>
								</h2>
							</div>
							<br>
							<div id="headcount">
								<h6>옵션</h6>
								<h2>
									<b>${cart.option}</b>
								</h2>
							</div>
							<br>
							<div id="price">
								<h6>상품 가격</h6>
								<h2>
									<b>₩ ${cart.price}원 </b>
								</h2>
							</div>
							<br>
							<div id="check">
								<input type="checkbox" name="checkbox" id="checkbox"
									value="${cart.price}" onclick="itemSum(this.form);">
							</div>
							<hr id="line">
							<br> <br> <br>
						</div>
					</c:forEach>
				</c:if>

			</section>
			<section class="result">
				<div class="finall">
					<h1 id="f">
						<b>최종 결제 금액</b>
					</h1>
					<input id="total" value="₩--" name="total_sum" type="text"
						size="20" readonly>
				</div>
				<br> <br> 
				<c:choose>
            			<c:when test="${empty userId}">
				   			<a id="orderButton"href="#" onclick="error()">주문하기</a>
						</c:when>
					   <c:otherwise>
					   		<a id="orderButton"href="<%=request.getContextPath()%>/orderComplete.do">주문하기</a>
					   </c:otherwise>
				</c:choose>
			</section>
		</form>
	</section>
	<jsp:include page="footer.jsp" />

	<script>
	   function error(){
		   alert("로그인 안함 ㅋㅋ");
	   }
	
		function itemSum(frm) {
			var sum = 0;
			$("input:checkbox[name=checkbox]:checked").each(function(){
				debugger;
				sum += parseInt(this.value);
			});
			frm.total_sum.value = '₩'+sum +'원';
		}
	</script>
</body>
<jsp:include page="footer.jsp" />
</html>