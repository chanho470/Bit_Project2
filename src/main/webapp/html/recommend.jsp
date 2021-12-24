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
 <link href="<%=request.getContextPath()%>/css/recommend.css?after" rel="stylesheet" type="text/css"/>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" 
 integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" 
 crossorigin="anonymous" referrerpolicy="no-referrer" />   
<title>여행지 검색</title>
</head>
<body>
<%@ include file="header.jsp" %>
	<section class="main">
        <nav id="nav">
            <section>
                 <!--리스트에 있는 값들을 리스트로 지정-->
				<c:forEach var="item" items="${list_r}">
                <div id ="d1">
                    <div id ="d1_1"><img src="<%=request.getContextPath() %>/images/${item.img_root}"></div>
                    <div id ="d1_2">
                        <p id="title">${item.proName}</p>
                        <p id="det">${item.text}</p>
                        <p id="hes">${item.hashTag}</p>
                    </div>
                    <div id ="d1_3">
                        <div id="d1_3_1"><p>${item.price}원 ~</p></div>
                        <div id="d1_3_2">
                            <button class="w-btn-outline w-btn-green-outline" type="button" onclick="location.href='detail.do?p=${item.indexNo}'">
                                상품보기
                            </button>
                        </div>
                    </div>    
                </div>
                <br><br>
                </c:forEach>
            </section>
        </nav>
        
        
        <!--  ====================================================================================== -->
        <article >
            <div class="box"><!-- 우측 박스 세계지도 영역-->
                <img src="<%=request.getContextPath() %>/images/wmap.png" class="map"> <!--지도 호출 -->
                
				<form action="<%=request.getContextPath() %>/recommendProc.do?p=${con[1]}" method ="post" autocomplete='off'>
                <div class="search-box"><!--북미-->
                    <input class="search-text" type="text" name="NorthA" placeholder="${count[1]}개의 상품!"><!--입력부분-->
                    <input  class="search-btn" TYPE="IMAGE" src="<%=request.getContextPath() %>/images/snow.png" name="Submit" value="Submit" >
                </div>
 				</form>
 				
 				<form action="<%=request.getContextPath() %>/recommendProc.do?p=${con[2]}" method ="post">
                <div class="search-box2"><!--유럽-->
                    <input class="search-text2" type="text" name="Europe" placeholder="${count[2]}개의 상품!" autocomplete='off'>
                    <input  class="search-btn2" TYPE="IMAGE" src="<%=request.getContextPath() %>/images/snow.png" name="Submit" value="Submit" >
                </div>
                </form>
                
				<form action="<%=request.getContextPath() %>/recommendProc.do?p=${con[0]}" method ="post">
                <div class="search-box3"><!--아시아-->
                    <input class="search-text3" type="text" name="Asia" placeholder="${count[0]}개의 상품!" autocomplete='off' >
                    <input  class="search-btn3" type="image" src="<%=request.getContextPath() %>/images/snow.png" name="Submit" value="Submit"  >
                </div>
                </form>
                
                <form action="<%=request.getContextPath() %>/recommendProc.do?p=${con[3]}" method ="post">
                <div class="search-box4"><!--남미-->
                    <input class="search-text4" type="text" name="SouthA" placeholder="${count[3]}개의 상품!" autocomplete='off'>
                    <input  class="search-btn4" TYPE="IMAGE" src="<%=request.getContextPath() %>/images/snow.png" name="Submit" value="Submit"  >
                </div>
				</form>

				<form action="<%=request.getContextPath() %>/recommendProc.do?p=${con[4]}" method ="post">
                <div class="search-box5"><!--오세아니아-->
                    <input class="search-text5" type="text" name="Oceania" placeholder="${count[4]}개의 상품!" autocomplete='off'>
                    <input  class="search-btn5" TYPE="IMAGE" src="<%=request.getContextPath() %>/images/snow.png" name="Submit" value="Submit"  >
                </div>
				</form>
				
				
				<form action="<%=request.getContextPath() %>/recommendProc.do?p=All" method ="post">
                <div class="search-box6"><!--목록 버튼-->
                	<input class="search-text6" type="text" name="AllList" placeholder="전체검색" autocomplete='off'>
                    <input  class="search-btn6" TYPE="IMAGE" src="<%=request.getContextPath() %>/images/snow.png" name="Submit" value="Submit"  >
                </div> 
				</form>
              
            </div>
        </article>
    </section>
</body>
<%@ include file="footer.jsp" %>

</html>