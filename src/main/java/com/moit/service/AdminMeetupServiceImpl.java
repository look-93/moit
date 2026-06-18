package com.moit.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moit.dao.MeetupMapper;
import com.moit.dto.MeetupDto;
import com.moit.dto.MeetupSerchDto;


@Service
public class AdminMeetupServiceImpl implements AdminMeetupService{
	
	@Autowired MeetupMapper meetupMapper;
	
	

	@Override
	public List<MeetupDto> serchByAdmin(int pstartno,MeetupSerchDto meetupSerchDto) {	
		meetupSerchDto.setEnd(10);
		meetupSerchDto.setStart((pstartno-1)*10);
		return meetupMapper.serchByAdmin(meetupSerchDto);
	}

	@Override
	public int selectMeetupTotalCnt(MeetupSerchDto meetupSerchDto) {
		return meetupMapper.selectMeetupTotalCnt(meetupSerchDto);
	}

	@Override
	public int deleteByMeetup(int meetupId) {		
		return meetupMapper.deleteByMeetup(meetupId);
	}	
	
	
	
	
	

}
