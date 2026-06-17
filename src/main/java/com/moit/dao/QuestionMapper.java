package com.moit.dao;

import java.util.List;

import com.moit.dto.QuestionDto;

@Mapper
public interface QuestionMapper {

    // 전체 질문 목록
    List<QuestionDto> findAll();

    // 질문 상세 조회
    QuestionDto findById(int questionId);

    // 질문 등록
    void insertQuestion(QuestionDto dto);
    
    // 답변이 등록 시, 상태 변경
    void updateStatusAnswered(int questionId);
}