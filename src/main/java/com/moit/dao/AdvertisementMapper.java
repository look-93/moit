package com.moit.dao;

import java.util.HashMap;
import java.util.List;

import com.moit.dto.AdvertisementDto;

@Mapper
public interface AdvertisementMapper {

    /* =========================
       기본 CRUD
    ========================== */

    // 등록
    public int insert(AdvertisementDto dto);

    // 수정
    public int update(AdvertisementDto dto);

    // 삭제 (논리삭제 or 실제삭제는 XML에서 처리)
    public int delete(int adId);

    // 단일 조회
    public AdvertisementDto select(int adId);

    // 전체 조회
    public List<AdvertisementDto> selectAll();

    // 노출 수 증가
    public int updateImpressions(int adId);

    // 클릭 수 증가
    public int updateClicks(int adId);

    // 상태 변경 (OPEN / PENDING / CLOSED)
    public int updateStatus(HashMap<String, Object> map);

    // 페이징
    public List<AdvertisementDto> selectPage(HashMap<String, Integer> map);
    public int selectCnt();
    
    // 메인 노출용 (priority + 랜덤/정렬)
    public List<AdvertisementDto> selectMainAds();

    //  조건 조회

    // 활성 광고 (기간 + 상태)
    public List<AdvertisementDto> selectActiveAds();

    // 위치별 광고 (MAIN_TOP, SIDEBAR 등)
    public List<AdvertisementDto> selectByPosition(String position);

    // 타겟 필터 (연령/성별/디바이스)
    public List<AdvertisementDto> selectByTarget(HashMap<String, Object> map);

}