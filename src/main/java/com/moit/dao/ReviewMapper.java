package com.moit.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.moit.dto.ReviewDto;

@Mapper
public interface ReviewMapper {
	
	//시용자
	public int insertUserReview (ReviewDto dto);
	public List<ReviewDto>selectUserReview (int meetupId);
	public List<ReviewDto>selectReviewPopular();
	public int updateUserReview(ReviewDto dto);
	public int deleteUserReview(ReviewDto dto);
	public int updateUserReviewHide(ReviewDto dto);
	public List<ReviewDto> selectReviewsByMemberId(@Param("memberId") int memberId, @Param("sort") String sort);
	
	//관리자
	public List<ReviewDto>adminSelectReviewList(int memberId);
	public List<ReviewDto>adminSearchReviewByContent(String keyword);
	public List<ReviewDto>adminSearchReviewByWriter (int memberId);
	public int adminHideReview(int id);
	public int adminDeleteReview(int id);
	
	
	
}
