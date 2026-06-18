package com.moit.dto;

import java.time.LocalDateTime;

public class AdvertisementDto {
	private int adId;                // 광고번호

	private String title;            // 광고제목
	private String adName;           // 광고주명
	private String content;          // 광고내용

	private String landingUrl;       // 클릭 시 이동할 외부링크

	private String adType;           // BANNER / POPUP / VIDEO

	private String position;         // 노출 위치

	private LocalDateTime startDatetime; // 시작일
	private LocalDateTime endDatetime;   // 종료일

	private String status;           // OPEN / PENDING / CLOSED

	private int impressions;         // 노출수
	private int clicks;              // 클릭수

	private int priority;            // 우선순위

	private int totalBudget;  // 예산

	private int authorId;            // 등록자

	private String deleteYn;         // 삭제여부

	private LocalDateTime createdAt; // 등록일
	private LocalDateTime updatedAt; // 수정일
}
