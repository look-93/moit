package com.moit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.moit.dto.UserDto;
import com.moit.service.ReportsService;

@Controller
public class ReportController { // test lcy
	@Autowired ReportsService service;
	
//	// 신고 작성 화면
//	@RequestMapping( value="/report/user/write", method = RequestMethod.GET  )
//	public String reportWriteForm() { return "report/user/write"; }
//	// 신고 작성 화면 - 등록
//	@RequestMapping( value="/report/user/write", method = RequestMethod.POST  )
//	public String reportWriteForm_post() { return "redirct:/report/user/write"; }
//	
//	// 내 신고내역 화면
//	@RequestMapping( value="/report/user/mylist", method = RequestMethod.GET  )
//	public String reportMylist() { return "report/user/mylist"; }
//	
//	// 내 신고 상세 화면
//	@RequestMapping("/report/user/detail.do")
//	public String reportDetail(int report
//			
			
//			Id, Model model) {
//		model.addAttribute("dto", service.selectUserReportDetail(null));
//		return "report/user/detail";
//	}
	
	// 신고 수정 화면
	
	// 삭제 확인창
	
	// 관리자 신고목록 화면
	
	// 관리자 신고 상세 화면
}