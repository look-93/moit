package com.moit.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.moit.dto.AdvertisementDto;
import com.moit.dto.AdvertisementSearchDto;
import com.moit.service.AdvertisementService;

@Controller
@RequestMapping("/advertisement/admin")
public class AdvertisementController {
	
	@Autowired
    private AdvertisementService advertisementService;

    @GetMapping("/adList.do")
    public String adList(AdvertisementSearchDto dto, Model model) {
    	
    	// 1. 페이지 기본값
    	int page = dto.getPage();
    	int size = dto.getSize();

    	if (page <= 0) page = 1;
        if (size <= 0) size = 10;
        
     // 2. offset 계산
        int offset = (page - 1) * size;

        dto.setPage(page);
        dto.setSize(size);
        dto.setOffset(offset);
        
     // 3. 리스트
        List<AdvertisementDto> list =
                advertisementService.searchByAdmin(dto);

        // 4. 전체 개수
        int totalCnt =
                advertisementService.selectAdvertisementTotalCnt(dto);

        // 5. 페이지 계산
        int totalPage =
                (totalCnt <= 0) ? 1 : (int) Math.ceil((double) totalCnt / size);

        model.addAttribute("list", list);
        model.addAttribute("totalCnt", totalCnt);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("dto", dto);

    	
        return "advertisement/admin/adList";
    }
    
    @GetMapping("/adWrite.do")
    public String writePage() {
    	return "advertisement/admin/adWrite"; // JSP 경로
    }
    
    // 등록 처리
    @PostMapping("/adWriteAction.do")
    public String insertAdvertisement(
            AdvertisementDto dto,
            @RequestParam("imageFile") MultipartFile file,
            HttpSession session) {

        try {

            // 1. 로그인 사용자 (작성자)
        	Object loginUserIdObj = session.getAttribute("loginUserId");

        	if (loginUserIdObj == null) {
        	    throw new RuntimeException("로그인이 필요합니다.");
        	}

        	dto.setAuthorId((Integer) loginUserIdObj);

            // 2. 파일 업로드 처리
        	if (file != null && !file.isEmpty()) {

        		String uploadPath = session.getServletContext().getRealPath("/upload/ad/");

                String originalName = file.getOriginalFilename();
                String uuid = UUID.randomUUID().toString();
                String savedFileName = uuid + "_" + originalName;

                File dir = new File(uploadPath);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                File saveFile = new File(dir, savedFileName);

                file.transferTo(saveFile);

                // DB 저장용 경로
                dto.setImageUrl("/upload/ad/" + savedFileName);
            }

            // 3. DB insert
            advertisementService.insertAdvertisement(dto);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/advertisement/admin/adList.do";
    }

    // 상세 페이지
    @GetMapping("/adDetail.do")
    public String detailPage(@RequestParam int adId, Model model) {

        AdvertisementDto dto = advertisementService.selectAdvertisementOne(adId);
        model.addAttribute("dto", dto);

        return "advertisement/admin/adDetail";
    }
    
 // 수정 페이지
    @GetMapping("/adUpdate.do")
    public String updatePage(@RequestParam(required = false) Integer adId, Model model) {
    	System.out.println("adId = " + adId);
        if (adId == null) {
            return "redirect:/advertisement/admin/adList.do";
        }

        AdvertisementDto dto = advertisementService.selectAdvertisementOne(adId);
        model.addAttribute("dto", dto);

        return "advertisement/admin/adEdit";
    }

    // 수정 처리
    @PostMapping("/adEdit.do")
    public String updateAction(AdvertisementDto dto,
                               @RequestParam(value = "imageFile", required = false) MultipartFile file,
                               HttpSession session) {
    	
    	System.out.println(dto.getAdId());
    	System.out.println(dto.getTitle());
    	System.out.println(dto.getContent());

        try {

            // 이미지 수정 시만 업로드
            if (file != null && !file.isEmpty()) {

                String uploadPath = session.getServletContext().getRealPath("/upload/ad/");

                File dir = new File(uploadPath);
                if (!dir.exists()) dir.mkdirs();

                String uuid = UUID.randomUUID().toString();
                String savedFileName = uuid + "_" + file.getOriginalFilename();

                file.transferTo(new File(dir, savedFileName));

                dto.setImageUrl("/upload/ad/" + savedFileName);
            }

            advertisementService.updateAdvertisement(dto);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/advertisement/admin/adDetail.do?adId=" + dto.getAdId();
    }
    
    @PostMapping("/updateStatusAjax.do")
    @ResponseBody
    public String updateStatusAjax(@RequestBody AdvertisementDto dto,
                                   HttpSession session,
                                   @RequestParam(required = false) Boolean testMode) {

        // 🔥 테스트 모드: 로그인 없이 강제 세팅
        if (Boolean.TRUE.equals(testMode)) {
            session.setAttribute("loginUserId", 4);
        }

        System.out.println("adId = " + dto.getAdId());
        System.out.println("status = " + dto.getStatus());

        try {
            advertisementService.updateAdvertisementStatus(dto);
            return "OK";
        } catch (Exception e) {
            e.printStackTrace();
            return "FAIL";
        }
    }
    
    // 목록에서 상태변경
    /*@PostMapping("/updateStatusAjax.do")
    @ResponseBody
    public Map<String, String> updateStatusAjax(@RequestBody AdvertisementDto dto) {

        Map<String, String> result = new HashMap<>();
        System.out.println(dto.getAdId());
        System.out.println(dto.getStatus());

        try {
            advertisementService.updateAdvertisementStatus(dto);
            result.put("result", "OK");
        } catch (Exception e) {
            result.put("result", "FAIL");
        }

        return result;
    }*/
    
}