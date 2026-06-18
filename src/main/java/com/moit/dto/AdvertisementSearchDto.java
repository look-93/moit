package com.moit.dto;

import lombok.Data;

@Data
public class AdvertisementSearchDto {

	// 검색조건
	private String searchType;   // title, status 등
	private String searchText;   // 검색어

	// 상태
	private String status;       // OPEN, PENDING, CLOSED

	// 페이징
	private int start;
	private int end;

	// 정렬
	private String orderType;    // latest, priority 등
}