<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>MOIT 관리자 - 광고관리</title>

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

.badge-open {
	background: #dfffe4;
	color: #009933;
}

.badge-pending {
	background: #fff4cc;
	color: #aa8800;
}

.badge-closed {
	background: #ffe3e3;
	color: #d11a2a;
}

select.status-select {
	border-radius: 8px;
	padding: 4px 8px;
	border: 1px solid #ddd;
	font-size: 13px;
}

</style>

</head>

<body>

<div class="container-fluid">

	<div class="row">

		<%@include file="../../inc/sidebar.jsp"  %>

		<!-- 메인 -->
		<div class="col-md-10 p-4">

			<!-- 상단 -->
			<div class="topbar d-flex justify-content-between align-items-center">
				<h3>광고관리</h3>
				<div>관리자님</div>
			</div>

			<!-- 통계 -->
			<div class="row mb-4">

				<div class="col-md-3">
					<div class="card-box">
						<h6>전체 광고</h6>
						<div class="stat-number">12</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card-box">
						<h6>진행중</h6>
						<div class="stat-number">5</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card-box">
						<h6>대기</h6>
						<div class="stat-number">4</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card-box">
						<h6>종료</h6>
						<div class="stat-number">3</div>
					</div>
				</div>

			</div>

			<!-- 검색 -->
			<div class="table-box mb-4">

				<div class="row">

					<div class="col-md-5">
						<input type="text" class="form-control" placeholder="광고명 검색">
					</div>

					<div class="col-md-3">
						<select class="form-select">
							<option>전체</option>
							<option>OPEN</option>
							<option>PENDING</option>
							<option>CLOSED</option>
						</select>
					</div>

					<div class="col-md-2">
						<button class="btn btn-primary">검색</button>
					</div>

				</div>

			</div>

			<!-- 버튼 -->
			<div class="mb-3">
				<button class="btn btn-primary">광고등록</button>
			</div>

			<!-- 목록 -->
			<div class="table-box">

				<table class="table table-hover">

					<thead class="table-light">
						<tr>
							<th>번호</th>
							<th>이미지</th>
							<th>광고명</th>
							<th>유형</th>
							<th>상태</th>
							<th>기간</th>
							<th>노출수</th>
							<th>클릭수</th>
							<th>관리</th>
						</tr>
					</thead>

					<tbody>

						<tr>
							<td>1</td>
							<td>
								<div style="width:70px;height:45px;background:#4a7dff;border-radius:8px;"></div>
							</td>
							<td>여름축제 광고</td>
							<td>BANNER</td>

							<td>
								<select class="status-select">
									<option selected>OPEN</option>
									<option>PENDING</option>
									<option>CLOSED</option>
								</select>
							</td>

							<td>2026-06-01 ~ 2026-07-01</td>
							<td>12,542</td>
							<td>823</td>

							<td>
								<button class="btn btn-sm btn-outline-primary">상세</button>
								<button class="btn btn-sm btn-outline-danger">삭제</button>
							</td>
						</tr>

						<tr>
							<td>2</td>
							<td>
								<div style="width:70px;height:45px;background:#98E4FF;border-radius:8px;"></div>
							</td>
							<td>헬스장 이벤트</td>
							<td>POPUP</td>

							<td>
								<select class="status-select">
									<option>OPEN</option>
									<option selected>PENDING</option>
									<option>CLOSED</option>
								</select>
							</td>

							<td>2026-07-01 ~ 2026-08-01</td>
							<td>0</td>
							<td>0</td>

							<td>
								<button class="btn btn-sm btn-outline-primary">상세</button>
								<button class="btn btn-sm btn-outline-danger">삭제</button>
							</td>
						</tr>

					</tbody>

				</table>

			</div>

		</div>

	</div>

</div>

</body>
</html>