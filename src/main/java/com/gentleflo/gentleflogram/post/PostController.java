package com.gentleflo.gentleflogram.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@GetMapping("/personalTimeline_view")
	public String personalTimelineView() {
		return "post/personalTimeline";
	}
	
}
