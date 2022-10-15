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
				      <input type="text" class="input_login" id="uid" placeholder="사용자 아이디" >
				      <span class="available deletedisplay green">사용가능한 아이디 입니다.</span>
				      <span class="unavailable deletedisplay red">4~12자의 영문 소문자, 숫자와 특수기호만 사용 가능합니다.</span>
				      <span class="isduplication deletedisplay red">이미 사용중이거나, 탈퇴한 아이디 입니다.</span>
				</div>
				<div class="bundle">
				      <span class="askspan">비밀번호: </span>
				      <input type="password" class="input_login" id="pwd" placeholder="비밀번호">
				</div>
				<div class="bundle">
				      <span class="askspan">비밀번호 확인: </span>
				      <input type="password" class="input_login" id="repwd" placeholder="비밀번호 확인">
				</div>
				<div class="bundle">
				      <span class="askspan">이메일: </span>
				      <input type="text" class="input_login" id="email" placeholder="email">
				</div>
				<div class="bundle">
				      <span class="askspan">닉네임: </span>
				      <input type="text" class="input_login" name="nickName" id="nickName" placeholder="닉네임">
				</div>
			    <a href="#none"><button id="btn_login" >로그인</button></a>
		    </div>
		    <div class="footer">
		    	<span>계정이 있으신가요? </span> <a href="/main/sign_in_view"> 로그인 하기 </a>
		    </div>
		</div>
</body>
 
 <script>
 	$('#btn_login').on('click', function(){
		
 		const uid = $('#uid').val().trim();
 	 	const pwd = $('#pwd').val().trim();
 	 	const repwd = $('#repwd').val().trim();
 	 	const email = $('#email').val().trim();
 	 	const nickName = $('#nickName').val().trim();
 		
 	 	//비밀번호 검사
 	 	if ( pwd.length == 0) {
 	 		
 	 		alert("비밀번호를 확인하세요");
 	 		$('#pwd').focus();
 	 		return false;
 	 	}
 		
 	 	var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/;
 	 	if (!reg.test(pwd)) {
 	 		alert("비밀번호는 영문+숫자+특수문자 조합으로 8~15자리 사용해야 합니다.");
 	 		$('#pwd').focus();
 	 		return false;
 	 	}
 	 	
 	 	if (pwd != repwd) {
 	 		alert("비밀번호가 맞지 않습니다");
 	 		$('#repwd').focus();
 	 		return false;
 	 	}
 	 
 	 	
 	 	//이메일
 	 	var regEmail = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/;
 	 	if (!regEmail.test(email)) {
 	 		alert("이메일 주소를 확인하세요");
 	 		$('#email').focus();
 	 		return false;
 	 	}
 	 	
 	 	//닉네임은 null 허용이기에 유효성이 없어도 됨.
 		//아이디 유효성 검사 조건 합당하면 ajax 진행
 		if($(".available").hasClass("deletedisplay")) {
 			
 			alert("아이디를 확인하세요.");
 			$(".uid").focus();
 			return false;
 		}
 		
 		//회원 가입 data 
 		$.ajax({
 			//request 
 			type : "POST"
 			,url : "/main/add_user"
 			,data : {"uid" : uid, "pwd" : pwd, "email" : email, "nickName" : nickName}
 			//response
 			,success : function(data) {
 				if(data == "성공") {
 					alert("회원가입 성공하였습니다.")
 	 				location.href = "/main/sign_in_view";
 				}
 			}
 			, error : function(e) {
 				alert("에러")
 			}
 		})
 	})	 
 
 	
 	
 //아이디에 keyup이 될때 함수호출
 $('#uid').on('keyup' , function(){
	
	 var uid = $('#uid').val().trim();
	 var isduplication =  $('.isduplication')
	 var unavailable =  $('.unavailable')
	 var available =  $('.available')
	 
	 //아이디 한글 방지
	 var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; 
	 if(check.test(uid)) {
		 $('#uid').val("");
		 alert("한글은 입력이 불가능합니다.");
		 return false;
	 }
	 
	 //아이디 값 0일떄 경고 멘트 지우기
	 if(uid.length == 0) {
		isduplication.addClass("deletedisplay");
		unavailable.addClass("deletedisplay")
		available.addClass("deletedisplay")
		return false;
	 }
	
	$.ajax({
			//request
			type : "GET"
			,url : "/main/get_id_user"
			, data : {"uid" : uid}
			//response
			,success : function(data) {
				
				//중복일때 ( 리턴값이 true => 즉 아이디 중복임.)
				if(data.isduplication) {
					isduplication.removeClass("deletedisplay")
					unavailable.addClass("deletedisplay")
					available.addClass("deletedisplay")
				}
				//중복이 아닐때 ( 리턴값이 false => 즉 아이디 중복 아님)
				else {
					if (uid.length < 4 || uid.length > 15) {
						isduplication.addClass("deletedisplay")
						unavailable.removeClass("deletedisplay")
						available.addClass("deletedisplay")
					} else {
						isduplication.addClass("deletedisplay")
						unavailable.addClass("deletedisplay")
						available.removeClass("deletedisplay")
					}
				}
			}
			, error : function(e) {
				
			}
			
	})
	 
	 
 })
 		
 		
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 
 </script>

 
 
 
 
</html>