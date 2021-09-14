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
	
	<link rel="stylesheet" href="/static/css/style_gentleflogram.css" type="text/css">
	
	<title>gentleflogram_회원가입</title>
</head>
<body>
	<div id="wrap">
		<section class="content d-flex justify-content-center align-items-center">
			<div>
				<div class="login-box d-flex justify-content-center align-items-center ml-4">
					<div>
						<h3 class="main-logo text-center mt-4"><b>gentleflogram</b></h3><br>
						
						<div class="text-secondary text-center">친구들의 사진과 동영상을 보려면 <br>가입하세요.</div>
						
						<div class="d-flex justify-content-center align-items-center">
							<img src="/static/image/facebook_login.jpg" class="mt-3" alt="페이스북 로그인 버튼 이미지" width="250px">
						</div>
						
						<div class="d-flex justify-content-center mt-3">
							<hr class="w-50">또는<hr class="w-50">
						</div>
						
						<form id="loginForm" class="mt-2">
							<input type="text" class="input-style form-control mb-1" id="emailInput" placeholder="이메일 주소">
							<div class="input-group mb-1">
						    	<input type="text" class="input-style form-control" id="idInput" placeholder="아이디" aria-label="Recipient's username" aria-describedby="basic-addon2">
								<div class="input-group-append">
									<button class="btn input-style btn-outline-secondary btn-sm" type="button">중복확인</button>
								</div>
							</div>
							<input type="text" class="input-style form-control mt-1" id="nameInput" placeholder="사용자 이름">
							<input type="text" class="input-style form-control mt-1" id="passwordInput" placeholder="비밀번호">
							<button id="loginBtn" type="submit" class="btn btn-primary btn-block mt-2 mb-4">가입</button>
						</form>
					</div>
				</div>
				
		<div>
			
			<div class="signup-box d-flex justify-content-center align-items-center ml-4 mt-3">
				<span class="mr-2">계정이 있으신가요?</span><a href="">로그인</a>
			</div>	
	
			<div class="d-flex justify-content-center ml-4 mt-3">
				<span>앱을 다운로드하세요.</span>
			</div>
					
			<div class="d-flex justify-content-center ml-3 mt-3">
				<img src="/static/image/appstore_download.jpg" alt="앱스토어 다운로드 아이콘" width="120px">
				<img src="/static/image/google download.jpg" alt="플레이스토어 다운로드 아이콘" width="120px">
			</div>
		</div>
	</section>
	
	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
</body>
</html>