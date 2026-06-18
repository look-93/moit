<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Moit 내 신고내역</title>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<link href="./css/board.css" rel="stylesheet">
<style>
:root { -
	-blue: #2f6df6; -
	-blue-dark: #1f55d8; -
	-blue-soft: #eef5ff; -
	-line: #dbe5f5; -
	-text: #0f172a; -
	-muted: #64748b; -
	-bg: #f5f7fc; -
	-card: #ffffff; -
	-red: #e15151; -
	-red-soft: #fff5f5; -
	-gray: #f7f9fd; -
	-shadow: 0 18px 45px rgba(43, 89, 185, .10);
}

* {
	box-sizing: border-box
}

body {
	margin: 0;
	background: var(- -bg);
	color: var(- -text);
	font-family: Arial, "Noto Sans KR", sans-serif;
}

a {
	text-decoration: none;
	color: inherit
}

.page {
	width: 1180px;
	margin: 0 auto;
	padding: 34px 0 80px;
}

.header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 34px;
}

.header-left {
	display: flex;
	align-items: center;
	gap: 28px;
}

.logo {
	font-size: 34px;
	font-weight: 900;
	color: var(- -blue);
	letter-spacing: -1px;
}

.nav {
	display: flex;
	gap: 22px;
	color: #334155;
	font-size: 14px;
}

.header-icons {
	display: flex;
	align-items: center;
	gap: 8px;
	font-size: 18px;
}

.admin-badge {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	padding: 10px 17px;
	border-radius: 20px;
	background: #edf3fb;
	color: #334155;
	font-weight: 700;
	font-size: 13px;
}

.title-row {
	display: flex;
	align-items: flex-end;
	justify-content: space-between;
	margin-bottom: 22px;
}

.title h1 {
	margin: 0 0 10px;
	font-size: 34px;
	letter-spacing: -1.5px;
}

.title p {
	margin: 0;
	color: var(- -muted);
	font-size: 15px;
}

.url-chip {
	min-width: 230px;
	text-align: center;
	padding: 12px 18px;
	border: 1px solid var(- -line);
	background: #fff;
	border-radius: 12px;
	color: #24437c;
	font-size: 14px;
	box-shadow: 0 10px 24px rgba(33, 75, 155, .06);
}

.card {
	background: var(- -card);
	border: 1px solid var(- -line);
	border-radius: 20px;
	box-shadow: var(- -shadow);
	overflow: hidden;
}

.card-head {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 28px 30px;
	border-bottom: 1px solid #edf1f7;
}

.card-title {
	display: flex;
	align-items: center;
	gap: 12px;
	font-size: 25px;
	font-weight: 900;
	letter-spacing: -.8px;
}

.step {
	width: 36px;
	height: 36px;
	border-radius: 50%;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	background: var(- -blue);
	color: #fff;
	font-weight: 900;
	font-size: 18px;
}

.step.gray {
	background: #7b8798
}

.info-pill {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	border: 1px solid var(- -line);
	background: #fff;
	color: #445b82;
	border-radius: 10px;
	padding: 10px 16px;
	font-size: 14px;
}

.inner {
	padding: 30px;
}

.target-row {
	display: flex;
	align-items: center;
	gap: 12px;
	margin-bottom: 26px;
	flex-wrap: wrap;
}

.chip {
	padding: 10px 16px;
	border: 1px solid #d4e2fb;
	border-radius: 8px;
	background: var(- -blue-soft);
	color: #244ea7;
	font-size: 14px;
	font-weight: 800;
}

.small-note {
	font-size: 13px;
	color: var(- -muted)
}

.form-label {
	display: block;
	font-weight: 900;
	font-size: 16px;
	margin: 0 0 14px;
}

.required {
	color: #ef4444
}

.optional {
	color: #64748b
}

.reason-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 14px;
	margin-bottom: 28px;
}

.reason-item {
	border: 1px solid #dce4f0;
	border-radius: 12px;
	padding: 18px 20px;
	display: flex;
	align-items: center;
	gap: 12px;
	background: #fff;
	color: #111827;
	font-size: 18px;
}

.reason-item input {
	width: 18px;
	height: 18px
}

textarea {
	width: 100%;
	height: 160px;
	border: 1px solid #dce4f0;
	border-radius: 14px;
	resize: none;
	padding: 18px;
	color: #111827;
	font-size: 17px;
	outline: none;
}

textarea:focus {
	border-color: #8db4ff;
	box-shadow: 0 0 0 4px rgba(47, 109, 246, .10);
}

.counter {
	text-align: right;
	color: var(- -muted);
	font-size: 13px;
	margin-top: 10px;
}

.table-wrap {
	padding: 30px;
}

table {
	width: 100%;
	border-collapse: collapse;
	background: #fff;
}

thead th {
	background: #f5f7fc;
	color: #1e293b;
	font-weight: 900;
	padding: 18px 16px;
	font-size: 14px;
	border-bottom: 1px solid #e5ebf4;
}

tbody td {
	text-align: center;
	padding: 19px 16px;
	font-size: 15px;
	border-bottom: 1px solid #e5ebf4;
}

tbody tr:last-child td {
	border-bottom: none
}

.status {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	padding: 7px 12px;
	border-radius: 999px;
	font-size: 12px;
	font-weight: 900;
}

.pending {
	background: #fff1d6;
	color: #de8c00
}

.approved {
	background: #def7e9;
	color: #24945b
}

.link {
	color: var(- -blue);
	font-weight: 900;
}

.filters {
	display: flex;
	align-items: center;
	gap: 10px;
}

.filter-btn {
	border: 1px solid #dce4f0;
	background: #fff;
	color: #334155;
	font-weight: 900;
	border-radius: 10px;
	padding: 12px 24px;
	cursor: pointer;
}

.filter-btn.active {
	background: var(- -blue);
	color: #fff;
	border-color: var(- -blue);
}

.detail-grid {
	border: 1px solid #dce4f0;
	border-radius: 16px;
	overflow: hidden;
}

.detail-row {
	display: grid;
	grid-template-columns: 220px 1fr;
	min-height: 68px;
	border-bottom: 1px solid #e5ebf4;
}

.detail-row:last-child {
	border-bottom: none
}

.detail-label {
	background: #f5f7fc;
	padding: 22px 24px;
	font-weight: 900;
	font-size: 18px;
	border-right: 1px solid #e5ebf4;
}

.detail-value {
	padding: 22px 24px;
	font-size: 18px;
	display: flex;
	align-items: center;
	gap: 10px;
}

.summary-grid {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 12px;
	margin-bottom: 22px;
}

.summary-card {
	border: 1px solid #dce4f0;
	background: #fbfcff;
	border-radius: 14px;
	padding: 18px;
}

.summary-label {
	color: #64748b;
	font-size: 13px;
	font-weight: 800;
	margin-bottom: 10px;
}

.summary-value {
	font-size: 20px;
	font-weight: 900;
}

.badge {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	padding: 8px 15px;
	min-width: 72px;
	border-radius: 999px;
	background: #eff4ff;
	color: #315bc8;
	font-size: 13px;
	font-weight: 900;
}

.actions {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	gap: 12px;
	padding: 26px 30px 30px;
}

.btn {
	min-width: 84px;
	height: 48px;
	border-radius: 12px;
	padding: 0 20px;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	border: 1px solid transparent;
	font-weight: 900;
	font-size: 15px;
	cursor: pointer;
}

.btn-white {
	background: #fff;
	border-color: #d7e0ed;
	color: #1e293b
}

.btn-soft-blue {
	background: #eaf2ff;
	border-color: #bed5ff;
	color: #1d5bd7
}

.btn-blue {
	background: var(- -blue);
	border-color: var(- -blue);
	color: #fff
}

.btn-red {
	background: #fff;
	border-color: #ffc9c9;
	color: #e15151
}

.btn-red-fill {
	background: #e15151;
	border-color: #e15151;
	color: #fff
}

.pagination {
	display: flex;
	justify-content: center;
	gap: 10px;
	padding: 14px 0 6px;
}

.page-btn {
	width: 36px;
	height: 36px;
	border: 1px solid #dce4f0;
	border-radius: 9px;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #fff;
	color: #334155;
	font-weight: 800;
}

.page-btn.active {
	background: var(- -blue);
	color: #fff;
	border-color: var(- -blue)
}

.modal-screen {
	min-height: 760px;
	background: rgba(15, 23, 42, .45);
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 60px;
}

.modal-box {
	width: 420px;
	background: #fff;
	border-radius: 22px;
	box-shadow: 0 30px 90px rgba(15, 23, 42, .25);
	padding: 38px 34px 30px;
	text-align: center;
}

.modal-icon {
	width: 58px;
	height: 58px;
	border-radius: 50%;
	background: #fff1f1;
	color: #e15151;
	margin: 0 auto 20px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 34px;
	font-weight: 900;
}

.modal-box h2 {
	margin: 0 0 14px;
	font-size: 24px;
}

.modal-box p {
	margin: 0;
	color: #64748b;
	line-height: 1.7;
	font-size: 15px;
}

.modal-actions {
	display: flex;
	gap: 10px;
	margin-top: 30px;
}

.modal-actions .btn {
	flex: 1
}

.review-content-box {
	text-align: left;
	border: 1px solid #dce4f0;
	background: #fbfcff;
	border-radius: 14px;
	padding: 20px;
	margin-top: 18px;
	line-height: 1.7;
	color: #1e293b;
}
</style>
</head>

<body>
	<div class="page">
		<header class="header">
			<div class="header-left">
				<div class="logo">Moit</div>
				<nav class="nav">
					<a href="#">홈</a><a href="#">모임찾기</a><a href="#">내 신고내역</a>
				</nav>
			</div>
			<div class="header-icons">
				<span>⌕</span><span>🔔</span><span>👤</span>
			</div>
		</header>

		<section class="title-row">
			<div class="title">
				<h1>내 신고내역</h1>
				<p>사용자가 본인이 작성한 신고 내역을 확인하는 화면</p>
			</div>
			<div class="url-chip">/report/mylist</div>
		</section>

		<section class="card">
			<div class="card-head">
				<div class="card-title">
					<span class="step">4</span>내 신고내역
				</div>
				<span class="small-note">관리에서는 상세만 확인</span>
			</div>
			<div class="table-wrap">
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>대상</th>
							<th>대상ID</th>
							<th>신고사유</th>
							<th>상태</th>
							<th>신고일</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>MEETUP</td>
							<td>1</td>
							<td>욕설/비방</td>
							<td><span class="status pending">PENDING</span></td>
							<td>2026-06-17</td>
							<td><a class="link"
								href="/report/detail?report_id=1&amp;target_type=MEETUP">상세</a></td>
						</tr>
						<tr>
							<td>2</td>
							<td>REVIEW</td>
							<td>3</td>
							<td>허위정보</td>
							<td><span class="status approved">APPROVED</span></td>
							<td>2026-06-17</td>
							<td><a class="link"
								href="/report/detail?report_id=2&amp;target_type=REVIEW">상세</a></td>
						</tr>
						<tr>
							<td>3</td>
							<td>MEETUP</td>
							<td>2</td>
							<td>도배/스팸</td>
							<td><span class="status approved">APPROVED</span></td>
							<td>2026-06-15</td>
							<td><a class="link" href="#">상세</a></td>
						</tr>
						<tr>
							<td>4</td>
							<td>REVIEW</td>
							<td>5</td>
							<td>광고성 게시물</td>
							<td><span class="status pending">PENDING</span></td>
							<td>2026-06-14</td>
							<td><a class="link" href="#">상세</a></td>
						</tr>
					</tbody>
				</table>
				<div class="pagination">
					<span class="page-btn">‹</span><span class="page-btn active">1</span><span
						class="page-btn">2</span><span class="page-btn">›</span>
				</div>
			</div>
		</section>

	</div>
</body>
</html>

