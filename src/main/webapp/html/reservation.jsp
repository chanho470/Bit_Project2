<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 완료 목록</title>
<link href="<%=request.getContextPath()%>/css/reservation.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@ include file="/html/header.jsp" %>
<main class="main">
	<h2 id="title">구매 완료 목록</h2>
    <ul id="cards">
    	<c:forEach var="list" items="${res}" varStatus="indexNo">
			<li class="card" id="card_${indexNo.count}" style="padding-top: calc(${indexNo.count} * 1em);">
	            <div class="card__content">
	                <div>
	                    <h3>${list.getProName()}</h3> 
	                    <p><strong>날짜:</strong> &nbsp;${list.getDate()}</p>
	                    <p><strong>옵션:</strong> &nbsp;${list.getOption()}</p>
	                    <p><strong>가격:</strong> &nbsp;<fmt:formatNumber value="${list.getPrice()}" pattern="#,###"/>원</p>
	                    <p><a href="#구매취소요청${indexNo.count}" class="btn btn--accent" onclick="Alert()">구매취소 요청</a></p>
	                    <br>
	                </div>
	                <figure>
		                <c:choose>
	            			<c:when test="${list.getContent() eq '항공'}">
	            				<img src="<%=request.getContextPath()%>/images/plane.png" alt="항공">
	            			</c:when>
	            			<c:when test="${list.getContent() eq '숙박'}">
	            				<img src="<%=request.getContextPath()%>/images/hotel.jpg" alt="호텔">
	            			</c:when>
	            			<c:when test="${list.getContent() eq '상품'}">
	            				<img src="<%=request.getContextPath()%>/images/pakage.png" alt="패키지 상품">
	            			</c:when>
	            		</c:choose>
	                </figure>
	            </div>
	        </li>
        </c:forEach>
    </ul>
</main>

<script>
function Alert() {
	alert("구매취소가 요청되었습니다.");
	
}
</script>
<%@ include file="/html/footer.jsp" %>
</body>

</html>