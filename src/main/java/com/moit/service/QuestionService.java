package com.moit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.moit.dao.AnswerMapper;
import com.moit.dao.QuestionMapper;
import com.moit.dto.AnswerDto;
import com.moit.dto.QuestionDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QuestionService {

    private final QuestionMapper questionMapper;
    private final AnswerMapper answerMapper;

    //전체 질문 목록 조회
    public List<QuestionDto> getList() {
        return questionMapper.findAll();
    }

    //질문 상세 조회 + 답변 포함
    public QuestionDto getDetail(int id) {
    	//질문 정보 조회
        QuestionDto question = questionMapper.findById(id);
        //해당 질문의 답변 조회
        AnswerDto answer = answerMapper.findByQuestionId(id);
        
        question.setAnswer(answer);
        return question;
    }
    
    //질문 등록
    public void register(QuestionDto dto) {
        questionMapper.insertQuestion(dto);
    }
}