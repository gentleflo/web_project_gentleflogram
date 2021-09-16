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
		<section class="content d-flex justify-content-center align-items-center my-3">
			<div>
				<div class="login-box d-flex justify-content-center align-items-center ml-4">
					<div>
						<h3 class="main-logo text-center mt-4"><b>gentleflogram</b></h3><br>
						
						<div class="text-secondary text-center">친구들의 사진과 동영상을 보려면 <br>가입하세요.</div>
						
						<div class="d-flex justify-content-center align-items-center">
							<img src="/static/image/facebook_login.jpg" class="mt-3" alt="페이스북 로그인 버튼 이미지" width="250px">
						</div>
						
						<div class="d-flex justify-content-center align-items-center mt-3">
							<hr class="col-3">또는<hr class="col-3">
						</div>
						
						<form id="signUpForm" class="mt-2">
							<input type="text" class="input-style form-control mb-1" id="emailInput" placeholder="이메일 주소">
							<div class="input-group mb-1">
						    	<input type="text" class="input-style form-control mr-1" id="loginIdInput" placeholder="아이디">
								<button type="button" class="btn btn-style btn-sm" id="isDuplicateBtn">중복체크</button>
							</div>
							
							<div class="d-none" id="duplicateDiv"><small class="text-danger">중복된 ID 입니다.</small></div>
							<div class="d-none" id="noneDuplicateDiv"><small class="text-success">사용가능한 ID입니다.</small></div>
							
							<input type="text" class="input-style form-control mt-1" id="nameInput" placeholder="사용자 이름">
							<input type="password" class="input-style form-control mt-1" id="passwordInput" placeholder="비밀번호">
							<input type="password" class="input-style form-control mt-1" id="passwordConfirmInput" placeholder="비밀번호 확인">
							
							<button id="signUpBtn" type="submit" class="btn btn-primary btn-block mt-2 mb-4">가입</button>
						</form>
					</div>
				</div>
				
		<div>
			
			<div class="signup-box d-flex justify-content-center align-items-center ml-4 mt-3">
				<span class="mr-2">계정이 있으신가요?</span><a href="/user/signin_view">로그인</a>
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
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			var isIdCheck = false;
			var isDuplicateId = true;
			
			// 아이디에 입력이 있을경우 중복체크 클래스를 초기화 한다
			$("#loginIdInput").on("input", function(){
				$("#duplicateDiv").addClass("d-none");
				$("#noneDuplicateDiv").addClass("d-none");
				var isIdCheck = false;
				var isDuplicateId = true;
			});
			
			$("#signUpForm").on("submit", function(e){
				e.preventDefault();  // submit일때만 사용하는것인가?
				
				var email = $("#emailInput").val();
				var loginId = $("#loginIdInput").val();
				var name = $("#nameInput").val();
				var password = $("#passwordInput").val();
				var passwordConfirm = $("#passwordConfirmInput").val();
				
				if(email == null || email == "") {
					alert("이메일 주소를 입력하세요.");
					return;
				}
				
				if(loginId == null || loginId == "") {
					alert("아이디를 입력하세요.");
					return;
				}
				
				// 중복체크 했는지?
				if(isIdCheck == false) {
					alert("중복체크를 진행하세요");
					return ;
				}
						
				// 중복이 되었는지 안되었는지?
				if(isDuplicate == true) {
					alert("아이디가 중복되었습니다.");
					return ;
				}
				
				if(name == null || name == "") {
					alert("이름을 입력하세요.");
					return;
				}
				
				if(password == null || password == "") {
					alert("비밀번호를 입력하세요.");
					return;
				}
				
				if(passwordConfirm == null || passwordConfirm == "") {
					alert("비밀번호 확인을 위해 입력하세요.");
					return;
				}
				
				if(password != passwordConfirm) {
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_up",
					data:{"email":email, "loginId":loginId, "name":name, "password":password},
					success:function(data) {
						if(data.result == "success") {
							location.href="/user/signin_view";
						} else {
							alert("회원가입을 다시 시도해주세요");
						}
					}, error:function(e) {
						alert("error");
					}
				});
			});
			
			
			$("#isDuplicateBtn").on("click", function(){
				var loginId = $("#loginIdInput").val();
				
				if(loginId == null || loginId == "") {
					alert("아이디를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"get",
					url:"/user/is_duplicate_id",
					data:{"loginId":loginId},
					success:function(data) {
						isIdCheck = true;
						
						if(data.is_duplicate) {
							isDuplicate = true;
							$("#duplicateDiv").removeClass("d-none");
							$("#noneDuplicateDiv").addClass("d-none");
						} else {
							isDuplicate = false;
							$("#duplicateDiv").addClass("d-none");
							$("#noneDuplicateDiv").removeClass("d-none");
						}
						//isDuplicate = data.is_duplicate;
						
					}, error:function(e) {
						alert("중복확인 실패");
					}
					
				});
			});
		});
	</script>
	</div>
</body>
</html>