package com.moit.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    	Map<String, Integer> map = new HashMap<>();
        map.put("start", 0);
        map.put("end", 10);
        
        return questionMapper.findAll(map);
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
    
    //질문 수정
    public void updateQuestion(QuestionDto dto) {
        questionMapper.updateQuestion(dto);
    }

    //질문 삭제
    public void deleteQuestion(int questionId) {
        questionMapper.deleteQuestion(questionId);
    }
    
    //전체 문의 수 조회
    public int getAllCnt() {
        return questionMapper.findAllCnt();
    }

    //답변 대기 문의 수 조회
    public int getPendingCnt() {
        return questionMapper.findPendingCnt();
    }

    //답변 완료 문의 수 조회
    public int getAnsweredCnt() {
        return questionMapper.findAnsweredCnt();
    }

    //오늘 등록된 문의 수 조회
    public int getTodayCnt() {
        return questionMapper.findTodayCnt();
    }
}