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
    <link href="/css/join.css" rel="stylesheet" type="text/css" />
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
	 	<div class="mainleft">
	 		<img alt="메인왼쪽그림" src="/img/logo_left1.png" id="mainleft" width="450px" height = "550px">
	 	</div>
	 	<div class="mainright">
		    <div class="container">
			      <img class="logo_instagram" src="/img/logo_text.png" alt="instagram_logo">
			      <input type="text" class="input_login" name="userID" id="userID" placeholder="전화번호, 사용자 이름 또는 이메일">
			      <input type="password" class="input_login" name="userPW" id="userPW" placeholder="비밀번호">
			      <a href="#none"><button id="btn_login" disabled>로그인</button></a>
			      
			      <!--또는  -->
			      <div class="login_horizon">
			      	<div class="br"></div>
			      	<div class="or">또는</div>
			      	<div class="br"></div>
			      </div>
			      <span class="button_forgot">비밀번호를 잊으셨나요?</span>
		    </div>
		    
		    <div class="footer">
		    		<span>계정이 없으신가요? </span> <a href="#"> 가입하기 </a>
		    </div>
	    </div>
	</div>
 </body>
 
 <script>
 
 
 	/*셋인터벌*/
 	$(document).ready(function(){
		
		
		var imgList = ["/img/logo_left1.png", "/img/logo_left2.png", "/img/logo_left3.png"];
		var num = 0;
		var changeImg = function(){
			
			$("#mainleft").attr("src" , imgList[num]);
			num ++;
			if (num == 3) {
				num = 0;
			}
		}
		
		setInterval(changeImg, "3000");
		
	})
 
 </script>
 
 
 
 
</html>