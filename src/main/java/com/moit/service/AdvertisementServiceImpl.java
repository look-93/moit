package com.moit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moit.dao.AdvertisementMapper;
import com.moit.dto.AdvertisementDto;
import com.moit.dto.AdvertisementSearchDto;

@Service
public class AdvertisementServiceImpl implements AdvertisementService {

    @Autowired
    private AdvertisementMapper advertisementMapper;

    // 목록 + 검색 + 페이징
    @Override
    public List<AdvertisementDto> searchByAdmin(AdvertisementSearchDto dto) {
        return advertisementMapper.searchByAdmin(dto);
    }

    // 전체 개수
    @Override
    public int selectAdvertisementTotalCnt(AdvertisementSearchDto dto) {
        return advertisementMapper.selectAdvertisementTotalCnt(dto);
    }

    // 상세
    @Override
    public AdvertisementDto selectAdvertisementOne(int adId) {
        return advertisementMapper.selectAdvertisementOne(adId);
    }

    // 등록
    @Override
    public int insertAdvertisement(AdvertisementDto dto) {
        return advertisementMapper.insertAdvertisement(dto);
    }

    // 수정
    @Override
    public int updateAdvertisement(AdvertisementDto dto) {
        return advertisementMapper.updateAdvertisement(dto);
    }

    // 삭제 (논리삭제)
    @Override
    public int deleteAdvertisement(int adId) {
        return advertisementMapper.deleteAdvertisement(adId);
    }

    // 상태 변경
    @Override
    public int updateAdvertisementStatus(AdvertisementDto dto) {
        return advertisementMapper.updateAdvertisementStatus(dto);
    }

    // 클릭 수 증가
    @Override
    public int updateAdvertisementClick(int adId) {
        return advertisementMapper.updateAdvertisementClick(adId);
    }

    // 노출 수 증가
    @Override
    public int updateImpressions(int adId) {
        return advertisementMapper.updateImpressions(adId);
    }
}