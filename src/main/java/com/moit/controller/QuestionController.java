package com.moit.controller;

import lombok.RequiredArgsConstructor;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.moit.dto.AnswerDto;
import com.moit.dto.QuestionDto;
import com.moit.service.AnswerService;
import com.moit.service.QuestionService;

/**
문의 화면 요청 처리 Controller
*/
@Controller
@RequestMapping("/questions")
@RequiredArgsConstructor
public class QuestionController {

    private final QuestionService questionService;
    private final AnswerService answerService;

 // 문의 목록 화면
    @GetMapping
    public String list( @RequestParam(defaultValue = "1") int page, Model model) {
        int pageSize = 10;
        int start = (page - 1) * pageSize;
        List<QuestionDto> list = questionService.getList(start, pageSize);

        int totalCnt = questionService.getAllCnt();
        int totalPage = (int)Math.ceil((double)totalCnt / pageSize);

        model.addAttribute("list", list);

        model.addAttribute("page", page);
        model.addAttribute("totalPage", totalPage);
        
        // 전체 문의 수
        model.addAttribute("allCnt", questionService.getAllCnt());
        // 답변 대기 문의 수
        model.addAttribute("pendingCnt", questionService.getPendingCnt());
        // 답변 완료 문의 수
        model.addAttribute("answeredCnt", questionService.getAnsweredCnt());
        // 오늘 등록된 문의 수
        model.addAttribute("todayCnt", questionService.getTodayCnt());
        return "question/answerList";
    }

    // 모임글 문의 등록
    @GetMapping("/write")
    public String write(QuestionDto dto) {
        //questionService.register(dto);
        return "qna/admin/moquestion1";
    }
    
    // 모임글 문의 등록
    @PostMapping("/write")
    public String writePost(QuestionDto dto, RedirectAttributes rttr) {
    	
        questionService.register(dto);
        rttr.addFlashAttribute("msg", "문의가 등록되었습니다.");
        return "redirect:/questions/" + dto.getQuestionId();
    }
    
    // 관리자 문의 등록
    @GetMapping("/adminWrite")
    public String adminWrite(QuestionDto dto) {
        //questionService.register(dto);
        return "qna/admin/adquestion1";
    }
    
    // 관리자 문의 등록
    @PostMapping("/adminWrite")
    public String adminWritePost(QuestionDto dto, RedirectAttributes rttr) {
    	
        questionService.register(dto);
        rttr.addFlashAttribute("msg", "문의가 등록되었습니다.");
        return "redirect:/questions/adquestion2";
    }   
    
    // 문의 상세 화면 + 답변 조회
    @GetMapping("/{id}")
    public String detail(@PathVariable int id, Model model) {
        model.addAttribute("data", questionService.getDetail(id));
        return "qna/admin/moquestion2";
    }

    // 문의 수정 화면 이동
    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable int id, Model model) {
        model.addAttribute("data", questionService.getDetail(id));
        return "question/edit";
    }

    // 문의 수정 처리
    @PostMapping("/edit")
    public String edit(QuestionDto dto) {
        questionService.updateQuestion(dto);
        return "redirect:/questions/" + dto.getQuestionId();
    }

    // 문의 삭제 처리
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id) {
        questionService.deleteQuestion(id);
        return "redirect:/questions";
    }

    // 답변 등록 (관리자 전용)
    @PostMapping("/answer")
    public String answerWrite(AnswerDto dto) {
    	// 답변 등록 + 문의 상태 변경
        answerService.register(dto);
        return "redirect:/questions/" + dto.getQuestionId();
    }
    
    // 사용자측 페이징
    @GetMapping("/myQuestion")
    public String myQuestion(@RequestParam(defaultValue="1") int page,
            HttpSession session,Model model) {
        QuestionDto loginUser = (QuestionDto)session.getAttribute("loginUser");
        
        //int memberId = loginUser.getMemberId();
        int memberId = 1; // 임시
        int pageSize = 10;
        int start = (page - 1) * pageSize;
        List<QuestionDto> list =
                questionService.getMyQuestions(
                        memberId,
                        start,
                        pageSize);
        int totalCnt =
                questionService.getMyQuestionCnt(memberId);
        int totalPage =
                (int)Math.ceil((double)totalCnt / pageSize);

        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("totalPage", totalPage);

        return "qna/admin/moquestion2";
    }
}