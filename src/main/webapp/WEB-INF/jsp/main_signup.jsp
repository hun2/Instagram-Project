<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>Instagram</title>
    <link href="/css/signup.css" rel="stylesheet" type="text/css" />
    <link href="/css/common.css" rel="stylesheet" type="text/css" />
    
    <!-- favicon -->
    <link rel="icon" href="/img/favicon.png">
    <link rel="instagram-icon" href="/img/favicon.png">
    
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	

</head>
 <body>
 		<div class="main">
		    <div class="container">
				<img class="logo_instagram" src="/img/logo_text.png" alt="instagram_logo">
				<div class="bundle">
				      <span class="askspan">사용자 명: </span>
				      <input type="text" class="input_login" name="uid" id="uid" placeholder="사용자 아이디">
				</div>
				<div class="bundle">
				      <span class="askspan">비밀번호: </span>
				      <input type="password" class="input_login" name="pwd" id="pwd" placeholder="비밀번호">
				</div>
				<div class="bundle">
				      <span class="askspan">비밀번호 확인: </span>
				      <input type="password" class="input_login" name="pwd" id="pwd" placeholder="비밀번호 확인">
				</div>
				<div class="bundle">
				      <span class="askspan">이메일: </span>
				      <input type="text" class="input_login" name="email" id="email" placeholder="email">
				</div>
				<div class="bundle">
				      <span class="askspan">닉네임: </span>
				      <input type="text" class="input_login" name="nickname" id="nickname" placeholder="닉네임">
				</div>
			    <a href="#none"><button id="btn_login" disabled>로그인</button></a>
		    </div>
		    <div class="footer">
		    	<span>계정이 있으신가요? </span> <a href="/main/sign_in_view"> 로그인 하기 </a>
		    </div>
		</div>
</body>
 

 
 
 
 
</html>