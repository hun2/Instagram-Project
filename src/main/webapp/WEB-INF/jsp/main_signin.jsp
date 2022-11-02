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
    <link href="/css/signin.css" rel="stylesheet" type="text/css" />
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
			      <input type="text" class="input_login"  id="uid" placeholder="사용자 아이디">
			      <input type="password" class="input_login" id="pwd" placeholder="비밀번호">
			      <a href="#none"><button id="btn_login">로그인</button></a>
			      
			      <!--또는  -->
			      <div class="login_horizon">
			      	<div class="br"></div>
			      	<div class="or">또는</div>
			      	<div class="br"></div>
			      </div>
			      <span class="button_forgot">비밀번호를 잊으셨나요?</span>
		    </div>
		    
		    <div class="footer">
		    		<span>계정이 없으신가요? </span> <a href="/main/sign-up-view"> 가입하기 </a>
		    </div>
	    </div>
	</div>
	<div class="bottom">
	    	<span class="bottomSpan" onclick="window.open('https://about.meta.com')">Meta</span>
	    	<span class="bottomSpan" onclick="window.open('https://about.instagram.com')">소개</span>
	    	<span class="bottomSpan" onclick="window.open('https://about.instagram.com/blog')">블로그</span>
	    	<span class="bottomSpan" onclick="window.open('https://www.instagram.com/about/jobs/')">채용정보</span>
	    	<span class="bottomSpan" onclick="window.open('https://help.instagram.com/')">도움말</span>
	    	<span class="bottomSpan" onclick="window.open('https://developers.facebook.com/docs/instagram')">API</span>
	    	<span class="bottomSpan" onclick="window.open('https://www.instagram.com/legal/privacy/')">개인정보처리방침</span>
	    	<span class="bottomSpan" onclick="window.open('https://www.instagram.com/legal/terms/')">약관</span>
	    	<span class="bottomSpan" onclick="window.open('https://www.instagram.com/directory/profiles/')">인기계정</span>
	    	<span class="bottomSpan" onclick="window.open('https://www.instagram.com/directory/hashtags/')">해시태그</span>
	    	<span class="bottomSpan" onclick="window.open('https://www.instagram.com/explore/locations/')">위치</span>
	    	<span class="bottomSpan" onclick="window.open('https://www.instagram.com/web/lite/')">Instagram Lite</span>
	    	<span class="bottomSpan" onclick="window.open('https://www.facebook.com/help/instagram/261704639352628')">연락처 업로드& 비 사용자</span>
	</div>
	<div class="bottom2">
			<span class="bottomSpan" onclick="window.open('https://www.instagram.com/topics/dance-and-performance/')">댄스</span>
			<span class="bottomSpan" onclick="window.open('https://www.instagram.com/topics/food-and-drink/')">식음료</span>
			<span class="bottomSpan" onclick="window.open('https://www.instagram.com/topics/home-and-garden/')">집 및 정원</span>
			<span class="bottomSpan" onclick="window.open('https://www.instagram.com/topics/music/')">음악</span>
			<span class="bottomSpan" onclick="window.open('https://www.instagram.com/topics/visual-arts/')">시각예술</span>
	</div>
	<div class="bottom3">
			<span class="bottomSpan">© 2022 Hunstagram from Instagram</span>
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
	
	//비밀번호입력후 엔터 버튼 누르면 click 함수 실행
	var pwd = document.getElementById("pwd");
 	pwd.addEventListener("keyup", function(event){
		if(event.keyCode === 13) {
			event.preventDefault();
 			$("#btn_login").click();
 		}
 	});
	
	
	//click 버튼시 함수 실행
	$("#btn_login").on("click", function(){
		var uid =  $("#uid").val().trim();
		var pwd =  $("#pwd").val().trim();
		//아이디 유효성
		if (uid.length == 0) {
			alert("아이디를 확인하세요");
			$("#uid").focus();
			return false;
		}
		if (pwd.length == 0) {
			alert("비밀번호를 확인하세요");
			$("#pwd").focus();
			return false;
		}
		$.ajax({
			//response
			type : "GET"
			, url : "/main/sign-success"
			, data : {"uid" : uid, "pwd" : pwd}
			//request
			, success : function(result) {
				//중복일때 => 즉 id 또는 비밀번호가 맞지않음 
				if (result == "") {
					
					alert("아이디 또는 비밀번호가 맞지 않습니다");
					return false;
					
				}
				//중복이 아닐때 => 즉 아이디랑 비밀번호가 맞음 board 페이지로 이동
				else {
					alert("김기훈님은 저희와 함께 갑시다!!!")
					location.href="/main/board-view"
				}
			}
			, error : function(e) {
				alert("에러");
			}
		})
	})
 </script>
 
 
 
 
</html>