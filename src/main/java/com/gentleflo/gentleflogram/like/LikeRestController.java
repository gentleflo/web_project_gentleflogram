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
		
		int count = likeBO.addLike(userId, postId);
		
		// 좋아요를 취소할때 내가 클라이언트에서 필요한 데이터는 해당 포스트에 좋아요를 했는지 여부와 해당 포스트의 postId 그리고 userId
		// 좋아요를 했는지 여부와 postId는 클라이언트에서 얻을 수 있고 
		// userId는 서버에서 얻을 수 있다
		// postId는 postDetail.post.id 형태로 html에 꼿아두었고
		// 좋아요를 했는지의 여부는 likeBtn 이벤트의 컬러 변형으로 알 수 있다.... 이걸 어떻게 가져올 것인가.....
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	
	@GetMapping("/unlike")  // html 클라이언트에서 좋아요 여부를 판단했을때 사용하는 방법 하지만 이건 데이터가 꼬일 가능성이 있기 때문에 서버에서 처리하는 방법을 사용할 수 있다.
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
