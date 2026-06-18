package com.moit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.moit.dto.ReviewDto;
import com.moit.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired ReviewService reviewservice;
	//후기작성 화면 요청
	@RequestMapping( value="/review/insert" , method=RequestMethod.GET  )
	public String insertUserReview() {
		return "review/insert";
	}
	//후기작성 처리 후
	@RequestMapping(value="/review/insert",method=RequestMethod.POST)
	public String insertUserReview_post(ReviewDto dto, RedirectAttributes rttr) {
		boolean result= reviewservice.insertUserReview(dto) == 1;
		rttr.addAttribute("result",result);
		return "review/list";
	}
	//특정모임의 후기목록 조회
	@RequestMapping(value="/review/list",method=RequestMethod.GET)
	public String selectUserReview(@RequestParam("meetupId") int meetupId,Model model) {
		List<ReviewDto> reviewList = reviewservice.selectUserReview(meetupId);
		model.addAttribute("reviewList", reviewList);
		return "redirect:/review/list";
	}
	//인기 후기 조회
	@RequestMapping(value="/review/popular",method=RequestMethod.GET)
	public String selectReviewPopular(Model model) {
		List<ReviewDto> popularList=reviewservice.selectReviewPopular();
		model.addAttribute("popularList",popularList);
		return "review/popular";
	}
	//후기 수정 처리
	@RequestMapping(value="/review/update",method=RequestMethod.POST)
	public String updateUserReview(ReviewDto dto,RedirectAttributes rttr) {
		boolean result=reviewservice.updateUserReview(dto) == 1;
		rttr.addAttribute("meetupId", dto.getMeetupId());
		rttr.addAttribute("updateResult", result);
        return "redirect:/review/list?meetupId=";
	}
	//후기 삭제 처리
	@RequestMapping(value="/review/",method=RequestMethod.POST)
	public String deleteUserReview(ReviewDto dto,RedirectAttributes rttr) {
		boolean result=reviewservice.deleteUserReview(dto)==1;
		rttr.addAttribute("deleteResult",result);
		return "redirect:/review/list?meetupId=" +dto.getMeetupId();
		
		
	}
	
	// 후기 비공개 처리 
	@RequestMapping(value="/review/hide", method=RequestMethod.POST) 
	public String userReviewHide(ReviewDto dto, RedirectAttributes rttr) {
	    
	    // 1. 세션에서 로그인한 유저 정보 꺼내기 (프로젝트 세션 키값에 맞게 'loginUser' 부분을 수정)
	    // MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
	    // int memberId = loginUser.getId();
	    
	    // 우선 컴파일 에러를 막기 위해 세션 주석 처리 후 상수로 명시
	    int memberId = 10;     
	    dto.setMemberId(memberId);   
	    boolean result = reviewservice.updateUserReviewHide(dto) == 1;	    
	    rttr.addAttribute("hideResult", result);
	    return "redirect:/review/list?meetupId=" + dto.getMeetupId();
	}
	
	
	// 전체 후기 조회 목록
    @RequestMapping(value = "/admin/review/list", method = RequestMethod.GET)
    public String adminSelectReviewList(Model model) {
        List<ReviewDto> adminReviewList = reviewservice.adminSelectReviewList();
        model.addAttribute("adminReviewList", adminReviewList);
        return "admin/reviews/list";
    }

    // 후기 내용으로 검색
    @RequestMapping(value = "/admin/review/searchContent", method = RequestMethod.GET)
    public String adminSearchReviewByContent(@RequestParam("keyword") String keyword, Model model) {
        List<ReviewDto> searchList = reviewservice.adminSearchReviewByContent(keyword);
        model.addAttribute("adminReviewList", searchList); // 기존 목록 뷰를 재사용하기 위해 키값을 맞춥니다.
        return "admin/reviews/list";
    }

    // 작성자로 검색
    @RequestMapping(value = "/admin/review/searchWriter", method = RequestMethod.GET)
    public String adminSearchReviewByWriter(@RequestParam("memberId") int memberId, Model model) {
        List<ReviewDto> searchList = reviewservice.adminSearchReviewByWriter(memberId);
        model.addAttribute("adminReviewList", searchList);
        return "admin/review/list";
    }
    
   
    
    //관리자 기능

    // 후기 비공개 처리 
    @RequestMapping(value = "/admin/review/hide", method = RequestMethod.POST)
    @ResponseBody
    public String adminHideReview(@RequestParam("id") int id) {
        int result = reviewservice.adminHideReview(id);
        return result == 1 ? "success" : "fail";
    }

    // 후기 강제 삭제 처리 
    @RequestMapping(value = "/admin/review/delete", method = RequestMethod.POST)
    @ResponseBody
    public String adminDeleteReview(@RequestParam("id") int id) {
        int result = reviewservice.adminDeleteReview(id);
        return result == 1 ? "success" : "fail";
    }
	
}
