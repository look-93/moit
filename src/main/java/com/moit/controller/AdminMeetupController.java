package com.moit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moit.service.AdminMeetupService;


@Controller
@RequestMapping("/meetup/admin")
public class MeetupController {
	/*
	 * @RequestMapping( "/" ) public String index() { return
	 * "redirect:/meetup/admin/list.do"; }
	 */
	
	@Autowired AdminMeetupService meetupService;
	
	@RequestMapping("/list.do")
	public String list(Model model) {
		model.addAttribute("menu", "meetup");
		model.addAttribute("meetupList", meetupService.meetupList());
		return  "meetup/admin/list";   
	} 
	
}
