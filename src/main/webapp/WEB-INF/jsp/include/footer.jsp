<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<footer class="d-flex justify-content-center align-items-center">
	<div class="input-group-prepend mr-3">
    	<button type="button" class="language btn btn-outline-secondary btn-sm">언어</button>
    	<button type="button" class="btn btn-outline-secondary btn-sm dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      		<span class="sr-only">Toggle Dropdown</span>
    	</button>
	    <div class="dropdown-menu">
			<a class="dropdown-item" href="#">한국어</a>
	      	<a class="dropdown-item" href="#">영어</a>
	    </div>
  	</div>
	<div class="text-secondary"><small>2021 GENTLEFLOGRAM FROM MEGABOOK</small></div>
	
	<c:if test="${not empty userName }">
		<div class="text-secondary ml-5">
			<small> ${userName } 님 <a href="/user/sign_out">[로그아웃]</a></small>
		</div>
	</c:if>
</footer>
