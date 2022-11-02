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
				class="search-box" placeholder="search" id="search-box">
			<div class="nav-items">
				<img src="/img/home.png" class="icon" alt="" id="home"
					onclick="location.href='/main/board-view'"> <img
					src="/img/send.png" class="icon" alt="" id="send"> <img
					src="/img/add.png" class="add icon" alt=""> <img
					src="/img/explore.png" class="icon" alt="" id="explore">
				<div class="dropdown">
					<img src="/img/profile.png" class="icon" alt="" id="profile">
					<div class="dropdown-submenu">
						<a href="#none" onclick="location.href='/main/my-list'">프로필</a> <a
							href="#none" onclick="location.href='/main/logout'">로그아웃</a>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<section class="main">
		<div class="wrapper">
			<div class="left-col">
				<c:forEach items="${cardList}" var="List">
					<div class="post">
						<div class="info">
							<div class="user">
								<c:if test="${List.user.profilePhoto != null }">
									<div class="profile-pic">
										<img src="${List.user.profilePhoto }" alt="">
									</div>
								</c:if>
								<c:if test="${List.user.profilePhoto == null }">
									<div class="profile-pic">
										<img src="/img/no.png" alt="">
									</div>
								</c:if>
								<p class="username">${List.user.uid}</p>
							</div>
							<div class="dropdown2" data-id="${List.board.boardId}">
								<c:if test="${List.checkMyBoard eq true}">
									<img src="/img/option.png" class="options" alt="">
									<div class="dropdown-submenu2">
										<a href="#none" onclick="" class="dropdown-modify"
											data-modify-id="${List.board.boardId}"> 수정</a> <a
											href="#none" onclick="" class="dropdown-delete"
											data-delete-id="${List.board.boardId}">삭제</a>
									</div>
								</c:if>
							</div>
						</div>
						<img src="${List.board.boardImage}" class="post-image" alt="">
						<div class="post-content">
							<div class="reaction-wrapper">
								<c:if test="${List.filledLike eq true }">
									<img src="/img/liked.png" class="icon" alt=""
										data-id="${List.board.boardId}">
								</c:if>
								<c:if test="${List.filledLike eq false }">
									<img src="/img/like.png" class="icon" alt=""
										data-id="${List.board.boardId}">
								</c:if>
								<img src="/img/comment.PNG" class="icon" alt=""> <img
									src="/img/send.PNG" class="icon" alt=""> <img
									src="/img/save.PNG" class="save icon" alt="">
							</div>
							<p class="likes">${List.likeCount}likes</p>
							<p class="description">
								<span>${List.board.userId} </span> ${List.board.content}
							</p>

							<!--댓글보기 -->
							<div class="text" data-id="${num}">
								<p class="description_add">
									<span> 댓글 ${List.commentCount}개 모두 보기</span>
								</p>
								<c:forEach items="${List.commentList}" var="comment">
									<div class="description_comment">
										<span>${comment.comment.userId} </span>
										${comment.comment.comment }
									</div>
								</c:forEach>
							</div>
						</div>
						<!--댓글쓰기  -->
						<div class="post-content-comment">
							<input type="text" placeholder="댓글달기.." class="content-commnet">
							<a class="push" data-board-id="${List.board.boardId}">게시</a>
						</div>
					</div>
				</c:forEach>
			</div>

			<!--바디 오른쪽 계정 표시 및 	회원추천-->
			<div class="right-col">
				<div class="profile-card">
					<div class="profile-pic">
						<c:if test="${sessionScope.loginUser.profilePhoto == null}">
							<img src="/img/no.png" alt="">
						</c:if>
						<c:if test="${sessionScope.loginUser.profilePhoto != null}">
							<img src="${sessionScope.loginUser.profilePhoto}" alt="">
						</c:if>
					</div>
					<div>
						<p class="username">${sessionScope.loginUser.uid}</p>
					</div>
				</div>
				<p class="suggestion-text">회원님을 위한 추천</p>

				<c:forEach items="${userList}" var="List">
					<div class="profile-card">
						<div class="profile-pic">
							<c:if test="${List.profilePhoto == null }">
								<img src="/img/no.png" alt="">
							</c:if>
							<c:if test="${List.profilePhoto != null }">
								<img src="${List.profilePhoto}" alt="">
							</c:if>
						</div>
						<div class="test">
							<p class="username" data-id="${List.uid}">${List.uid}</p>
							<p class="sub-text">user외 4명이 팔로우합니다.</p>
						</div>
						<button class="action-btn">follow</button>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>


	<!-- 글쓰기 모달  -->
	<div class="modal">
		<div class="modal_body">
			<span id="upload">게시글 업로드</span>
			<div class="uploadinfo">
				<!-- <div class="user">
           	 	<div class="profile-pic"><img src="/img/park.jpg" alt=""></div>
          	 	<p class="username">text</p>
             </div> -->
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
	
	//게시글 더보기 클릭시 수정/ 삭제 이벤트
	$('.dropdown2[data-id]').on('click', function(){
		var div = $(this).children('div');
		if ($(div).css('display') == 'none') {
			$(div).css('display', 'block');
		} else {
			$(div).css('display', 'none');
		}
	})
	
	/* //수정 클릭시 이벤트 ------------ 모든글이 수정권한이 있어 추후에 다시 하는걸로.
	$('.dropdown-modify').on('click', function(){
	
		var data = $(this).data('modify-id');
		
		
		
	}) */
	
	
	
	//댓글더보기 클릭시 댓글들 보이기
	$(".text[data-id]").on('click', function(){
		var div = $(this).children('div');
		if ($(div).css('display') == 'none') {
			$(div).css('display', 'block');
		} else {
			$(div).css('display', 'none');
		}
	})
	
	//좋아요 버튼 클릭시 하트 색 변하기 
	$('.icon[data-id]').on('click', function(){
		
		const boardId = $(this).data("id");
		const src = $(this).attr('src')
		
		const heart = "/img/like.png"
		const redheart = "/img/liked.png"
		
		
		$(this).attr('src', src === heart ? redheart : heart)
		
			$.ajax({
				type : "POST"
				, url : "/main/like"
				, data : {"boardId" : boardId}
				,success : function(result){
					if (result.code == 100) {
						alert("성공");
						location.reload();
					} else if (result.code == 300) {
						alert("로그인을 해주세요");
						location.href="/main/sign-in-view";
					}
				}
				, error: function(e) {
					
					alert("관리자에게 문의하세요.")
				}
			})
	})
	
	
	
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
	
	//검색창에서 엔터 입력시 관련된 문서 get
	var searchbox = document.getElementById("search-box");
	searchbox.addEventListener("keyup", function(event){
		if(event.keyCode === 13) {
			event.preventDefault();
			//ajax는 추후에 db 설계 완료 후 작성
			alert("엔터키 누름");
 		}
 	});
	
	//글쓰기 모달시 => 사진 미리보기 이벤트
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
	
	//모달창 이후 => 글 등록시 유효성확인 및 ajax 전송
	$('#btn_addlist').on('click', function(){
		var file = $('#file').val();
		var arr = file.split('.').pop().toLowerCase();
		//확장자 유효성 확인
		if (file.split('.').length > 2 || (arr != "git" &&
				arr != "png" &&
				arr != "jpg" &&
				arr != "jpeg")) {
			alert("이미지 파일만 업로드 할 수 있습니다.");
			$('#file').val('');
			return false;
		}
		
		// 확장자 유효성 확인 (기존 memo 에서 했던 방법)
		/* if (file != "") {
			
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
			, url : '/main/list'
			, data : formData
			, enctype : "multipart/form-data"
			, processData : false
			, contentType : false
			
			//요청 후 
			,success : function(result) {
				if (result.code == 100) {
					alert("글을 작성 하였습니다.")
					location.href = "/main/board-view";
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
	
	
	//댓글 쓰기 버튼 클릭시 이벤트
	$(".push").on("click", function(){
		var boardId = $(this).data('board-id');
		//지금 클릭된 게시 버튼의 형제인 input 태그를 가져온다. (siblings)
		var comment =  $(this).siblings('input').val().trim();
		
		$.ajax({
			
			type : "POST"
			, url : "/main/add-comment"
			, data : {"boardId" : boardId, "comment" : comment}
			, success : function(result){
				if ( result.code == 100) {
					alert("댓글 등록이 완료 되었습니다");
					location.reload();
				} else if (result.code == 200) {
					alert("관리자에게 문의 해보실래요?")
				} else if (result.code == 300) {
					alert("로그인을 해주세요");
					location.href="/main/sign-in-view";
				}
			}
			, error : function(e) {
				alert("관리자에게 문의 하세요");
				
			} 
		}) 
	})
	
	
	//다른사람 개인페이지 접근
	$('.username[data-id]').on('click', function(){
		
		var uid = $(this).data('id');
		location.href="/main/other-list?uid=" + uid;
	})
	
	
	//팔로우버튼 클릭시 팔로우 신청
	
	$('.action-btn').on('click', function(){
		
		
		var uid = $(this).siblings('.test').children('.username[data-id]').data('id');
		
		
		$.ajax ({
			type : "POST"
			, url : '/main/follow'
			, data : {'uid' : uid}
			,success : function(result) {
				if ( result.code == 100) {
					alert("팔로우 신청이 완료 되었습니다");
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
	})
	
	
	//게시글 삭제
	
	$('.dropdown-delete').on('click', function(){
		
		var boardId =  $(this).data('delete-id');
		
		
		
		//게시글 삭제
		$.ajax({
			type : "DELETE"
			, url : "/main/board-delete"
			, data : {"boardId" : boardId}
			, success : function(result) {
				
				if(result.code == 100) {
					alert("삭제되었습니다.");
					location.reload();
				} else {
					alert("삭제 실패 하였습니다.")
					location.reload();
				}
				
			}
			, error : function(e) {
				alert("관리자에게 문의하세요");
				
			}
		})
	})
	
	
	
	
	 //무한스크롤 
	/* $(window).scroll(function(){
		const check = $(window).scrollTop() - ($(document).height() - $(window).height());
		if ( check <0) {
			$.ajax ({
				type : "GET"
				, url : "/board_view_getscroll"
				, data : {}
				, success : function(){
					//여기서 조건이 걸려서 limit 으로 가져오는 방법을 구상해야함.
					//변수 설정하여 성공할때마다 증감되는 무언가를
					//리스트를 뿌리면 저절로 스크롤이 올라감
				}
			})
		}
	})  */
	
	//view 페이지 접속시 기본 리스트 뿌려주는 
</script>
</html>