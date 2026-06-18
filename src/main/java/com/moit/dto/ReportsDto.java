package com.moit.dto;

import lombok.Data;

@Data
public class ReportsDto {
	private int reportId;		//신고고유id
	private String targetType;	//신고대상유형 (모임, 후기) 'MEETUP', 'REVIEW'
	private int targetId;		//신고대상id (모임id or 후기id)
	private int memberId;		//신고한 회원id
	private String reasonCode;	//신고 사유 코드 ('ABUSE', 'SPAM', 'FAKE_INFO', 'AD', 'ETC')
	private String reasonDetail;//상세 설명 (etc = 선택적으로 기록)
	private String status;		//처리상태 ('PENDING', 'APPROVED')
	private String deleteYn;	//삭제여부
	private String createdAt;	//생성일시
	private String updatedAt;	//수정일시
	
//	private int reportCount;	// 신고 건수
}
