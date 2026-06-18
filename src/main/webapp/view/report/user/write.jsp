<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Moit 신고하기</title>
	<!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    <link href="./css/board.css" rel="stylesheet">
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI",
		"Noto Sans KR", Arial, sans-serif;
	background: #f6f9ff;
	color: #172033;
}

a {
	color: inherit;
	text-decoration: none;
}

.page {
	max-width: 980px;
	margin: 0 auto;
	padding: 32px 24px 56px;
}

.topbar {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 22px;
}

.brand {
	display: flex;
	align-items: center;
	gap: 24px;
}

.logo {
	font-size: 34px;
	font-weight: 800;
	color: #1f6fff;
	letter-spacing: -1px;
}

.nav {
	display: flex;
	gap: 24px;
	font-size: 14px;
	color: #48556b;
}

.icons {
	display: flex;
	align-items: center;
	gap: 12px;
	color: #78859a;
	font-size: 18px;
}

.hero {
	display: flex;
	align-items: flex-end;
	justify-content: space-between;
	gap: 20px;
	margin-bottom: 24px;
}

h1 {
	margin: 0 0 8px;
	font-size: 32px;
	letter-spacing: -1px;
}

.subtitle {
	margin: 0;
	color: #68758d;
	font-size: 15px;
}

.url-chip {
	border: 1px solid #d5e3ff;
	background: #ffffff;
	color: #2b5cb8;
	border-radius: 10px;
	padding: 10px 14px;
	font-size: 14px;
	white-space: nowrap;
	box-shadow: 0 4px 14px rgba(23, 82, 170, 0.06);
}

.layout {
	display: grid;
	grid-template-columns: 1fr;
	gap: 24px;
}

.card {
	background: #ffffff;
	border: 1px solid #d9e6ff;
	border-radius: 20px;
	box-shadow: 0 14px 38px rgba(30, 84, 170, 0.08);
}

.form-card {
	padding: 28px;
}

.card-title {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-bottom: 22px;
}

.step {
	width: 34px;
	height: 34px;
	border-radius: 50%;
	background: #1f6fff;
	color: white;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	font-weight: 800;
}

h2 {
	margin: 0;
	font-size: 24px;
}

.target-row {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	align-items: center;
	margin-bottom: 24px;
}

.pill {
	padding: 9px 12px;
	border-radius: 9px;
	background: #f2f6ff;
	color: #2b5cb8;
	border: 1px solid #d8e5ff;
	font-weight: 700;
	font-size: 14px;
}

.note {
	color: #77849a;
	font-size: 13px;
}

.field {
	margin-bottom: 24px;
}

.label {
	display: block;
	margin-bottom: 12px;
	font-weight: 800;
	font-size: 16px;
}

.required {
	color: #ff4d4f;
	font-size: 14px;
}

.optional {
	color: #7b8798;
	font-size: 14px;
}

.reasons {
	display: grid;
	grid-template-columns: repeat(2, minmax(0, 1fr));
	gap: 12px;
}

.reason {
	display: flex;
	align-items: center;
	gap: 10px;
	border: 1px solid #e1e8f5;
	border-radius: 12px;
	padding: 14px 15px;
	background: #fbfdff;
	cursor: pointer;
	transition: 0.18s ease;
}

.reason:hover {
	border-color: #82adff;
	background: #f5f9ff;
}

input[type="radio"] {
	width: 18px;
	height: 18px;
	accent-color: #1f6fff;
}

textarea {
	width: 100%;
	min-height: 160px;
	resize: vertical;
	border: 1px solid #d9e1ef;
	border-radius: 14px;
	padding: 16px;
	font: inherit;
	outline: none;
	background: #fbfdff;
}

textarea:focus {
	border-color: #1f6fff;
	box-shadow: 0 0 0 4px rgba(31, 111, 255, 0.10);
}

.counter {
	text-align: right;
	margin-top: 8px;
	color: #8491a5;
	font-size: 13px;
}

.actions {
	display: flex;
	justify-content: flex-end;
	gap: 12px;
	margin-top: 28px;
}

.btn {
	min-width: 124px;
	border: 1px solid #d9e1ef;
	border-radius: 12px;
	padding: 13px 20px;
	background: #fff;
	color: #435066;
	font-weight: 800;
	cursor: pointer;
}

.btn-primary {
	border-color: #1f6fff;
	background: #1f6fff;
	color: white;
	box-shadow: 0 8px 20px rgba(31, 111, 255, 0.22);
}

.side-card {
	padding: 22px;
}

.side-card h3 {
	margin: 0 0 16px;
	font-size: 18px;
}

.summary-list {
	display: grid;
	gap: 12px;
}

.summary-item {
	border: 1px solid #e1e8f5;
	border-radius: 14px;
	padding: 14px;
	background: #fbfdff;
}

.summary-item strong {
	display: block;
	margin-bottom: 4px;
	color: #202b3d;
}

.summary-item span {
	color: #68758d;
	font-size: 14px;
	line-height: 1.5;
}

@media ( max-width : 860px) {
	.layout {
		grid-template-columns: 1fr;
	}
	.hero, .topbar {
		align-items: flex-start;
		flex-direction: column;
	}
	.reasons {
		grid-template-columns: 1fr;
	}
	.url-chip {
		white-space: normal;
	}
}
</style>
</head>

<body>
	<main class="page">
		<header class="topbar">
			<div class="brand">
				<div class="logo">Moit</div>
				<nav class="nav">
					<a href="#">홈</a> <a href="#">모임찾기</a> <a href="#">내 모임</a>
				</nav>
			</div>
			<div class="icons">⌕ 🔔 👤</div>
		</header>

		<section class="hero">
			<div>
				<h1>신고 작성</h1>
				<p class="subtitle">신고 대상과 사유를 입력하여 신고를 등록하는 화면</p>
			</div>
			<div class="url-chip">/report/write?target_type=MEETUP&amp;target_id=1</div>
		</section>

		<section class="layout">
			<form class="card form-card" action="/report/write" method="post">
				<div class="card-title">
					<span class="step">3</span>
					<h2>신고하기</h2>
				</div>

				<div class="target-row">
					<span class="pill">target_type: MEETUP</span>
					<span class="pill">target_id:1</span>
					<span class="note">* REVIEW도 동일 구조로 사용</span>
				</div>

				<input type="hidden" name="targetType" value="MEETUP" />
				<input type="hidden" name="targetId" value="1" />

				<div class="field">
					<label class="label">신고 사유
						<span class="required">(필수)</span>
					</label>
					<div class="reasons">
						<label class="reason">
							<input type="radio" name="reasonCode" value="ABUSE" required /> 욕설/비방 (ABUSE)
						</label>
						<label class="reason">
							<input type="radio" name="reasonCode" value="SPAM" /> 도배/스팸 (SPAM)
						</label>
						<label class="reason">
							<input type="radio" name="reasonCode" value="FAKE_INFO" /> 허위 정보 (FAKE_INFO)</label>
						<label class="reason">
							<input type="radio" name="reasonCode" value="AD" /> 광고성 게시물 (AD)
						</label>
						<label class="reason">
							<input type="radio" name="reasonCode" value="ETC" /> 기타 (ETC)
						</label>
					</div>
				</div>

				<div class="field">
					<label class="label" for="reasonDetail">상세 내용
						<span class="optional">(선택)</span>
					</label>
					<textarea id="reasonDetail" name="reasonDetail" maxlength="200" placeholder="신고 내용을 자세히 입력해주세요."></textarea>
					<div class="counter">
						<span id="detailCount">0</span> / 200
					</div>
				</div>

				<div class="actions">
					<button type="button" class="btn" onclick="history.back()">취소</button>
					<button type="submit" class="btn btn-primary">신고 등록</button>
				</div>
			</form>

		</section>
	</main>

	<script>
		const reasonDetail = document.getElementById('reasonDetail');
		const detailCount = document.getElementById('detailCount');

		reasonDetail.addEventListener('input', function() {
			detailCount.textContent = reasonDetail.value.length;
		});
	</script>
</body>
</html>