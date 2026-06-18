package com.moit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moit.dao.MeetupMapper;
import com.moit.dto.MeetupDto;
import com.moit.dto.MeetupSerchDto;
import com.moit.dto.common.SidoDto;

@Service
public class UserMeetupServiceImpl implements UserMeetupService{
	@Autowired MeetupMapper meetupMapper;
	
	@Override
	public List<SidoDto> findAllSido() {
		return meetupMapper.findAllSido();
	}

	@Override
	public List<MeetupDto> serchByUser(int pstartno,MeetupSerchDto meetupSerchDto) {
		meetupSerchDto.setEnd(9);
		meetupSerchDto.setStart((pstartno-1)*9);
		return meetupMapper.serchByUser(meetupSerchDto);
	}

	@Override
	public int selectUserMeetupTotalCnt(MeetupSerchDto meetupSerchDto) {
		return meetupMapper.selectUserMeetupTotalCnt(meetupSerchDto);
	}
	
	
	
}
