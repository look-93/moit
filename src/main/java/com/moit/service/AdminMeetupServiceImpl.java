package com.moit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moit.dao.MeetupMapper;
import com.moit.dto.MeetupDto;


@Service
public class AdminMeetupServiceImpl implements AdminMeetupService{
	
	@Autowired MeetupMapper meetupMapper;
	
	@Override
	public List<MeetupDto> meetupList() {
		return meetupMapper.meetupList();
	}	

}
