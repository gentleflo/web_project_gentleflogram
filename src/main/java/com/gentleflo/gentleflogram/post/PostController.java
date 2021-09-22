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

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/personalTimeline_view")
	public String personalTimelineView() {
		return "post/personalTimeline";
	}
	
	@GetMapping("/timeline_view")
	public String timeLineView(
			Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<Post> timeLineList = postBO.getTimeLineList(userId);
		model.addAttribute("timeLineList", timeLineList);
		
		return "post/timeLine";
	}
	
}
