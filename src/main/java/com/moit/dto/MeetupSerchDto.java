package com.moit.dto;

import lombok.Data;

@Data
public class MeetupSerchDto {
	// 모집 검색 조건 Dto
	private String searchType;
    private String searchText;
    private String status;
    private int start;
    private int end;
   	private int sidoId;
   	private String orderType;
   	
}
