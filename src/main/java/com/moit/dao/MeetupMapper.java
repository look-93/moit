package com.moit.dao;

import java.util.List;

import com.moit.dto.MeetupDto;
import com.moit.dto.MeetupImageDto;
import com.moit.dto.MeetupSerchDto;
import com.moit.dto.common.SidoDto;

@Mapper
public interface MeetupMapper {
	
	//admin
	public List<MeetupDto> serchByAdmin(MeetupSerchDto meetupSerchDto);
	public int selectMeetupTotalCnt(MeetupSerchDto meetupSerchDto);	
	public int deleteByMeetup(int meetupId);
	
	//user
	public List<SidoDto> findAllSido();
	public List<MeetupDto> serchByUser(MeetupSerchDto meetupSerchDto);
	public int selectUserMeetupTotalCnt(MeetupSerchDto meetupSerchDto);	
	public MeetupDto selectMeetupDetail(int meetupId);
	public MeetupImageDto selectMeetupImage(int meetupId);
	
}
