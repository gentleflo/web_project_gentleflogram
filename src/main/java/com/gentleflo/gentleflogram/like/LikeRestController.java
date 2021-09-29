package com.gentleflo.gentleflogram.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gentleflo.gentleflogram.like.bo.LikeBO;

@RestController
@RequestMapping("/post")
public class LikeRestController {
	@Autowired
	private LikeBO likeBO;
	
	@GetMapping("/like")
	public Map<String, String> addLike(
			@RequestParam("postId") int postId  // 클라이언트가 어떤 글에 좋아요를 눌렀는지 얻어오는것
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		// int count = likeBO.addLike(userId, postId);
		boolean isLike = likeBO.like(userId, postId);
		
		Map<String, String> result = new HashMap<>();
		
		if(isLike) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	
	
	// html 클라이언트에서 좋아요 여부를 판단했을때 사용하는 방법 하지만 이건 데이터가 꼬일 가능성이 있기 때문에 서버에서 처리하는 방법을 사용할 수 있다.
	@GetMapping("/unlike")  
	public Map<String, String> deleteLike(
			@RequestParam("postId") int postId  // 클라이언트가 어떤 글에 좋아요를 눌렀는지 얻어오는것
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = likeBO.deleteLike(userId, postId);
		
		Map<String, String> result = new HashMap<>();
		if(count == 0) {
			result.put("result", "fail");
		} else {
			result.put("result", "success");
		}
		return result;
	}
}
