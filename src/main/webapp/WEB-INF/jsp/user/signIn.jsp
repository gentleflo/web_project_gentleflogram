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
	
	<title>gentleflogram_로그인</title>
</head>
<body>
	<div id="wrap">
		<section class="content d-flex justify-content-center align-items-center my-3">
			
			<div class="main-section d-flex mr-1">
				<img src="/static/image/signin_main_img.jpg" alt="로그인 화면 메인 이미지" width="340px">
			</div>
			
			<div>
				<div class="login-box d-flex justify-content-center align-items-center ml-4">
					<div>
						<h3 class="main-logo text-center mt-4"><b>gentleflogram</b></h3><br>
						<form id="loginForm" class="mt-2">
							<input type="text" class="input-style form-control" id="loginIdInput" placeholder="아이디">
							<input type="password" class="input-style form-control mt-2" id="passwordInput" placeholder="비밀번호">
							<button id="loginBtn" type="submit" class="btn btn-primary btn-block mt-3">로그인</button>
						</form>
						<div class="d-flex justify-content-center align-items-center mt-3">
							<hr class="col-3">또는<hr class="col-3">
						</div>
						<div class="d-flex justify-content-center align-items-center mt-2">
							<img src="/static/image/facebook_icon.jpg" alt="페이스북 아이콘 이미지">
							<span class="text-darkblue ml-1">Facebook으로 로그인</span>
						</div>
						<div class="d-flex justify-content-center align-items-center mt-3 mb-3">비밀번호를 잊으셨나요?</div>
					</div>
				</div>
				
				<div class="signup-box d-flex justify-content-center align-items-center ml-4 mt-3">
					<span class="mr-2">계정이 없으신가요?</span><a href="/user/signup_view">가입하기</a>
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
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#loginForm").on("submit", function(e){
				
				e.preventDefault();
				
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				
				if(loginId == null || loginId == "") {
					alert("아이디를 입력해주세요");
					return;
				}
				
				if(password == null || password =="") {
					alert("비밀번호를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_in",
					data:{"loginId":loginId, "password":password},
					success:function(data) {
						if(data.result == "success"){
							alert("로그인되었습니다");
						} else {
							alert("아이디, 비밀번호를 확인해주세요");
						}
					}, error:function(e) {
						alert("errror");
					}
				});
			});
		});
	</script>
</body>
</html>