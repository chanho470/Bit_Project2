<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="<%=request.getContextPath()%>/css/join.css" rel="stylesheet" type="text/css"/>
<%@ include file="./header.jsp" %>

</head>
<body>
<div class="container">
	<h1>회원가입</h1>
	<form class="frm" action="<%=request.getContextPath()%>/joinUser.do">
	    <div class="form__group field">
	        <input type="input" class="form__field" placeholder="이름" name="name" id='name' required />
	        <label for="name" class="form__label">이름</label>
	    </div>
	    <div class="form__group field">
	        <input type="input" class="form__field" placeholder="ID" name="userId" id='userId' required />
	        <label for="userId " class="form__label">ID</label>
	    </div>
	    <div class="form__group field">
	        <input type="password" class="form__field" placeholder="Password" name="userPwd" id='userPwd' required />
	        <label for="userPwd" class="form__label">Password</label>
	    </div>
	    <div class="form__group field">
	        <input type="input" class="form__field" placeholder="Email" name="email" id='email' required />
	        <label for="email" class="form__label">Email </label>
	    </div>
	    <div class="form__group field">
	        <input type="input" class="form__field" placeholder="010-0000-0000" name="phoneNo" id='phoneNo' required />
	        <label for="phoneNo" class="form__label">전화번호</label>
	    </div>
	    <div class="form__group field">
	        <input type="input" class="form__field" placeholder="주소" name="address" id='address ' required />
	        <label for="address " class="form__label">주소</label>
	    </div>
	    <input type="submit" value="가입하기" id="submit">
	</form>
</div>
</body>
<%@ include file="./footer.jsp" %>
</html>