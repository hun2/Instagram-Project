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
<link href="/css/other_list.css" rel="stylesheet" type="text/css" />
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<!-- favicon -->
<link rel="icon" href="/img/favicon.png">
<link rel="instagram-icon" href="/img/favicon.png">

<!--Jquery  -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<body>

	<nav class="navbar">
		<div class="nav-wrapper">
			<img src="/img/logo_text.png" class="brand-img" alt="상단바 훈스타그램 로고" onclick="location.href='/main/board-view'">
			<input type="text" class="search-box" placeholder="search">
			<div class="nav-items">
				<img src="/img/home.png" class="icon" alt="" id="home" 	onclick="location.href='/main/board-view'"> 
				<img src="/img/send.png" class="icon" alt="" id="send"> 
				<img src="/img/add.png" class="add icon" alt=""> 
				<img src="/img/explore.png" class="icon" alt="" id="explore">
				<div class="dropdown">
					<img src="/img/profile.png" class="icon" alt="" id="profile">
					<div class="dropdown-submenu">
						<a href="#none" onclick="location.href='/main/logout'">로그아웃</a>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<section>
		<header class="profileheader">
			<div class="profileleft">
				<c:if test="${userList.profilePhoto == null }">
					<div class="profile-pic">
						<img src="/img/no.png" alt="">
					</div>
				</c:if>
				<c:if test="${userList.profilePhoto != null }">
					<div class="profile-pic">
						<img src="${userList.profilePhoto}" alt="">
					</div>
				</c:if>
			</div>
			<div class="profileright">
				<div class="profilename">
					<span>${userList.uid}</span> 
					<!--팔로우 일때는 ed 사진  -->
					<c:if test="${check > 0}">
						<img src="/img/followed.png" class="icon2" width="100px" height="30px">
					</c:if>
					<!-- 팔로우 아닐때는 ow 사진  -->
					<c:if test="${check == 0 }">
						<img src="/img/follow.png" class="icon2" width="100px" height="30px">
					</c:if>
				</div>
				<div class="profilecontent">
					<div class="profilecontentname">게시글</div>
					<span class="profilecontentcount"> ${boardCount} </span>
					<div class="profilecontentname">팔로우</div>
					<span class="profilecontentcount"> ${followCount} </span>
					<div class="profilecontentname">팔로우</div>
					<span class="profilecontentcount"> ${followedCount} </span>
				</div>
				<div class="profilenickname">
					<div>${userList.nickName}</div>
				</div>
			</div>
		</header>
		<aside class="bodycontent">
			<div class="bodycontainer">
				<c:forEach items="${boardList}" var="board">
					<div class="item">
						<img src="${board.boardImage}" class="bodyimg">
					</div>
				</c:forEach>
			</div>
		</aside>
	</section>


</body>
<script type="text/javascript">
	
	
	

	//상단바 내정보 클릭시 프로필 / 로그아웃 나오게 하는 click 이벤트
	$('.dropdown').on('click', function(){
		var display = $('.dropdown-submenu').css('display');
		if (display == 'none' ) {
			$('.dropdown-submenu').css('display', 'block');
		} else {
			$('.dropdown-submenu').css('display', 'none');
		}
	})
	
	
	
	
	
	//팔로우 버튼 클릭시 이벤트 
	$('.icon2').on('click', function(){
		
		
		var uid  = $(this).prev().text();
		var src = $(this).attr('src')
		var follow = '/img/follow.png'
		var followed = '/img/followed.png'
		
			
		if ( $(this).attr('src') === followed ) {
			
			//만약 팔로워가 되어 있다면 클릭시 => 삭제가 되야함
			$.ajax ({
				type : "DELETE"
				, url : '/main/follow-delete'
				, data : {'uid' : uid}
				,success : function(result) {
					if ( result.code == 100) {
						alert("팔로우 해제가 완료 되었습니다");
						location.reload();
					} else if (result.code == 300) {
						alert("로그인을 해주세요");
						location.href="/main/sign-in-view";
					}
					else {
						alert("팔로우 에러 입니다.");
						
					}
				}
				,error : function(e) {
					alert("관리자에게 문의해주세요");
				}
			}) 
			
			
		} else {
			
			//만약 팔로우가 안되어 있다면 클릭시 => 추가가 되야함.
			$.ajax({
				
				type: "POST"
				, url : "/main/follow"
				, data : {'uid' : uid}
				, success : function(result) {
					if ( result.code == 100) {
						alert("팔로우 추가가 완료 되었습니다");
						location.reload();
					} else if (result.code == 300) {
						alert("로그인을 해주세요");
						location.href="/main/sign-in-view";
					}
					else {
						alert("팔로우 에러 입니다.");
					}
				}
				, error : function(e) {
					alert("관리자에게 문의해주세요");
				}
			})
		}
		
		
		//ajax 끝난 후 사진변경
		$(this).attr('src', src === followed ? follow : followed)
		
		
	})
	
	
	


</script>
</html>