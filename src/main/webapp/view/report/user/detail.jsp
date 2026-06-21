<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../../inc/userHeader.jsp" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/report.css">

<div class="detail-page">

	<section class="detail-title-row">
		<div class="detail-title">
			<h1>내 신고 상세</h1>
			<p>내 신고내역에서 상세를 클릭했을 때 나오는 화면</p>
		</div>
		<div class="detail-url-chip">
			test 후 삭제바람 /report/detail?report_id=${dto.reportId}&amp;target_type=${dto.targetType}
		</div>
	</section>

	<section class="detail-card">
		<div class="detail-card-head">
			<div class="detail-card-title">
				<span class="detail-step">4-1</span>상세보기
			</div>
		</div>

		<div class="detail-inner">
			<div class="detail-grid">
				<div class="detail-row">
					<div class="detail-label">신고번호</div>
					<div class="detail-value">${dto.reportId}</div>
				</div>

				<div class="detail-row">
					<div class="detail-label">신고 대상</div>
					<div class="detail-value">
						<span class="detail-badge">${dto.targetType}</span>
					</div>
				</div>

				<div class="detail-row">
					<div class="detail-label">대상 ID</div>
					<div class="detail-value">${dto.targetId}</div>
				</div>

				<div class="detail-row">
					<div class="detail-label">신고 사유</div>
					<div class="detail-value">${dto.reasonCode}</div>
				</div>

				<div class="detail-row">
					<div class="detail-label">상세 내용</div>
					<div class="detail-value">${dto.reasonDetail}</div>
				</div>

				<div class="detail-row">
					<div class="detail-label">처리 상태</div>
					<div class="detail-value">
						<c:choose>
							<c:when test="${dto.status == 'PENDING'}">
								<span class="detail-status pending">PENDING</span>
							</c:when>
							<c:otherwise>
								<span class="detail-status approved">${dto.status}</span>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div class="detail-row">
					<div class="detail-label">신고일</div>
					<div class="detail-value">${dto.createdAt}</div>
				</div>
			</div>
		</div>

		<div class="detail-actions">
			<a href="${pageContext.request.contextPath}/report/user/mylist.do" class="detail-btn detail-btn-white">목록</a>
			<a href="${pageContext.request.contextPath}/meetup/user/#" class="detail-btn detail-btn-soft-blue">해당 글 보기</a>
			<a href="${pageContext.request.contextPath}/report/user/update.do?reportId=${dto.reportId}" class="detail-btn detail-btn-blue">수정</a>
			<button type="button" class="detail-btn detail-btn-red" data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</button>
		</div>
	</section>

	<!-- 삭제 확인 모달 -->
	<div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content detail-delete-modal-box">

				<div class="modal-body detail-delete-modal-body">
					<div class="detail-delete-modal-icon">!</div>

					<h2 class="detail-delete-modal-title">삭제하시겠습니까?</h2>

					<p class="detail-delete-modal-text">
						선택한 신고 내역이 삭제 처리됩니다.<br>
						삭제 후에는 목록에서 보이지 않습니다.
					</p>

					<form action="${pageContext.request.contextPath}/report/user/delete.do" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="reportId" value="${dto.reportId}" />

						<div class="detail-delete-modal-actions">
							<button type="button" class="detail-btn detail-btn-white" data-bs-dismiss="modal">취소</button>
							<button type="submit" class="detail-btn detail-btn-red-fill">삭제</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

</div>

<%@ include file="../../inc/userFooter.jsp" %>