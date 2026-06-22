<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MOIT 관리자 - 모집관리</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	background: #f4f7fc;
}

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
	display: block;
	padding: 15px 20px;
	color: #333;
	text-decoration: none;
	font-weight: 500;
}

.menu a:hover {
	background: #edf3ff;
}

.menu .active {
	background: #4a7dff;
	color: white;
}

.topbar {
	background: white;
	border-radius: 15px;
	padding: 20px;
	margin-bottom: 20px;
}

.card-box {
	background: white;
	border-radius: 15px;
	padding: 20px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .05);
}

.tab-btn {
	background: white;
	border: none;
	padding: 10px 20px;
	border-radius: 10px;
	margin-right: 10px;
}

.tab-btn.active {
	background: #4a7dff;
	color: white;
}

.table-box {
	background: white;
	border-radius: 15px;
	padding: 20px;
}

.stat-number {
	font-size: 28px;
	font-weight: bold;
	color: #4a7dff;
}
</style>
 
</head>
<body>

<div class="container-fluid">
    <div class="row">

        <!-- 사이드바 -->
        <%@include file="../../inc/sidebar.jsp"%>

        <!-- 메인 -->
        <div class="col-md-10 p-4">

            <!-- 상단 -->
            <div class="topbar d-flex justify-content-between align-items-center">
                <h3>모집관리</h3> <!-- ✅ 깨진 글자 '������' → '모집관리' -->
                <div>관리자님</div> <!-- ✅ 깨진 글자 '�����ڴ�' → '관리자님' -->
            </div>

            <!-- 통계 -->
            <div class="row mb-4">
                <div class="col-md-3">
                    <div class="card-box">
                        <h6>전체 모집글</h6> <!-- ✅ '��ü ���' → '전체 모집글' -->
                        <div class="stat-number">25</div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card-box">
                        <h6>모집중</h6> <!-- ✅ '������' → '모집중' -->
                        <div class="stat-number">8</div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card-box">
                        <h6>진행예정</h6> <!-- ✅ '���࿹��' → '진행예정' -->
                        <div class="stat-number">10</div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card-box">
                        <h6>모집종료</h6> <!-- ✅ '�������' → '모집종료' -->
                        <div class="stat-number">7</div>
                    </div>
                </div>
            </div>

            <!-- 탭 -->
            <div class="mb-4">
                <button class="tab-btn active">모집목록</button> <!-- ✅ '�����' → '모집목록' -->
                <button class="tab-btn">행사등록</button>
                <button class="tab-btn">신청자목록</button>
            </div>

            <!-- 검색 -->
            <form action="${pageContext.request.contextPath}/meetup/admin/list.do" method="get">
                <div class="table-box mb-4">
                    <div class="row">
                        <div class="col-md-4">
                            <input type="text" name="searchText" class="form-control" placeholder="모집명 검색"> <!-- ✅ '���� �˻�' → '모집명 검색' -->
                        </div>
                        <div class="col-md-2">
                            <button type="submit" class="btn btn-primary">검색</button> <!-- ✅ '�˻�' → '검색' -->
                        </div>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>

</body>
</html>