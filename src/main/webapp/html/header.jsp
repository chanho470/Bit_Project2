<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="#">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/header.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/footer.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
    <section class="head">
    	<header class="header">
	    	<nav>
                <ul>
                   <li><a id="a" href="<%=request.getContextPath()%>/booking.do">예약하기</a></li>
                   <li><a id="a" href="<%=request.getContextPath()%>/recommendAll.do">여행지 검색</a></li>
                   <li><a id="z" href="<%=request.getContextPath()%>/homeProc.do" class="logo">Travel</a></li>
                   <li><a id="a" href="<%=request.getContextPath()%>/ProductProc.do">상품 패키지</a></li>
                   <c:choose>
            				<c:when test="${empty userId}">
								<li><a id="a" href="#" onclick="LoginInfo()">장바구니</a></li>		
            				</c:when>
						<c:otherwise>
        					<li><a id="a" href="<%=request.getContextPath()%>/html/taxbill.jsp">장바구니</a></li>		
						</c:otherwise>
        			</c:choose>
                   <c:choose>
            			<c:when test="${empty userId}">
				   			<a class="trigger" id="profile" href="#"><span style="color:black"><i class="fas fa-user-circle fa-4x"></i></span></a>
						</c:when>
					   <c:otherwise>
					   		<a class="trigger" id="profile" href="#"><span style="color:white"><i class="fas fa-user-circle fa-4x"></i></span></a>
					   </c:otherwise>
            	   </c:choose> 
                </ul>
	    	</nav>
    	</header>
    </section>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

    <script>
    	$(document).ready(function(){
    		$(window).on('scroll', function(){
    			if ($(window).scrollTop()) {
                    $("header").addClass('bgc');
    			}else{
                    $("header").removeClass('bgc');
    			}
    		});
    	});
    </script>
	<!-- 팝업 될 레이어 --> 
    <div class="modal"> 
        <div class="modal-content"> 
            <span class="close-button">&times;</span> 
            <c:choose>
            	<c:when test="${empty userId}">
            		<h1 class="title">로그인</h1> 
            		 <form id="form" action="<%=request.getContextPath()%>/loginProc.do" method="POST"> 
              			<label for="login">login</label> 
              			<input id="ID" type="text" name="ID" placeholder="ID" required="required"> 
              			<label></label> 
              			<input id="PassWord" type="password" name="PassWord" placeholder="PassWord" required="required"> 
              			<input id="submit" type="submit"  value="로그인"> 
              			&nbsp;
              			<input id="cancel" type="button"  value="취소">
              			<br><br>
              			<a id="gotoJoin" href="<%=request.getContextPath()%>/html/join.jsp" >회원가입 하러 가기</a>
            		</form>
            	</c:when>
			<c:otherwise>
				<h1 class="aftertitle">${userId}님 안녕하세요!</h1>
				<div class="afterlogin">
					<a id="logout"  href="<%=request.getContextPath()%>/logoutProc.do">로그아웃</a>
	              	<a id="modify" href="<%=request.getContextPath()%>/html/modifyFrm.jsp" >회원 정보수정</a>
	              	<a id="delete" href="<%=request.getContextPath()%>/dropUser.do" >회원탈퇴</a>
	              	<br><br><br>
	              	<c:choose>
	              		<c:when test="${userId eq 'admin'}">
	              		<a id="admin" href="<%=request.getContextPath()%>/html/adminAdd.jsp">상품 추가</a>
	              		<a id="admin" href="<%=request.getContextPath()%>/selectAll.do">상품 삭제</a>
	              		</c:when>
	              	</c:choose>
				</div>
				
			</c:otherwise>
            </c:choose> 
        </div> 
    </div>

    <script type="text/javascript">
        var modal = document.querySelector(".modal"); 
        var trigger = document.querySelector(".trigger"); 
        var closeButton = document.querySelector(".close-button"); 
        var cancelButton = document.querySelector("#cancel");

        /* 로그인 필요 */
        function LoginInfo() {
			alert("로그인이 필요합니다!");
		}
        /* 로그인 필요 */
        
        function toggleModal() { 
            modal.classList.toggle("show-modal"); 
        }

        function windowOnClick(event) { 
            if (event.target === modal) { 
                toggleModal(); 
            } 
        }
        
        /* 회원탈퇴 */
        /*function deleteInfo() {
			if (confirm("정말로 탈퇴하시려고?")) {
				document.addForm.submit();
			} else {
				document.addFrom.reset();
			}
		}

		function modifyInfo() {
			if (confirm("회원정보를 수정하시겠습니까?")) {
				document.addForm.submit();
			} else {
				document.addFrom.reset();
			}
		}*/
		/* 회원탈퇴 */
		
        trigger.addEventListener("click", toggleModal); 
        closeButton.addEventListener("click", toggleModal); 
        cancel.addEventListener("click", toggleModal); 
        window.addEventListener("click", windowOnClick); 
    </script>

</body>
</html>