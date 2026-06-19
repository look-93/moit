<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../../inc/userHeader.jsp" %>
<!-- 	header		 -->
<!-- 	header		 -->


<style>
:root { 
	--blue: #2f6df6; 
	--blue-dark: #1f55d8; 
	--blue-soft: #eef5ff; 
	--line: #dbe5f5; 
	--text: #0f172a; 
	--muted: #64748b; 
	--bg: #f5f7fc; 
	--card: #ffffff; 
	--red: #e15151; 
	--shadow: 0 18px 45px rgba(43, 89, 185, .10);
}

* {
	box-sizing: border-box
}

body {
	margin: 0;
	background: var(--bg);
	color: var(--text);
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
	color: var(--blue);
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
	color: var(--muted);
	font-size: 15px;
}

.url-chip {
	min-width: 230px;
	text-align: center;
	padding: 12px 18px;
	border: 1px solid var(--line);
	background: #fff;
	border-radius: 12px;
	color: #24437c;
	font-size: 14px;
	box-shadow: 0 10px 24px rgba(33, 75, 155, .06);
}

.card {
	background: var(--card);
	border: 1px solid var(--line);
	border-radius: 20px;
	box-shadow: var(--shadow);
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
	background: var(--blue);
	color: #fff;
	font-weight: 900;
	font-size: 18px;
}

.info-pill {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	border: 1px solid var(--line);
	background: #fff;
	color: #445b82;
	border-radius: 10px;
	padding: 10px 16px;
	font-size: 14px;
}

.inner {
	padding: 30px
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
	background: var(--blue-soft);
	color: #244ea7;
	font-size: 14px;
	font-weight: 800;
}

.small-note {
	font-size: 13px;
	color: var(--muted)
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
	cursor: pointer;
}

.reason-item input {
	width: 18px;
	height: 18px
}

.reason-item:has(input:checked) {
	border-color: #9fc0ff;
	background: #f7fbff;
	box-shadow: 0 0 0 4px rgba(47, 109, 246, .08);
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
	color: var(--muted);
	font-size: 13px;
	margin-top: 10px;
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

.btn-blue {
	background: var(--blue);
	border-color: var(--blue);
	color: #fff
}
</style>
</head>
<body>
	<div class="page">

		<section class="title-row">
			<div class="title">
				<h1>신고 수정</h1>
				<p>기존 신고 사유와 상세 내용을 수정하는 화면</p>
			</div>
			<div class="url-chip">/report/update?report_id=${dto.reportId}&amp;target_type=${dto.targetType}</div>
		</section>

		<section class="card">
			<div class="card-head">
				<div class="card-title">
					<span class="step">4-3</span>신고 수정
				</div>
			</div>

			<div class="inner">
				<form action="${pageContext.request.contextPath}/report/user/update.do" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				
					<input type="hidden" name="reportId" value="${dto.reportId}">
					<input type="hidden" name="targetType" value="${dto.targetType}">
					<input type="hidden" name="targetId" value="${dto.targetId}">
					<input type="hidden" name="memberId" value="${dto.memberId}">

<!--  				<div class="target-row">
						<span class="chip">report_id: ${dto.reportId}</span>
						<span class="chip">target_type: ${dto.targetType}</span>
						<span class="chip">target_id: ${dto.targetId}</span>
					</div>	-->

					<label class="form-label">신고 사유 <span class="required">(필수)</span></label>
					<div class="reason-grid">
						<label class="reason-item">
							<input type="radio" name="reasonCode" value="ABUSE" ${dto.reasonCode == 'ABUSE' ? 'checked' : ''}> 욕설/비방 (ABUSE)
						</label>
						<label class="reason-item">
							<input type="radio" name="reasonCode" value="SPAM" ${dto.reasonCode == 'SPAM' ? 'checked' : ''}> 도배/스팸 (SPAM)
						</label>
						<label class="reason-item">
							<input type="radio" name="reasonCode" value="FAKE_INFO" ${dto.reasonCode == 'FAKE_INFO' ? 'checked' : ''}> 허위 정보 (FAKE_INFO)
						</label>
						<label class="reason-item">
							<input type="radio" name="reasonCode" value="AD" ${dto.reasonCode == 'AD' ? 'checked' : ''}> 광고성 게시물 (AD)
						</label>
						<label class="reason-item">
							<input type="radio" name="reasonCode" value="ETC" ${dto.reasonCode == 'ETC' ? 'checked' : ''}> 기타 (ETC)
						</label>
					</div>

					<label class="form-label">상세 내용 <span class="optional">(선택)</span></label>
					<textarea id="reasonDetail" maxlength="200" placeholder="신고 내용을 자세히 입력해주세요." 
					   name="reasonDetail" oninput="updateCount(this)">${dto.reasonDetail}</textarea>
					<div class="counter"><span id="detailCount">0</span> / 200 </div>
					
					
					<div class="actions">
						<button type="button" class="btn btn-white" onclick="history.back()">취소</button>
						<button type="submit" class="btn btn-blue">수정 완료</button>
					</div>
					
				</form>
			</div>
		</section>
	</div>

<script>
    function updateCount(el) {
      document.getElementById("count").innerText = el.value.length;
    }
    
    
    
    
    const reasonDetail = document.getElementById('reasonDetail');
	const detailCount = document.getElementById('detailCount');

	reasonDetail.addEventListener('input', function() {
		detailCount.textContent = reasonDetail.value.length;
	});
</script>
 
</body>
</html>

<!-- 	footer		 -->
<!-- 	footer		 -->
<%@ include file="../../inc/userFooter.jsp" %>