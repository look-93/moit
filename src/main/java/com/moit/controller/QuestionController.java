package com.moit.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.moit.dto.AnswerDto;
import com.moit.dto.QuestionDto;
import com.moit.service.AnswerService;
import com.moit.service.QuestionService;

/**
 * 질문 화면 요청 처리 Controller
 */
@Controller
@RequestMapping("/questions")
@RequiredArgsConstructor
public class QuestionController {

    private final QuestionService questionService;
    private final AnswerService answerService;

    //질문 목록 화면
    @GetMapping
    public String list(Model model) {
    	// 문의 목록 조회
        model.addAttribute("list", questionService.getList());
        
        // 전체 문의 수
        model.addAttribute("allCnt", questionService.getAllCnt());

        // 답변 대기 문의 수
        model.addAttribute("pendingCnt", questionService.getPendingCnt());

        // 답변 완료 문의 수
        model.addAttribute("answeredCnt", questionService.getAnsweredCnt());

        // 오늘 등록된 문의 수
        model.addAttribute("todayCnt", questionService.getTodayCnt());
        return "question/list";
    }

    //질문 상세 화면 + 답변 포함
    @GetMapping("/{id}")
    public String detail(@PathVariable int id, Model model) {
        model.addAttribute("data", questionService.getDetail(id));
        return "question/detail";
    }

    //질문 수정 화면 이동
    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable int id, Model model) {
        model.addAttribute("data", questionService.getDetail(id));
        return "question/edit";
    }

    //질문 수정 처리
    @PostMapping("/edit")
    public String edit(QuestionDto dto) {
        questionService.updateQuestion(dto);
        return "redirect:/questions/" + dto.getQuestionId();
    }

    //질문 삭제 처리
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id) {
        questionService.deleteQuestion(id);
        return "redirect:/questions";
    }

    //답변 등록 (관리자 기능)
    @PostMapping("/answer")
    public String answerWrite(AnswerDto dto) {
        // 답변 저장 + 질문 상태 변경
        answerService.register(dto);
        return "redirect:/questions/" + dto.getQuestionId();
    }
}