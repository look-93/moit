package com.moit.service;

import java.util.List;

import com.moit.dto.MeetupDto;
import com.moit.dto.MeetupImageDto;
import com.moit.dto.MeetupSearchDto;
import com.moit.dto.common.CategoryDto;
import com.moit.dto.common.SidoDto;
import com.moit.dto.common.SigunguDto;

public interface UserMeetupService {
	public List<MeetupDto> searchByUser(int pstartno,MeetupSearchDto meetupSearchDto);
	public int selectUserMeetupTotalCnt(MeetupSearchDto meetupSearchDto);	
	public MeetupDto selectMeetupDetail(int meetupId);
	public MeetupImageDto selectMeetupImage(int meetupId);
	public int insertMeetup(MeetupDto meetupDto);
	
	public List<SidoDto> findAllSido();
	public List<SigunguDto> findAllSigungu();
	public List<CategoryDto> findAllCategory();
	public int findByMamberId(String loginId);	
}
