package com.moit.service;

import java.util.List;

import com.moit.dto.AdvertisementDto;
import com.moit.dto.AdvertisementSearchDto;

public interface AdvertisementService {

    // 목록 + 검색 + 페이징
    List<AdvertisementDto> searchByAdmin(AdvertisementSearchDto dto);

    // 전체 개수
    int selectAdvertisementTotalCnt(AdvertisementSearchDto dto);

    // 상세
    AdvertisementDto selectAdvertisementOne(int adId);

    // 등록
    int insertAdvertisement(AdvertisementDto dto);

    // 수정
    int updateAdvertisement(AdvertisementDto dto);

    // 삭제 (논리삭제)
    int deleteAdvertisement(int adId);

    // 상태 변경
    int updateAdvertisementStatus(AdvertisementDto dto);

    // 클릭 수 증가
    int updateAdvertisementClick(int adId);

    // 노출 수 증가
    int updateImpressions(int adId);
}
