<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
<style>
.container{
	text-align: center;
	margin-top: 15%;
}
.container > h1{
	font-size: 60px;
}
.container > p > a{
	text-decoration-line: none;
    border: double white;
    color: white;
    font-size: 30px;
    background-color: rgb(47,82,148);
    border-radius: 10px;
    padding: 10px;
    box-shadow: 0 4px 4px 0 rgba(0,0,0,0.3);
}

</style>
</head>
<body>
<jsp:include page="header.jsp"/>



<div class="container">
	<h1>상품 주문이 완료 되었습니다</h1>
	<br><br>
	<p><a href="<%=request.getContextPath()%>/homeProc.do">홈 화면으로 돌아가기</a></p>
</div>




<jsp:include page="footer.jsp"/>
</body>
</html>