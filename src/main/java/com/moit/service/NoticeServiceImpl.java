package com.moit.service;

import java.util.List;
import com.moit.dao.NoticeMapper;
import com.moit.dto.NoticeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public List<NoticeDto> selectnoticelist() {
    	return noticeMapper.selectnoticelist();
    }
}
