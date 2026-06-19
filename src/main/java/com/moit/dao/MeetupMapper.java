package com.moit.dao;

import java.util.List;

import com.moit.dto.MeetupDto;
import com.moit.dto.MeetupImageDto;
import com.moit.dto.MeetupSearchDto;
import com.moit.dto.common.CategoryDto;
import com.moit.dto.common.SidoDto;
import com.moit.dto.common.SigunguDto;

@Mapper
public interface MeetupMapper {
	
	//admin
	public List<MeetupDto> searchByAdmin(MeetupSearchDto meetupSearchDto);
	public int selectMeetupTotalCnt(MeetupSearchDto meetupSearchDto);	
	public int deleteByMeetup(int meetupId);
	
	//user
	public List<MeetupDto> searchByUser(MeetupSearchDto meetupSearchDto);
	public int selectUserMeetupTotalCnt(MeetupSearchDto meetupSearchDto);	
	public MeetupDto selectMeetupDetail(int meetupId);
	public MeetupImageDto selectMeetupImage(int meetupId);
	public int insertMeetup(MeetupDto meetupDto);
	
	//시도, 시군구
	public List<SidoDto> findAllSido();
	public List<SigunguDto> findAllSigungu();
	
	//카테고리
	public List<CategoryDto> findAllCategory();
	
	//login_id로 member_id 찾기
	public int findByMamberId(String loginId);
	
}