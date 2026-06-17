package com.moit.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.moit.dto.AnswerDto;
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

    /**
     * 질문 목록 화면
     */
    @GetMapping
    public String list(Model model) {
        model.addAttribute("list", questionService.getList());
        return "question/list";
    }

    /**
     * 질문 상세 화면 + 답변 포함
     */
    @GetMapping("/{id}")
    public String detail(@PathVariable int id, Model model) {
        model.addAttribute("data", questionService.getDetail(id));
        return "question/detail";
    }

    /**
     * 답변 등록 (관리자 기능)
     */
    @PostMapping("/answer")
    public String answerWrite(AnswerDto dto) {

        // 답변 저장 + 질문 상태 변경
        answerService.register(dto);

        return "redirect:/questions/" + dto.getQuestionId();
    }
}