package com.gentleflo.gentleflogram.user;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@PostMapping("/sign_up")
	public Map<String, String> signUp(
			@RequestParam("email") String email
			, @RequestParam("loginId") String loginId
			, @RequestParam("name") String name
			, @RequestParam("password") String password
			) {
		
	}
}
