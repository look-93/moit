package com.moit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/meetup/user")
public class UserMeetupController {
	
	@RequestMapping("/list.do")
	public String serchByUser() {
		
		return "meetup/user/list";
	}
}
