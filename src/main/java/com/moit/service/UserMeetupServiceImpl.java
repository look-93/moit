package com.moit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moit.dao.MeetupMapper;
import com.moit.dto.MeetupDto;
import com.moit.dto.MeetupImageDto;
import com.moit.dto.MeetupSearchDto;
import com.moit.dto.common.CategoryDto;
import com.moit.dto.common.SidoDto;
import com.moit.dto.common.SigunguDto;

@Service
public class UserMeetupServiceImpl implements UserMeetupService{
	@Autowired MeetupMapper meetupMapper;
	
	//모집조회+검색
	@Override
	public List<MeetupDto> searchByUser(int pstartno,MeetupSearchDto meetupSearchDto) {
		meetupSearchDto.setEnd(9);
		meetupSearchDto.setStart((pstartno-1)*9);
		return meetupMapper.searchByUser(meetupSearchDto);
	}
	
	//모집조회+검색
	@Override
	public int selectUserMeetupTotalCnt(MeetupSearchDto meetupSearchDto) {
		return meetupMapper.selectUserMeetupTotalCnt(meetupSearchDto);
	}
	
	//모집상세조회
	@Override
	public MeetupDto selectMeetupDetail(int meetupId) {
		return meetupMapper.selectMeetupDetail(meetupId);
	}
	
	//이미지조회
	@Override
	public MeetupImageDto selectMeetupImage(int meetupId) {
		return meetupMapper.selectMeetupImage(meetupId);
	}
	
	//모집저장
	@Override
	public int insertMeetup(MeetupDto meetupDto) {
		return meetupMapper.insertMeetup(meetupDto);
	}

	// 시도
	@Override
	public List<SidoDto> findAllSido() {
		return meetupMapper.findAllSido();
	}
	
	// 시군구
	@Override
	public List<SigunguDto> findAllSigungu() {
		return meetupMapper.findAllSigungu();
	}
	
	//카테고리
	@Override
	public List<CategoryDto> findAllCategory() {
		return meetupMapper.findAllCategory();
	}

	//login_id로 member_id 찾기
	@Override
	public int findByMamberId(String loginId) {
		return meetupMapper.findByMamberId(loginId);
	}
	
}
