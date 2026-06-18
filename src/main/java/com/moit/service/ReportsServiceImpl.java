package com.moit.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moit.dao.ReportsMapper;
import com.moit.dto.ReportsDto;

@Service
public class ReportsServiceImpl implements ReportsService {
	@Autowired ReportsMapper dao;
}
