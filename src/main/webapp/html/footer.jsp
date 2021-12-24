<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/footer.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />   

</head>
<body>
	<footer>
		<c:choose>
            <c:when test="${empty userId}">
				<a href="#" onclick="LoginInfo()"><span style="color:white"><i class="fas fa-clipboard-list fa-3x"></i></span></a>		
            </c:when>
			<c:otherwise>
        		<a href="<%=request.getContextPath()%>/reservation.do"><span style="color:white"><i class="fas fa-clipboard-list fa-3x"></i></span></a>		
			</c:otherwise>
        </c:choose>
	
     	<a href="https://www.facebook.com"><span style="color:white"><i class="fab fa-facebook-square fa-3x"></i></span></a>
     	<a href="https://www.instagram.com"><span style="color:white"><i class="fab fa-instagram fa-3x"></i></span></a>
     	<a href="https://github.com"><span style="color:white"><i class="fab fa-github fa-3x"></i></span></a>
    </footer>
    
    <script type="text/javascript">
    	function LoginInfo() {
			alert("로그인이 필요합니다!");
		}
    </script>
    
</body>
</html>