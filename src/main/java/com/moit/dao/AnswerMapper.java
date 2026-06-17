package com.moit.dao;

import com.moit.dto.AnswerDto;

@Mapper
public interface AnswerMapper {

    // 질문별 답변 조회 (1:1 구조)
    AnswerDto findByQuestionId(int questionId);

    // 답변 등록
    void insertAnswer(AnswerDto dto);
}