package com.moit.dto;

import lombok.Data;

@Data
public class MeetupDto {
	private int meetup_id;
	private int member_id;
	private String title;
	private String content;
	private int max_participants;
	private int min_participants;
	private int sigungu_id;
	private int category_id;
	private String address;
	private String meetup_datetime;
	private String delete_yn;
	private String created_at;
	private String updated_at;
	
	private int meetup_cnt;
}
