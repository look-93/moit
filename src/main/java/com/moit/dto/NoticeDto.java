package com.moit.dto;

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
    private int created_by;
    private int updated_by;
    private java.sql.Timestamp createdAt;
    private java.sql.Timestamp updatedAt;
}
