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
	public List<MeetupDto> serchByAdmin(int pstartno, MeetupSerchDto meetupSerchDto) {
		HashMap<String, Object> map = new HashMap<>();	
		String convertedStatus = "";
		String searchType = meetupSerchDto.getSearchType();
		
		map.put("start", (pstartno-1)*10);
		map.put("end", 10);		
		
		map.put("title", meetupSerchDto.getSearchText());
		if ("모집중".equals(searchType)) {
	        convertedStatus = "RECRUITING";
	    } else if ("모집마감".equals(searchType)) {
	        convertedStatus = "CLOSED";
	    } else if ("취소".equals(searchType)) {
	        convertedStatus = "CANCELED";
	    } else {
	        // "상태" 이거나 null이거나 빈 문자열일 때 포함
	        convertedStatus = ""; 
	    }
		map.put("status", convertedStatus);
		return meetupMapper.serchByAdmin(map);
	}

	@Override
	public int selectMeetupTotalCnt() {
		return meetupMapper.selectMeetupTotalCnt();
	}

	@Override
	public int deleteByMeetup(int meetupId) {		
		return meetupMapper.deleteByMeetup(meetupId);
	}	
	
	
	
	
	

}
