<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<!-- 부트스트랩 아이콘 cdn -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="/static/css/style_post.css" type="text/css">
	
	<title>타임라인 화면</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" /> 
		
		<div class="d-flex justify-content-center">
		<section>
			<c:forEach var="post" items="${timeLineList }">  <!-- 가져오는 model의 형태가 list이기때문에 반복문으로 꺼내서 사용 -->
			<!-- "" 사이에 들어가는 값은 서로 다른 환경에서 전달을 위한 약속을 위한 키라고 생각하면 좋다 -->
			<div class="d-flex justify-content-center mb-3">
				<div class="timeLine-box p-1 ml-2">
					<div class="d-flex justify-content-between mb-2">
						<div class="d-flex align-items-center timeLine-box-profile">
							<img src="/static/image/main-profile.jpg" alt="메인 프로필 이미지" width="32px" class="ml-1 mt-1">
							<div class="login-id ml-2">
								<div>${post.loginId }</div>
							</div>
						</div>
						<a href="#"><i class="bi bi-three-dots delete-dots mr-2"></i></a>
					</div>
					
					<img src="${post.imagePath }" width="400px" alt="타임라인 이미지">
					
					<div class="d-flex justify-content-between ml-1 mr-1 mt-1">
						<div class="icon-fam">
							<a href="#" class="text-dark"><i class="bi bi-heart mr-1"></i></a>
							<i class="bi bi-chat mr-1"></i>
							<i class="bi bi-cursor"></i>
						</div>
						<i class="bi bi-three-dots text-secondary icon-fam"></i>
						<i class="bi bi-bookmark icon-fam ml-4"></i>
					</div>
					
					<div class="ml-1"><small><b>좋아요 11개</b></small></div>
					
					<!-- 피드 게시글 -->
					<div class="d-flex ml-1 align-items-center">
						<div class="content-style">${post.loginId }</div>
						<div class="ml-2"><small>${post.content }</small></div>
					</div>
					
					<!-- 댓글 -->
					<div class="d-flex ml-1">
						<c:forEach var="commentContent" items="${commentList }">
							<div class="mr-2 text-secondary">${commentContent.loginId }</div>
							<div class="text-secondary"><small>${commentContent.commentContent }</small></div>
						</c:forEach>
					</div>
					
					<hr>
					<!-- 댓글 입력 -->
					<div class="comment-section d-flex justify-content-between align-items-center mb-2">
						<div class="mb-1 d-flex">
							<i class="bi bi-emoji-smile icon-fam ml-2"></i>
							<input type="text" placeholder="댓글 달기..." id="commentInput-${post.id }" class="comment-input form-control ml-1">
						</div>
						<a href="#" class="commentBtn text-dark mr-1 mb-1" data-post-id="${post.id }"><small>게시</small></a>
						<!--data-post-id: 'data-'까지는 정해진 형태이고 그 뒤는 원하는 단어써서 정해주면 됨  -->
					</div>
				</div>
			</div>
			</c:forEach>
		</section>
		
		<aside>
			<div class="top-of-aside"></div>
			<div class="d-flex">
				<img src="/static/image/main-profile.jpg" alt="메인 프로필 이미지" width="44px" class="mt-2">
				<div class="ml-2">
					<c:if test="${not empty userLoginId }">
						<div>${userLoginId }</div>
						<div class="text-secondary"><small>${userName }</small></div>
					</c:if>
				</div>
			</div>
			
			<div class="d-flex justify-content-between mt-3 mb-1">
				<div><small>회원님을 위한 추천</small></div>
				<div><small class="text-secondary">모두 보기</small></div>
			</div>
			<img src="/static/image/aside_img.jpg" alt="aside 추천 이미지 샘플" width="300px">
		</aside>
		</div>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			$(".commentBtn").on("click", function(){
				var postId = $(this).data("post-id"); // 클릭된 버튼 객체, 버튼 자체가 객체화된것
				// postId, commentContent
				// 대응되는 input의 value
				// ex) postId = 5;
				// "#commentInput-5" 가 됨
				var commentContent = $("#commentInput-" + postId).val();
				

				$.ajax({
					type:"post",
					url:"/post/comment_create",
					data:{"postId":postId, "commentContent":commentContent},
					success:function(data){
						if(data.result="success") {
							alert("댓글이 등록되었습니다:)");
						} else {
							alert("댓글 등록 실패 ㅠㅠ");
						}
					}, error:function(e) {
						alert("error");
					}
				});
			});
		});
	</script>
</body>
</html>