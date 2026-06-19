package com.moit.dao;

import java.util.List;
import java.util.Map;

import com.moit.dto.QuestionDto;

@Mapper
public interface QuestionMapper {

    // 전체 질문 목록
	List<QuestionDto> findAll(Map<String, Integer> map);

    // 질문 상세 조회
    QuestionDto findById(int questionId);

    // 질문 등록
    void insertQuestion(QuestionDto dto);
    
    // 답변이 등록 시, 상태 변경
    void updateStatusAnswered(int questionId);
    
    // 문의 수정
    void updateQuestion(QuestionDto dto);

    // 문의 삭제
    void deleteQuestion(int questionId);
    
    // 제목, 내용, 등록일로 검색
    List<QuestionDto> findBySearch(QuestionDto dto);
    
    // 전체 문의 수
    int findAllCnt();

    // 답변 대기 수
    int findPendingCnt();

    // 답변 완료 수
    int findAnsweredCnt();

    // 오늘 등록 수
    int findTodayCnt();
    
    
    
}