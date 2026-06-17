package com.moit.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class AnswerDto {

    private int answerId;
    private int questionId;
    private int memberId;

    private String content;
    private String isPublic;
    private String deleteYn;
    
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    // 추가 (관리자 이름 등)
    private String memberName;
}