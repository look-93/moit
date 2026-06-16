package com.moit.controller;

import java.util.List;
import com.moit.dto.NoticeDto;
import com.moit.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @GetMapping("/notice/list")
    public String noticelist(Model model) {
        
        List<NoticeDto> list = noticeService.selectnoticelist();
        model.addAttribute("noticelist", list);
        
        return "notices/list";
    }
}
