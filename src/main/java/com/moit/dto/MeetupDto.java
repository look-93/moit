package com.moit.dto;

import lombok.Data;

@Data
public class MeetupDto {
	private int meetupId;
	private int memberId;
	private String title;
	private String content;
	private int maxParticipants;
	private int minParticipants;
	private int sigunguId;
	private int categoryId;
	private String address;
	private String meetupAt;
	private String deleteYn;
	private String createdAt;
	private String updatedAt;
	private String status;
	
	private int meetupNo;
	private int totalParticipants; //총 모집 신청인원
	private int imagePath;	
	
}