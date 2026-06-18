package com.moit.dao;

import java.util.HashMap;
import java.util.List;

import com.moit.dto.ReportsDto;

@Mapper
public interface ReportsMapper {

	// ===== user =====
	// ===== user =====
	// 유저 - 신고 작성 /     서비스에서  - target_type  (MEETUP , REVIEW )
	public int insertUserReport(ReportsDto dto);
	
	// 유저 - 사용자 본인이 작성한 신고 내역 수정
	public int updateUserReport(ReportsDto dto);

	// 유저 - 사용자 본인이 작성한 신고 내역 삭제 -> update delete_yn = y
	public int deleteUserReport(ReportsDto dto);

	// 유저 - 사용자 본인이 작성한 신고 목록 조회 ( delete_yn = 'N' )
	public List<ReportsDto> selectUserReport( HashMap<String, Object> map );

	// select id="selectUserCnt" resultType="int"
	public int selectUserCnt(int memberId);
	
	// 유저 - 사용자 본인이 작성한 신고 내역 상세 조회
	public ReportsDto selectUserReportDetail(ReportsDto dto);

	
	// ===== admin =====
	// ===== admin =====
	// 관리자 - 신고 상태 변경 - PENDING(처리대기) - APPROVED(신고완료)
	public int updateAdmin(ReportsDto dto);

	// 관리자 - 신고 강제 삭제 → delete
	public int deleteAdmin(int reportId);
	
	// 관리자 - 전체 신고 대상 목록 조회
	public List<ReportsDto> selectAdminReport( HashMap<String, Object> map );
	
	// <select id="selectAdminCnt" resultType="int">
	public int selectAdminCnt();
	
	// 관리자 - 신고 대상 유형별 목록 조회 - MEETUP & REVIEW
	public List<ReportsDto> selectAdminType( HashMap<String, Object> map );

	// 관리자 - 전체 신고 목록 상세 조회
	public ReportsDto selectAdminDetail(int reportId);

	// 관리자 - 신고 검색(작성자) - 관리자
	public List<ReportsDto> selectAdminMember(int memberId);
	// 관리자 - 신고 검색(사유) - 관리자
	public List<ReportsDto> selectAdminReason(String reasonCode);
	// 관리자 - 신고 검색(날짜) - 관리자
	public List<ReportsDto> selectAdminCreateAt(String createdAt);
	
	
	// 유저 - 페이징 
	// 관리자 - 페이징
	
	
	// 사유별 신고 건수 집계
	public List<ReportsDto> selectReasonReportCount();
	
	// 회원별 누적 신고 횟수
	public List<ReportsDto> selectMemberReportCount();
	
	// 대상별 신고 현황 (모임/후기)
	public List<ReportsDto> selectTargetReportCount();
	
	
}
