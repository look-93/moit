package com.moit.service;

import java.util.HashMap;
import java.util.List;

import com.moit.dto.MeetupDto;
import com.moit.dto.MeetupSerchDto;

public interface AdminMeetupService {
	public List<MeetupDto> serchByAdmin(int pstartno, MeetupSerchDto meetupSerchDto);
	public int selectMeetupTotalCnt();
	public int deleteByMeetup(int meetupId);
}

