package com.moit.service;

import java.util.List;

import com.moit.dto.ReviewDto;

public interface ReviewService {
	//사용자
		public int insertUserReview (ReviewDto dto);
		public List<ReviewDto>selectUserReview (int meetupId);
		public List<ReviewDto>selectReviewPopular();
		public int updateUserReview(ReviewDto dto);
		public int deleteUserReview(ReviewDto dto);
		public int updateUserReviewHide(ReviewDto dto);
		
		//관리자
		public List<ReviewDto>adminSelectReviewList();
		public List<ReviewDto>adminSearchReviewByContent(String keyword);
		public List<ReviewDto>adminSearchReviewByWriter (int memberId);
		public int adminHideReview(int id);
		public int adminDeleteReview(int id);
		
}
