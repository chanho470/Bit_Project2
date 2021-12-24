<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.sql.* , javax.sql.* , javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.global.beans.Product"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 패키지</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
   
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/product.css?after" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>

<section class="page">
    <div class="main">
        <div class="search">
            <h1 id="logo">Merry Christmas</h1>
        </div>
      
        <div class="main2">
            
            <div class="search2">
                <h3 id ="f_title">${userId} 고객님을 위해 추천드려요!</h3>
                <p id="f_sub1">아시아 이 주의 베스트 상품!</p>
          
				<c:forEach var="item" items="${Asia}">
                	<div id="unit">
                		<a href="detail.do?p=${item.indexNo}" role="button"><img id='proimg' src="<%=request.getContextPath() %>/images/${item.img_root}" alt = "이미지 없음" /></a>
                    	<p id="name">${item.proName}</p>
                    	<p id="hash">${item.hashTag}</p>
                 		<p id="money">${item.price}원~</p>
                	</div>
                </c:forEach>
            </div>
            
            <div class="search3">
                <p id="f_sub1">MD 추천!</p>
               
				<c:forEach var="item" items="${Other}">
                	<div id="unit">
                    	<a href="detail.do?p=${item.indexNo}" role="button"><img id='proimg' src="<%=request.getContextPath() %>/images/${item.img_root}" alt = "이미지 없음" /></a>
                    	<p id="name">${item.proName}</p>
                    	<p id="hash">${item.hashTag}</p>
                    	<p id="money">${item.price}원~</p>
                	</div>
                </c:forEach>
                
                
            </div>
            
        </div>
    </div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>