<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>MOIT 관리자 - 광고 상세</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

/* ===== sidebar ===== */
.sidebar {
    min-height: 100vh;
    background: #fff;
    border-right: 1px solid #dee2e6;
}

.logo {
    font-size: 24px;
    font-weight: bold;
    color: #4a7dff;
    padding: 25px;
    text-align: center;
    border-bottom: 1px solid #eee;
}

.menu a {
    display:block;
    padding:15px 20px;
    text-decoration:none;
    color:#333;
}

.menu a:hover {
    background:#edf3ff;
}

.menu .active {
    background:#4a7dff;
    color:white;
}

/* ===== content ===== */
body {
    background:#f4f7fc;
}

.page-title{
    font-size:28px;
    font-weight:700;
    margin-bottom:20px;
}

.card-box{
    background:#fff;
    border-radius:15px;
    padding:30px;
    box-shadow:0 2px 10px rgba(0,0,0,0.05);
}

.info-box{
    background:#f8f9fc;
    border-radius:12px;
    padding:15px;
    height:100%;
}

.info-title{
    font-size:13px;
    color:#888;
}

.info-value{
    font-size:16px;
    font-weight:600;
    margin-top:5px;
}

.ad-image{
    height:320px;
    background:linear-gradient(135deg,#98E4FF,#687EFF);
    border-radius:15px;
    display:flex;
    align-items:center;
    justify-content:center;
    color:white;
    font-size:32px;
    font-weight:bold;
    margin-bottom:20px;
}

.btn-area{
    display:flex;
    justify-content:flex-end;
    gap:10px;
}

</style>

</head>

<body>

<div class="container-fluid">
    <div class="row">

        <!-- SIDEBAR -->
        <%@ include file="/view/inc/sidebar.jsp" %>

        <!-- CONTENT -->
        <div class="col-md-10 p-4">

            <h1 class="page-title">광고 상세</h1>

            <div class="card-box">

                <!-- 이미지 -->
                <div class="ad-image">
                    ${dto.title}
                </div>

                <!-- 정보 -->
                <div class="row g-3">

                    <div class="col-md-3">
                        <div class="info-box">
                            <div class="info-title">광고명</div>
                            <div class="info-value">${dto.title}</div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="info-box">
                            <div class="info-title">광고유형</div>
                            <div class="info-value">${dto.adType}</div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="info-box">
                            <div class="info-title">상태</div>
                            <div class="info-value">${dto.status}</div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="info-box">
                            <div class="info-title">위치</div>
                            <div class="info-value">${dto.position}</div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="info-box">
                            <div class="info-title">광고채널</div>
                            <div class="info-value">${dto.adChannel}</div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="info-box">
                            <div class="info-title">시작일</div>
                            <div class="info-value">${dto.startDatetime}</div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="info-box">
                            <div class="info-title">종료일</div>
                            <div class="info-value">${dto.endDatetime}</div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="info-box">
                            <div class="info-title">우선순위</div>
                            <div class="info-value">${dto.priority}</div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="info-box">
                            <div class="info-title">예산</div>
                            <div class="info-value">${dto.totalBudget}</div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="info-box">
                            <div class="info-title">노출수</div>
                            <div class="info-value">${dto.impressions}</div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="info-box">
                            <div class="info-title">클릭수</div>
                            <div class="info-value">${dto.clicks}</div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="info-box">
                            <div class="info-title">등록자</div>
                            <div class="info-value">${dto.authorId}</div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="info-box">
                            <div class="info-title">등록일</div>
                            <div class="info-value">${dto.createdAt}</div>
                        </div>
                    </div>

                </div>

                <!-- 내용 -->
                <hr class="my-4">

                <h5>광고 내용</h5>
                <p>${dto.content}</p>

                <!-- 링크 -->
                <hr class="my-4">

                <h5>외부 링크</h5>
                <p>
                    <a href="${dto.landingUrl}" target="_blank">
                        ${dto.landingUrl}
                    </a>
                </p>

                <!-- 버튼 -->
                <div class="btn-area mt-4">

                    <a href="${ctx}/advertisement/admin/adList.do" class="btn btn-secondary">
                        목록
                    </a>

                    <a href="${ctx}/advertisement/admin/adUpdate.do?adId=${dto.adId}" class="btn btn-primary">
                        수정 ${dto.adId}
                    </a>

                    <a href="${ctx}/advertisement/admin/adDelete.do?adId=${dto.adId}" class="btn btn-danger">
                        삭제
                    </a>

                </div>

            </div>

        </div>
    </div>
</div>

</body>
</html>