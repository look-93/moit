package com.moit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moit.dto.MeetupSerchDto;
import com.moit.service.UserMeetupService;
import com.moit.util.PagingUtil;

@Controller
@RequestMapping("/meetup/user")
public class UserMeetupController {
	@Autowired UserMeetupService userMeetupService;
	
	@RequestMapping("/list.do")
	public String serchByUser(Model model, MeetupSerchDto meetupSerchDto, @RequestParam(value="pstartno", defaultValue="1") int pstartno) {
		//System.out.println(meetupSerchDto);
		model.addAttribute("menu", "meetup");
		model.addAttribute("sidoList", userMeetupService.findAllSido());
		model.addAttribute("paging", new PagingUtil(userMeetupService.selectUserMeetupTotalCnt(meetupSerchDto), pstartno));
		model.addAttribute("serchList", userMeetupService.serchByUser(pstartno,meetupSerchDto));	
		return "meetup/user/list";
	}
	
//	@RequestMapping("/write.do")
//	public String write() {
//		return "meetup/user/write";
//	}
	
	@RequestMapping("/detail.do")
	public String write(Model model, int meetupId) {
		model.addAttribute("detailList", userMeetupService.selectMeetupDetail(meetupId));
		return "meetup/user/detail";
	}
	

		
}
