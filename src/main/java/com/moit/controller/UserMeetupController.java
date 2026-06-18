package com.moit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/meetup/user")
public class UserMeetupController {
	
	@RequestMapping("/list.do")
	public String serchByUser(Model model) {
		model.addAttribute("menu", "meetup");
		return "meetup/user/list";
	}
}
