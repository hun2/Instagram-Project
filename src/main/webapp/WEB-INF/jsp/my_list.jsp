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
			<img src="/img/logo_text.png" class="brand-img" alt="상단바 훈스타그램 로고"
				onclick="location.href='/main/board-view'"> <input type="text"
				class="search-box" placeholder="search">
			<div class="nav-items">
				<img src="/img/home.png" class="icon" alt="" id="home"
					onclick="location.href='/main/board-view'"> <img
					src="/img/send.png" class="icon" alt="" id="send"> <img
					src="/img/add.png" class="add icon" alt=""> <img
					src="/img/explore.png" class="icon" alt="" id="explore">
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
				<c:if test="${sessionScope.loginUser.profilePhoto == null}">
					<div class="profile-pic">
					<img src="/img/no.png" alt="">
				</div>
				</c:if>
				<c:if test="${sessionScope.loginUser.profilePhoto != null}">
					<div class="profile-pic">
					<img src="${sessionScope.loginUser.profilePhoto}" alt="">
				</div>
				</c:if>
				
			</div>
			<div class="profileright">
				<div class="profilename">
					${sessionScope.loginUser.uid} <img src="/img/set.png" class="icon2"
						width="17px" height="17px">
				</div>
				<div class="profilecontent">
					<div class="profilecontentname">게시글</div>
					<span class="profilecontentcount"> ${boardCount} </span>
					<div class="profilecontentname">팔로우</div>
					<span class="profilecontentcount"> ${followCount } </span>
					<div class="profilecontentname">팔로워</div>
					<span class="profilecontentcount"> ${followedCount } </span>
				</div>
				<div class="profilenickname">
					<div>${user.nickName}</div>
				</div>
			</div>
		</header>
		<aside class="bodycontent">
			<div class="bodycontainer">
				<c:forEach items="${boardList}" var="board">
					<div class="item">
						<img src="${board.boardImage}" class="bodyimg" data-id="${board.boardId}">
					</div>
				</c:forEach>
			</div>
		</aside>
	</section>

	<!--상단 바 사진추가  -->
	<div class="modal">
		<div class="modal_body">
			<span id="upload">게시글 업로드</span>
			<div class="uploadinfo">
				<div class="uploadprofile-pic">
					<img src="${sessionScope.loginUser.profilePhoto}" alt="">
				</div>
				<p class="uploadusername">${sessionScope.loginUser.uid}</p>
			</div>
			<div class="uploadimg">
				<img src="/img/no.png" id="uploadimg">
			</div>
			<div class="uploadfile">
				<input type="file" id="file" value="파일선택"
					accept=".gif, .jpg, .png, .jpeg" onchange="readURL(this);">
			</div>
			<textarea class="input_login" id="content"></textarea>
			<div class="addbutton">
				<a href="#none"><button id="btn_addlist">게시글 추가</button></a>
			</div>
		</div>
	</div>

	<!--개인정보 수정  -->
	<div class="modal2">
		<div class="modal_body">
			<span id="upload">개인정보수정</span>
			<div class="uploadinfo">
				<div class="uploadprofile-pic">
					<img src="${sessionScope.loginUser.profilePhoto}" alt="">
				</div>
				<p class="uploadusername">${sessionScope.loginUser.uid}</p>
			</div>
			<div class="uploadimg">
				<img src="/img/no.png" id="modifyimg">
			</div>
			<div class="uploadfile">
				<input type="file" id="file2" accept=".gif, .jpg, .png, .jpeg"
					onchange="readURL2(this);">
			</div>
			<div class="bundle">
				<span class="askspan">비밀번호: </span> <br>
				<input type="password" class="btn_pwd" id="pwd">
			</div>
			<div class="bundle">
				<span class="askspan">비밀번호 확인: </span> <br>
				<input type="password" class="btn_pwd" id="repwd">
			</div>
			<div class="bundle">
				<span class="askspan">이메일: </span> 
				<input type="text" class="btn_email" id="email" value="${sessionScope.loginUser.email}">
			</div>
			<div class="bundle">
				<span class="askspan">닉네임: </span> 
				<input type="text" class="btn_email" id="nickName" value="${sessionScope.loginUser.nickName}">
			</div>
			<div class="addbutton">
				<a href="#none"><button id="btn_modify">개인정보 수정</button></a>
			</div>
		</div>
	</div>
	
	<div class="modal3">
		<div class="modal3_body">
			<div class="modal3_left">
				<img src="/img/kim.jpg" class="modal3_leftimg">			
			</div>
			<div class="modal3_right">
				<div class="info">
					<div class="user">
						<div class="profile-pic">
							<img src="${sessionScope.loginUser.profilePhoto}" alt="">
						</div>
						<p class="username">${sessionScope.loginUser.uid}</p>
					</div>
				</div>
				<div class="post-content">
					<div class="info2">
						<p class="likes">10 likes</p>
						<div class="description">
							<div class="profile-pic2">
								<img src="${sessionScope.loginUser.profilePhoto}" alt="">
							</div>
							<span class="descriptionId">${sessionScope.loginUser.uid} </span> 
							<span class="content">게시글의 content 내용 가져와야함</span>
						</div>
					</div>
					<div class="sample">
					
					
					</div>
				</div>
				<div class="post-content-comment">
					<input type="text" placeholder="댓글달기.." class="content-commnet">
					<a class="push" data-board-id="${List.board.boardId}">추가</a>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	
	
	//게시글 추가 및 개인정보 수정시 모달 창 팝업
	const body = document.querySelector('body');
	const modal = document.querySelector('.modal');
	const modal2 = document.querySelector('.modal2');
	const modal3 = document.querySelector('.modal3');
	const addPopup = document.querySelector('.add');
	const boardListPopup = document.querySelector('.bodyimg');
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
	
	modal3.addEventListener('click', (event) => {
	    if (event.target === modal3) {
	      modal3.classList.toggle('show');
	    }
	    if (!modal3.classList.contains('show')) {
	        body.style.overflow = 'auto';
	     }
	});
	
	
	

	//상단바 내정보 클릭시 프로필 / 로그아웃 나오게 하는 click 이벤트
	$('.dropdown').on('click', function(){
		var display = $('.dropdown-submenu').css('display');
		if (display == 'none' ) {
			$('.dropdown-submenu').css('display', 'block');
		} else {
			$('.dropdown-submenu').css('display', 'none');
		}
	})
	
	//게시글 작성 시 이미지 미리보기 이벤트.
	function readURL(input) {
		
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('uploadimg').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('uploadimg').src = "/img/no.png";
		}
	}
	
	//개인정보 수정 시 이미지 미리보기 이벤트
	function readURL2(input) {
		
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('modifyimg').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('modifyimg').src = "/img/no.png";
		}
	}
	
	
	//모달창 이후 => 글 등록시 유효성확인 및 ajax 전송
	$('#btn_addlist').on('click', function(){
		var file = $('#file').val();
		var arr = file.split('.').pop().toLowerCase();
		//확장자 유효성 확인
		if (file.split('.').length < 2 || (arr != "git" &&
				arr != "png" &&
				arr != "jpg" &&
				arr != "jpeg")) {
			alert("이미지 파일만 업로드 할 수 있습니다.");
			$('#file').val('');
			return false;
		}
		
		/* // 확장자 유효성 확인 (기존 memo 에서 했던 방법)
		if (file != "") {
			
			file.split('.').pop();
			var ext = file.split('.').pop().toLowerCase();
			
			if ( $.inArray(ext, ['gif', 'jpg', 'jpeg', 'png']) == -1) {
				alert("이미지 파일만 가능합니다");
				$('#file').val('');
				return false;
			}
		} */
		
		var content = $('#content').val();
		var formData = new FormData();
		formData.append('content', content);
		formData.append('file', $('#file')[0].files[0]);
		
		$.ajax({
			type : 'POST'
			, url : '/main/my-list-add'
			, data : formData
			, enctype : "multipart/form-data"
			, processData : false
			, contentType : false
			
			//요청 후 
			,success : function(result) {
				if (result.code == 100) {
					alert("글을 작성 하였습니다.")
					location.href = "/main/my-list";
				} else if (result.code == 300) {
					alert("로그인을 해주세요");
					location.href="/main/sign-in-view";
				} else {
					alert(result.errorMessage);
				}
			}
			, error : function(e) {
				alert("에러입니다. 관리자에게 문의하세요");
			}
		})
	}) 
	
	$('#file2').on('change', function(){
		
		var file = $('#file2').val();
		var arr = file.split('.').pop().toLowerCase();
		//확장자 유효성 확인
		if (file.split('.').length < 2 || (arr != "gif" &&
				arr != "png" &&
				arr != "jpg" &&
				arr != "jpeg")) {
			alert("이미지 파일만 업로드 할 수 있습니다.");
			$('#file').val('');
			return false;
		}
	})
	
	//모달창 이후 => 개인정보 수정 시 유효성 확인 및 ajax 전송
	
	$('#btn_modify').on('click', function(){
		
		var file = $('#file2').val();
		var repwd = $('#repwd').val().trim();
		var pwd = $('#pwd').val().trim();
		var email = $('#email').val().trim();
		var nickName = $('#nickName').val();
		
		//비밀번호 유효성 검사
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
		
		
		
		
		var formData = new FormData();
		formData.append('pwd', pwd);
		formData.append('email', email);
		formData.append('nickName', nickName);
		formData.append('file', $('#file2')[0].files[0]);
		
		console.log(formData)
		$.ajax({
			type : "PUT"
			, url : "/main/modify"
			, data : formData
			, enctype : "multipart/form-data"
			, processData : false
			, contentType : false
			, success : function(result) {
				
				if(result.code == 100) {
					alert("프로필을 수정하였습니다.")
					location.href = "/main/my-list";
				} else if (result.code == 300) {
					alert("로그인을 해주세요");
					location.href="/main/sign-in-view";
				} else {
					alert(result.errorMessage);
				}
			}
			, error : function(e) {
				alert("에러입니다. 관리자에게 문의하세요");
			}
		})
	})
	
	
	
	//게시글 클릭시 모달창 및 게시글 상세보기
	$('.bodyimg').on('click', function(){
		var boardId = $(this).data('id');
		
		$.ajax({
			type : "GET"
			,url : "/main/my-list-click"
			, data : {"boardId" : boardId}
			, success : function(result){
				$('.sample').children().remove();
				
				modal3.classList.toggle('show');
				if (modal3.classList.contains('show')) {
					body.style.overflow = "hidden";
				}
				var boardImage = result.myBoard[0].boardImage
				var content = result.myBoard[0].content
				
				//이미지 변경
				$('.modal3_leftimg').attr('src', boardImage);
				
				//글내용 변경
				$('.content').text(content);
				
				//좋아요 갯수 변경
				$('.likes').text(result.likeCount + "likes");
				
				
				//댓글 리스트
				var commentList = result.commentList
				$.each(commentList, function(index, value){
					$('.sample').append($( "<div>" + "<span class='spanid'>" + value.userId + "</span>"+ "<span>" + value.comment + "</span>" + "</div>"))
				})
				
				
			}
		})
	})
	
	
	


</script>
</html>