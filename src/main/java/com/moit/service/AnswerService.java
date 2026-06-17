package com.moit.service;

import org.springframework.stereotype.Service;

import com.moit.dao.AnswerMapper;
import com.moit.dao.QuestionMapper;
import com.moit.dto.AnswerDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AnswerService {

    private final AnswerMapper answerMapper;
    private final QuestionMapper questionMapper;
    
    // 답변 등록 + 질문 상태 업데이트
    public void register(AnswerDto dto) {

        // 1. 답변 저장
        answerMapper.insertAnswer(dto);

        // 2. 질문 상태 변경
        questionMapper.updateStatusAnswered(dto.getQuestionId());
    }
}
