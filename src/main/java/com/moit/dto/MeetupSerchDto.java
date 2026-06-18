package com.moit.dto;

import lombok.Data;

@Data
public class MeetupSerchDto {
	// 검색조건
	private String searchType;
    private String searchText;
    private String status;
    private int start;
    private int end;
   	
}
