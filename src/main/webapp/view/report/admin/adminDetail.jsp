<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../../inc/userHeader.jsp" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/report.css">


<div class="admin-detail-page">

	<section class="admin-detail-title-row">
		<div class="admin-detail-title">
			<h1>관리자 신고 상세</h1>
			<p>관리자 신고목록에서 상세 보기를 클릭했을 때 나오는 화면</p>
		</div>
		<div class="admin-detail-url-chip">
			/admin/report/detail?report_id=${dto.reportId}
		</div>
	</section>

	<section class="admin-detail-card">
		<div class="admin-detail-card-head">
			<div class="admin-detail-card-title">
				<span class="admin-detail-step">5-1</span>관리자 신고 상세
			</div>
		</div>

		<div class="admin-detail-inner">
			<div class="admin-detail-summary-grid">
				<div class="admin-detail-summary-card">
					<div class="admin-detail-summary-label">신고번호</div>
					<div class="admin-detail-summary-value">${dto.reportId}</div>
				</div>

				<div class="admin-detail-summary-card">
					<div class="admin-detail-summary-label">대상</div>
					<div class="admin-detail-summary-value">${dto.targetId}</div>
				</div>

				<div class="admin-detail-summary-card">
					<div class="admin-detail-summary-label">신고자</div>
					<div class="admin-detail-summary-value">${dto.memberId}</div>
				</div>

				<div class="admin-detail-summary-card">
					<div class="admin-detail-summary-label">현재 상태</div>
					<div class="admin-detail-summary-value">
						<c:choose>
							<c:when test="${dto.status == 'PENDING'}">
								<span class="admin-detail-status pending">PENDING</span>
							</c:when>
							<c:otherwise>
								<span class="admin-detail-status approved">${dto.status}</span>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>

			<div class="admin-detail-grid">
				<div class="admin-detail-row">
					<div class="admin-detail-label">신고 대상</div>
					<div class="admin-detail-value">
						<span class="admin-detail-badge">${dto.targetType}</span>
					</div>
				</div>

				<div class="admin-detail-row">
					<div class="admin-detail-label">대상 ID</div>
					<div class="admin-detail-value">${dto.targetId}</div>
				</div>

				<div class="admin-detail-row">
					<div class="admin-detail-label">신고 사유</div>
					<div class="admin-detail-value">${dto.reasonCode}</div>
				</div>

				<div class="admin-detail-row">
					<div class="admin-detail-label">상세 내용</div>
					<div class="admin-detail-value">${dto.reasonDetail}</div>
				</div>

				<div class="admin-detail-row">
					<div class="admin-detail-label">신고일</div>
					<div class="admin-detail-value">${dto.createdAt}</div>
				</div>
			</div>
		</div>

		<div class="admin-detail-actions">
			<a href="${pageContext.request.contextPath}/report/admin/adminList.do"
			   class="admin-detail-btn admin-detail-btn-white">목록</a>

			<button type="button"
					class="admin-detail-btn admin-detail-btn-soft-blue"
					onclick="openAdminReviewModal()">해당 글 보기</button>

			<form action="${pageContext.request.contextPath}/report/admin/update.do" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="reportId" value="${dto.reportId}" />
				<input type="hidden" name="status" value="APPROVED" />

				<button type="submit" class="admin-detail-btn admin-detail-btn-blue">처리 완료</button>
			</form>

			<button type="button"
					class="admin-detail-btn admin-detail-btn-red"
					data-bs-toggle="modal"
					data-bs-target="#deleteModal">삭제</button>
		</div>
	</section>

	<div class="admin-detail-review-modal-bg" id="adminReviewModal">
		<div class="admin-detail-review-modal-box">
			<div class="admin-detail-review-modal-icon">💬</div>

			<h2>해당 글 내용</h2>
			<p>신고 대상 원문 내용을 확인하는 모달창입니다.</p>

			<div class="admin-detail-review-content-box">
				${dto.reasonDetail} - 나중에 수정
			</div>

			<div class="admin-detail-review-modal-actions">
				<button type="button"
						class="admin-detail-btn admin-detail-btn-blue"
						onclick="closeAdminReviewModal()">확인</button>
			</div>
		</div>
	</div>

	<!-- 삭제 확인 모달 -->
	<div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content admin-detail-delete-modal-box">

				<div class="modal-body admin-detail-delete-modal-body">
					<div class="admin-detail-delete-modal-icon">!</div>

					<h2 class="admin-detail-delete-modal-title">삭제하시겠습니까?</h2>

					<p class="admin-detail-delete-modal-text">
						선택한 신고 내역이 삭제 처리됩니다.<br>
						삭제 후에는 목록에서 보이지 않습니다.
					</p>

					<form action="${pageContext.request.contextPath}/report/admin/delete.do" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="reportId" value="${dto.reportId}" />

						<div class="admin-detail-delete-modal-actions">
							<button type="button"
									class="admin-detail-btn admin-detail-btn-white"
									data-bs-dismiss="modal">취소</button>

							<button type="submit"
									class="admin-detail-btn admin-detail-btn-red-fill">삭제</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

</div>

<script>
function openAdminReviewModal() {
	document.getElementById('adminReviewModal').style.display = 'flex';
}

function closeAdminReviewModal() {
	document.getElementById('adminReviewModal').style.display = 'none';
}
</script>

<%@ include file="../../inc/userFooter.jsp" %>