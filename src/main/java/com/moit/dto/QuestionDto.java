package com.moit.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class QuestionDto {

    private int questionId;
    private int parentId;
    private int memberId;

    private String category;   // MEETUP, ADMIN
    private String content;

    private String status;     // PENDING, ANSWERED
    private String isPublic;
    private String deleteYn;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    // JOIN¿ë (¼±ÅÃ)
    private String memberName;
    private AnswerDto answer;
}