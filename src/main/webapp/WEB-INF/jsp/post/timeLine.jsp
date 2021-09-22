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
			<c:forEach var="Post" items="${timeLineList }">
			<div class="d-flex justify-content-center mb-3">
				<div class="timeLine-box p-1 ml-2">
					<div class="d-flex justify-content-between mb-2">
						<div class="d-flex align-items-center timeLine-box-profile">
							<img src="/static/image/main-profile.jpg" alt="메인 프로필 이미지" width="32px" class="ml-1 mt-1">
							<div class="login-id ml-2">
								<c:if test="${not empty userLoginId}">
									<div>${userLoginId }</div>
								</c:if>
							</div>
						</div>
						<a href="#"><i class="bi bi-three-dots delete-dots mr-2"></i></a>
					</div>
					
					<img src="${Post.imagePath }" width="400px" alt="타임라인 이미지">
					
					<div class="d-flex justify-content-between ml-1 mr-1 mt-1">
						<div class="icon-fam">
							<i class="bi bi-heart mr-1"></i>
							<i class="bi bi-chat mr-1"></i>
							<i class="bi bi-cursor"></i>
						</div>
						<i class="bi bi-three-dots text-secondary icon-fam"></i>
						<i class="bi bi-bookmark icon-fam ml-4"></i>
					</div>
					
					<div class="ml-1"><small><b>좋아요 11개</b></small></div>
					
					<div class="d-flex ml-1">
						<div>
							<c:if test="${not empty userLoginId }"/>
							<div class="comment-style">${userLoginId }</div>
						</div>
						<div class="ml-2">
							<div><small>${Post.content }</small></div>
						</div>
					</div><hr>
					
					<div class="comment-section d-flex justify-content-between align-items-center mb-2">
						<div class="mb-1">
							<i class="bi bi-emoji-smile icon-fam ml-2"></i>
							<input type="text" placeholder="댓글 달기..." class="comment-input mb-2 ml-1">
						</div>
						<a href="#" class="text-dark mr-1 mb-1"><small>게시</small></a>
					</div>
				</div>
			</div>
			</c:forEach>
		</section>
		
		<aside>
			<div class="top-of-aside"></div>
			<div class="d-flex">
				<div>
					<img src="/static/image/main-profile.jpg" alt="메인 프로필 이미지" width="44px" class="mt-2">
				</div>
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
</body>
</html>