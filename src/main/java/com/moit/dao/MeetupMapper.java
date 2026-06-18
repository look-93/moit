package com.moit.dao;

import java.util.List;

import com.moit.dto.MeetupDto;
import com.moit.dto.MeetupSerchDto;
import com.moit.dto.common.SidoDto;

@Mapper
public interface MeetupMapper {
	// 모집글!!!!!!!	
	
	//admin
	//검색조건+paging
	public List<MeetupDto> serchByAdmin(MeetupSerchDto meetupSerchDto);
	public int selectMeetupTotalCnt(MeetupSerchDto meetupSerchDto);	
	//삭제
	public int deleteByMeetup(int meetupId);
	
	//user
	//시도조회
	public List<SidoDto> findAllSido();
	public List<MeetupDto> serchByUser(MeetupSerchDto meetupSerchDto);
	public int selectUserMeetupTotalCnt(MeetupSerchDto meetupSerchDto);	
	
}