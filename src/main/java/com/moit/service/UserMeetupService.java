package com.moit.service;

import java.util.List;

import com.moit.dto.MeetupDto;
import com.moit.dto.MeetupSerchDto;
import com.moit.dto.common.SidoDto;

public interface UserMeetupService {
	public List<SidoDto> findAllSido();
	public List<MeetupDto> serchByUser(int pstartno,MeetupSerchDto meetupSerchDto);
	public int selectUserMeetupTotalCnt(MeetupSerchDto meetupSerchDto);		
}
