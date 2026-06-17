package com.moit.dao;

import java.util.HashMap;
import java.util.List;

import com.moit.dto.MeetupDto;

@Mapper
public interface MeetupMapper {
	// 모집글!!!!!!!
	// 모집조회
	public List<MeetupDto> meetupList();
	
	//paging
	public List<MeetupDto> meetupList10(HashMap<String, Integer> map);
	
	
	
}
