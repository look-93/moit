<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/userHeader.jsp" %>

<style>
.answer-wrap{
    max-width:900px;
    margin:40px auto;
    padding:0 20px;
}

.page-title{
    font-size:38px;
    font-weight:700;
    margin-bottom:15px;
}

.breadcrumb{
    color:#667085;
    font-size:15px;
    margin-bottom:25px;
}

.page-desc{
    color:#667085;
    margin-bottom:30px;
}

.form-card{
    background:#fff;
    border:1px solid #e5e7eb;
    border-radius:14px;
    padding:28px;
}

.info-box{
    background:#f5f9ff;
    border:1px solid #dbe7ff;
    border-radius:12px;
    padding:24px;
    margin-bottom:35px;
}

.info-title{
    font-size:24px;
    font-weight:700;
    margin-bottom:25px;
}

.info-row{
    display:flex;
    align-items:center;
    margin-bottom:20px;
}

.info-row:last-child{
    margin-bottom:0;
}

.info-label{
    width:90px;
    font-weight:700;
    color:#111827;
}

.info-value{
    color:#374151;
    font-size:16px;
}

.answer-label{
    display:block;
    font-size:20px;
    font-weight:700;
    margin-bottom:15px;
}

.required{
    color:#ef4444;
}

.answer-textarea{
    width:100%;
    height:320px;
    border:1px solid #d1d5db;
    border-radius:10px;
    padding:20px;
    resize:none;
    font-size:16px;
    line-height:1.8;
    outline:none;
}

.answer-textarea:focus{
    border-color:#2563eb;
}

.btn-area{
    text-align:center;
    margin-top:30px;
}

.btn{
    min-width:110px;
    height:50px;
    border-radius:10px;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
}

.btn-save{
    background:#2563eb;
    color:#fff;
    border:none;
    margin-right:12px;
}

.btn-cancel{
    background:#fff;
    color:#374151;
    border:1px solid #d1d5db;
}
</style>

<div class="answer-wrap">

    <h1 class="page-title">관리자 답변 수정</h1>

    <div class="breadcrumb">
        1:1 문의 &nbsp; &gt; &nbsp; 답변 수정
    </div>

    <div class="page-desc">
        작성한 답변 내용을 수정 후 저장해 주세요.
    </div>

    <div class="form-card">

        <div class="info-box">

            <div class="info-title">문의 정보1</div>

            <div class="info-row">
                <div class="info-label">제목</div>
                <div class="info-value">이벤트 참여 방법이 궁금합니다.</div>
            </div>

            <div class="info-row">
                <div class="info-label">작성자</div>
                <div class="info-value">
                    user01 &nbsp;&nbsp; | &nbsp;&nbsp; 2026-06-01
                </div>
            </div>

        </div>

        <label class="answer-label">
            답변 내용 <span class="required">*</span>
        </label>

        <textarea class="answer-textarea">
안녕하세요. 관리자입니다.

이벤트 참여는 메인 페이지의 행사관리 > 진행중 이벤트 메뉴에서 신청하실 수 있습니다.

이벤트 상세 페이지에서 ‘참여하기’ 버튼을 클릭하시면 참여가 완료됩니다.

추가 문의사항이 있으시면 언제든지 다시 문의해 주세요.

감사합니다.
        </textarea>

        <div class="btn-area">
            <button type="button" class="btn btn-save">저장</button>
            <button type="button" class="btn btn-cancel">취소</button>
        </div>

    </div>

</div>

<%@ include file="../../inc/userFooter.jsp" %>