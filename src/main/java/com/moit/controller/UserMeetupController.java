package com.moit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.moit.dto.MeetupDto;
import com.moit.dto.MeetupSearchDto;
import com.moit.security.CustomUser;
import com.moit.security.CustomUserDetailsService;
import com.moit.service.UserMeetupService;
import com.moit.util.PagingUtil;

@Controller
@RequestMapping("/meetup/user")
public class UserMeetupController {
	@Autowired UserMeetupService userMeetupService;
	
	@RequestMapping("/list.do")
	public String serchByUser(Model model, MeetupSearchDto meetupSerchDto, @RequestParam(value="pstartno", defaultValue="1") int pstartno) {
		//System.out.println(meetupSerchDto);
		model.addAttribute("menu", "meetup");
		model.addAttribute("sidoList", userMeetupService.findAllSido());
		model.addAttribute("categoryList", userMeetupService.findAllCategory());
		model.addAttribute("paging", new PagingUtil(userMeetupService.selectUserMeetupTotalCnt(meetupSerchDto), pstartno));
		model.addAttribute("serchList", userMeetupService.searchByUser(pstartno,meetupSerchDto));	
		return "meetup/user/list";
	}
	
	@RequestMapping("/detail.do")
	public String write(Model model, int meetupId) {
		model.addAttribute("detailList", userMeetupService.selectMeetupDetail(meetupId));
		return "meetup/user/detail";
	}
	
	@RequestMapping(value="/write.do", method = RequestMethod.GET)
	public String write(Model model) {
		model.addAttribute("sigunguList", userMeetupService.findAllSigungu());
		return "meetup/user/write";
	}
	
	@RequestMapping(value="/write.do", method = RequestMethod.POST)
	public String write_post(Model model, MeetupDto meetupdto, RedirectAttributes rttr, Authentication authentication) {
		// 멤버완료 취합 후 적용
//		CustomUser user = (CustomUser) authentication.getPrincipal();		
//		int memberId = userMeetupService.findByMamberId(user.getUsername());		
//		meetupdto.setMemberId(memberId);
		
		meetupdto.setMemberId(1);
		boolean result = userMeetupService.insertMeetup(meetupdto) > 0;		
		model.addAttribute("result", result);		
		return "redirect:/meetup/user/detail.do?meetupId=" + meetupdto.getMeetupId();
	}
	
	
	
	
}
