package com.moit.dao;

import java.util.HashMap;
import java.util.List;

import com.moit.dto.MeetupDto;
import com.moit.dto.MeetupSerchDto;

@Mapper
public interface MeetupMapper {
	// 모집글!!!!!!!
	// 모집조회	
	//paging
	public List<MeetupDto> meetupList10(HashMap<String, Integer> map);
	
	//검색조건+paging
	public List<MeetupDto> serchByAdmin(MeetupSerchDto meetupSerchDto);
	public int selectMeetupTotalCnt(MeetupSerchDto meetupSerchDto);
	
	//삭제
	public int deleteByMeetup(int meetupId);
	
	
}
