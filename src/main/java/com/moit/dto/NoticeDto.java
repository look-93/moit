package com.moit.dto;

import java.time.LocalDateTime;
import lombok.Data;

@Data
public class NoticeDto {
    private int id;
    private int member_id;
    private String title;
    private String content;
    private int view_count;
    private boolean is_fixed;
    private boolean delete_yn;
    private LocalDateTime created_at;
    private int created_by;
    private LocalDateTime updated_at;
    private int updated_by;
}
