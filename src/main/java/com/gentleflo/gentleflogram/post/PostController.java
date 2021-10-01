package com.gentleflo.gentleflogram.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gentleflo.gentleflogram.post.bo.PostBO;
import com.gentleflo.gentleflogram.post.model.Post;
import com.gentleflo.gentleflogram.post.model.PostDetail;

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired
	private PostBO postBO;
	
	
	// 개인 피드 타임라인 view
	@GetMapping("/personalTimeline_view")
	public String personalTimelineView(Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<Post> personalTimelineList = postBO.getPersonalTimelineList(userId);
		model.addAttribute("personalTimelineList", personalTimelineList);
		
		return "post/personalTimeline";
	}
	
	
	// 여러 게시글이 보이는 공용 타임라인 view
	@GetMapping("/timeline_view")
	public String timeLineView(Model model,
			HttpServletRequest request) {    // jsp에서는 model이라는 객체에 저장해서 사용할 수 있어~!
	
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> timeLineList = postBO.getTimeLineList(userId);
		model.addAttribute("timeLineList", timeLineList);
		
		return "post/timeLine";
	}
	
	
	
	
}
