package com.moit.dao;

import java.util.List;

import com.moit.dto.ReportDto;

@Mapper
public interface ReportsMapper {

	// ===== MEETUP user =====
	// ===== MEETUP user =====
	// 모임 신고 작성
	public int insertUserMeetup(ReportDto dto);

	// 전체 모임 신고 목록 조회
	public List<ReportDto> selectUserMeetupAll();

	// 사용자 본인이 작성한 모임 신고 내역 상세 조회
	public ReportDto selectUserMeetupDetail(ReportDto dto);

	// 사용자 본인이 작성한 모임 신고 내역 수정
	public int updateUserMeetup(ReportDto dto);

	// 사용자 본인이 작성한 모임 신고 내역 삭제
	public int deleteUserMeetup(ReportDto dto);

	
	// ===== MEETUP admin =====
	// ===== MEETUP admin =====
	// 전체 모임 신고 목록 조회
	public List<ReportDto> selectAdminMeetupAll();

	// 전체 모임 신고 목록 상세 조회
	public ReportDto selectAdminMeetupDetail(int id);

	// 모임 신고 상태 변경 - PENDING(처리대기) or APPROVED(신고완료)
	public int updateAdminMeetup(ReportDto dto);

	// 모임 신고 삭제
	public int deleteAdminMeetup(ReportDto dto);

	
	// ===== REVIEW user =====
	// ===== REVIEW user =====
	// 후기 신고 작성
	public int insertUserReview(ReportDto dto);

	// 전체 후기 신고 내역 조회
	public List<ReportDto> selectUserReviewAll();

	// 사용자 본인이 작성한 후기 신고 내역 상세 조회
	public ReportDto selectUserReviewDetail(ReportDto dto);

	// 사용자 본인이 작성한 후기 신고 내역 수정
	public int updateUserReview(ReportDto dto);

	// 사용자 본인이 작성한 후기 신고 내역 삭제 → update delete_yn
	public int deleteUserReview(ReportDto dto);

	
	// ===== REVIEW admin =====
	// ===== REVIEW admin =====
	// 전체 후기 신고 목록 조회
	public List<ReportDto> selectAdminReviewAll();

	// 전체 후기 신고 목록 상세 조회
	public ReportDto selectAdminReviewDetail(int id);

	// 후기 신고 상태 변경 - PENDING(처리대기) - APPROVED(신고완료)
	public int updateAdminReview(ReportDto dto);

	// 후기 신고 삭제 → update delete_yn
	public int deleteAdminReview(ReportDto dto);

}
