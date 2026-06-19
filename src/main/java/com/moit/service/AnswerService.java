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
    
 // 답변 등록 + 문의 상태 업데이트
    public void register(AnswerDto dto) {

        // 1. 답변 등록
        answerMapper.insertAnswer(dto);

        // 2. 문의 상태를 답변완료로 변경
        questionMapper.updateStatusAnswered(dto.getQuestionId());
    }
}
