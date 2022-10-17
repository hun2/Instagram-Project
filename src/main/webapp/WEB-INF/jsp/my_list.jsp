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
 <link href="/css/my_list.css" rel="stylesheet" type="text/css" />
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
            <img src="/img/profile.png" class="icon" alt="" id="profile">
        </div>
    </div>
</nav>
<section>
	<header class="profileheader">
		<div class="profileleft">
			<div class="profile-pic"><img src="/img/park.jpg" alt=""></div>
		</div>
		<div class="profileright">
			<div class="profilename">
				test아이디
				<img src="/img/set.png" class="icon2" width="17px" height="17px">
			</div>
			<div class="profilecontent">
				<div class="profilecontentname">게시글</div> <span class="profilecontentcount"> 3 </span>
				<div class="profilecontentname">팔로우</div> <span class="profilecontentcount"> 5 </span>
				<div class="profilecontentname">팔로우</div> <span class="profilecontentcount"> 7 </span>
			</div>
			<div class="profilenickname">
				<div>여기는 닉네임이 나오는 곳</div>
			</div>
		</div>
	</header>
	<aside class="bodycontent">
		<div class="bodycontainer"> 
			<div class="item">
				<img src="/img/iu.jpg" class="bodyimg">
			</div>
			<div class="item">
				<img src="/img/iu.jpg" class="bodyimg">
			</div>
			<div class="item">
				<img src="/img/iu.jpg" class="bodyimg">
			</div>
			<div class="item">
				<img src="/img/iu.jpg" class="bodyimg">
			</div>
		</div>
	</aside>
</section>

<!--상단 바 사진추가  -->
<div class="modal">
      <div class="modal_body">
      	  <span id="upload">게시글 업로드</span>
      	  <div class="uploadinfo">
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

<!--개인정보 수정  -->
<div class="modal2">
      <div class="modal_body">
      	  <span id="upload">개인정보수정</span>
      	  <div class="uploadinfo">
            <div class="uploadprofile-pic"><img src="/img/park.jpg" alt=""></div>
            <p class="uploadusername">text</p>
          </div>
      	  <div class="uploadimg">
	      	<img src="/img/no.png" id="uploadimg">
	      </div>
	      <div class="uploadfile">
		      <input type="file" id="uploadbutton" value="파일선택">
	      </div>
	      <div>닉네임</div>      
	      <textarea class="input_login" id="content"></textarea>
	      <div class="addbutton">
	      <a href="#none"><button id="btn_login" >개인정보 수정</button></a>
	      </div>
      </div>
</div>


</body>
<script type="text/javascript">

	const body = document.querySelector('body');
	const modal = document.querySelector('.modal');
	const modal2 = document.querySelector('.modal2');
	const addPopup = document.querySelector('.add');
	const icon2 = document.querySelector('.icon2');
	
	addPopup.addEventListener('click', () => {
		modal.classList.toggle('show');
		 if (modal.classList.contains('show')) {
	          body.style.overflow = 'hidden';
	     }
	});
	icon2.addEventListener('click', () => {
		modal2.classList.toggle('show');
		 if (modal2.classList.contains('show')) {
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
	
	modal2.addEventListener('click', (event) => {
	    if (event.target === modal2) {
	      modal2.classList.toggle('show');
	    }
	    if (!modal2.classList.contains('show')) {
	        body.style.overflow = 'auto';
	     }
	});
	
	
	



</script>
</html>