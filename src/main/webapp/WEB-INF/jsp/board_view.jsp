<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Instagram</title>
 <link href="/css/board_view.css" rel="stylesheet" type="text/css" />
 <link href="/css/common.css" rel="stylesheet" type="text/css" />
<!-- favicon -->
<link rel="icon" href="/img/favicon.png">
<link rel="instagram-icon" href="/img/favicon.png">

<!--Jquery  -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	
</head>
<body>

<nav class="navbar">
    <div class="nav-wrapper">
        <img src="/img/logo_text.png" class="brand-img" alt="상단바 훈스타그램 로고" onclick="location.href='/main/board_view'">
        <input type="text" class="search-box" placeholder="search">
        <div class="nav-items">
            <img src="/img/home.png" class="icon" alt="" id="home" onclick="location.href='/main/board_view'">
            <img src="/img/send.png" class="icon" alt="" id="send">
            <img src="/img/add.png" class="add icon" alt="" >
            <img src="/img/explore.png" class="icon" alt="" id="explore">
            <img src="/img/profile.png" class="icon" alt="" id="profile" onclick="location.href='/main/my_list'">
        </div>
    </div>
</nav>
<section class="main">
    <div class="wrapper">
        <div class="left-col">
           <div class="post">
                <div class="info">
                    <div class="user">
                        <div class="profile-pic"><img src="/img/park.jpg" alt=""></div>
                        <p class="username">text</p>
                    </div>
                    <img src="/img/option.png" class="options" alt="">
                </div>
                <img src="/img/main.jpg" class="post-image" alt="">
                <div class="post-content">
                    <div class="reaction-wrapper">
                        <img src="/img/like.png" class="icon" alt="">
                        <img src="/img/comment.PNG" class="icon" alt="">
                        <img src="/img/send.PNG" class="icon" alt="">
                        <img src="/img/save.PNG" class="save icon" alt="">
                    </div>
                    <p class="likes">1,012 likes</p>
                    <p class="description"><span>username </span> 여기는 게시글의 content 내용입니다.</p>
                </div>
            </div>
           <div class="post">
                <div class="info">
                    <div class="user">
                        <div class="profile-pic"><img src="/img/park.jpg" alt=""></div>
                        <p class="username">test_Account</p>
                    </div>
                    <img src="/img/option.png" class="options" alt="">
                </div>
                <img src="/img/main.jpg" class="post-image" alt="">
                <div class="post-content">
                    <div class="reaction-wrapper">
                        <img src="/img/like.png" class="icon" alt="">
                        <img src="/img/comment.PNG" class="icon" alt="">
                        <img src="/img/send.PNG" class="icon" alt="">
                        <img src="/img/save.PNG" class="save icon" alt="">
                    </div>
                    <p class="likes">1,012 likes</p>
                    <p class="description"><span>username </span> 여기는 게시글의 content 내용입니다.</p>
                </div>
            </div>
        </div>
		<div class="right-col">
            <div class="profile-card">
                <div class="profile-pic">
                    <img src="/img/park.jpg" alt="">
                </div>
                <div>
                    <p class="username">test 계정</p>
                </div>
                <button class="action-btn">switch</button>
            </div>
            <p class="suggestion-text">회원님을 위한 추천</p>
            <div class="profile-card">
                <div class="profile-pic">
                    <img src="/img/park.jpg" alt="">
                </div>
                <div>
                    <p class="username">test 계정1</p>
                    <p class="sub-text">user외 4명이 팔로우합니다.</p>
                </div>
                <button class="action-btn">follow</button>
            </div>
            <div class="profile-card">
                <div class="profile-pic">
                    <img src="/img/park.jpg" alt="">
                </div>
                <div>
                    <p class="username">test 계정2</p>
                    <p class="sub-text">user외 4명이 팔로우합니다.</p>
                </div>
                <button class="action-btn">follow</button>
            </div>
            <div class="profile-card">
                <div class="profile-pic">
                    <img src="/img/park.jpg" alt="">
                </div>
                <div>
                    <p class="username">test 계정3</p>
                    <p class="sub-text">user외 4명이 팔로우합니다.</p>
                </div>
                <button class="action-btn">follow</button>
            </div>
            <div class="profile-card">
                <div class="profile-pic">
                    <img src="/img/park.jpg" alt="">
                </div>
                <div>
                    <p class="username">test 계정4</p>
                    <p class="sub-text">user외 4명이 팔로우합니다.</p>
                </div>
                <button class="action-btn">follow</button>
            </div>
            <div class="profile-card">
                <div class="profile-pic">
                    <img src="/img/park.jpg" alt="">
                </div>
                <div>
                    <p class="username">test 계정5</p>
                    <p class="sub-text">user외 4명이 팔로우합니다.</p>
                </div>
                <button class="action-btn">follow</button>
            </div>
        </div>    
    </div>
</section>

<div class="modal">
      <div class="modal_body">
      	  <span id="upload">게시글 업로드</span>
      	  <div class="uploadinfo">
             <!-- <div class="user">
           	 	<div class="profile-pic"><img src="/img/park.jpg" alt=""></div>
          	 	<p class="username">text</p>
             </div> -->
            <div class="uploadprofile-pic"><img src="/img/park.jpg" alt=""></div>
            <p class="uploadusername">text</p>
          </div>
      	  <div class="uploadimg">
	      	<img src="/img/no.png" id="uploadimg">
	      </div>
	      <div class="uploadfile">
		      <input type="file" id="uploadbutton" value="파일선택">
	      </div>      
	      <textarea class="input_login" id="content"></textarea>
	      <div class="addbutton">
	      <a href="#none"><button id="btn_login" >게시글 추가</button></a>
	      </div>
      </div>
</div>


</body>
<script type="text/javascript">
	
	
	//게시글 추가 시 모달창 팝업
	const body = document.querySelector('body');
	const modal = document.querySelector('.modal');
	const addPopup = document.querySelector('.add');
	addPopup.addEventListener('click', () => {
		modal.classList.toggle('show');
		 if (modal.classList.contains('show')) {
	          body.style.overflow = 'hidden';
	     }
    });
	
	modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');
        }
        if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
         }
    });
	

</script>
</html>