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
	
	<link rel="stylesheet" href="/static/css/style_post.css" type="text/css">
	
	<title>개인 타임라인, 게시글 등록 화면</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" /> 
		
		<section>
			<div class="profile-section d-flex">
				<img src="/static/image/main-profile.jpg" alt="메인 프로필 이미지" width="120px">
				<div class="col-9 ml-2 mt-2">
					<div class="d-flex mt-4 my-1 justify-content-between">
						<c:if test="${not empty userLoginId}">
							<h4>${userLoginId }</h4>
						</c:if>
						<input type="button" class="profile-edit-btn btn form-control btn-sm col-3" value="프로필편집">
					</div>
					<div class="d-flex justify-content-between">
						<div><small>게시물 44</small></div>
						<div><small>팔로워 129</small></div>
						<div><small>팔로잉 117</small></div>
					</div>
				</div>
			</div>
				
				
			<div class="input-section d-flex justify-content-center align-items-center my-2">
				<div class="input-box">
					<div class="input-box-top text-center my-1">새 게시물</div>
					<div class="d-flex">
						<textarea rows="4" class="form-control mr-2 ml-2 mb-2" id="contentInput"></textarea>
					</div>
					<div class="d-flex justify-content-between">
						<div class="box-file-input mb-2 ml-2">
							<label>
								<input id="fileInput" class="file-input" type="file">
							</label>
							<span class="filename text-secondary ml-1"><small>파일을 선택해 주세요</small></span>  
						</div>
						<button type="button" id="shareBtn" class="share-btn btn btn-sm mr-2 mb-3 mt-1">공유</button>					
					</div>
				</div>
			</div>
				
				
			<div class="timeline-section">
				<nav></nav>
				<div class="main-content d-flex flex-wrap">
					<div class="content"></div>
					<div class="content"></div>
					<div class="content"></div>
					<div class="content"></div>
					<div class="content"></div>
					<div class="content"></div>
				</div>
			</div>
		</section>
	</div>
	
	<script>
		$(document).ready(function(){
			$("#shareBtn").on("click", function(){
				var content = $("#contentInput").val().trim();
				var file = $("#fileInput")[0].files[0];
				
				if(content == null || content == "") {
					alert("내용을 입력하세요");
					return;
				}
				
				if(file.lenght == 0) {
					alert("업로드할 사진을 선택하세요");
					return;
				}
				
				var formData = new FormData();  
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]); 
				
				$.ajax({
					enctype:"multipart/form-data",
					processData:false,  
					contentType:false, 
					type:"post",
					url:"/post/create_post",
					data:formData,
					success:function(data) {
						if(data.result == "success") {
							alert("게시글 등록 완료");
						} else {
							alert("등록 실패");
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