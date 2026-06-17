package com.moit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdvertisementController {
	
	@RequestMapping("/meetup/admin/ad.do")
    public String adMain() {
        return "meetup/admin/ad";
    }
}
