<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../inc/userHeader.jsp" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/report.css">

<div class="admin-list-page">

	<section class="admin-list-title-row">
		<div class="admin-list-title">
			<h1>관리자 신고목록</h1>
			<p>관리자가 전체 신고 내역을 조회하고 상세 처리하는 화면</p>
		</div>

		<div class="admin-list-url-chip">/report/admin/adminList</div>
	</section>

	<section class="admin-list-card">
		<div class="admin-list-card-head">
			<div class="admin-list-card-title">
				관리자 신고목록
			</div>

			<div class="admin-list-filters">
				<a href="${pageContext.request.contextPath}/report/admin/adminList.do"
				   class="admin-list-filter-btn ${param.targetType == param.status ? 'active' : ''}">
					전체
				</a>
			
				<a href="${pageContext.request.contextPath}/report/admin/adminList.do?targetType=MEETUP"
				   class="admin-list-filter-btn ${param.targetType == 'MEETUP' ? 'active' : ''}">
					MEETUP
				</a>
			
				<a href="${pageContext.request.contextPath}/report/admin/adminList.do?targetType=REVIEW"
				   class="admin-list-filter-btn ${param.targetType == 'REVIEW' ? 'active' : ''}">
					REVIEW
				</a>
			
				<a href="${pageContext.request.contextPath}/report/admin/adminList.do?status=PENDING"
				   class="admin-list-filter-btn ${param.status == 'PENDING' ? 'active' : ''}">
					PENDING
				</a>
			</div>
		</div>

		<div class="admin-list-table-wrap">
			<table class="admin-list-table">
				<thead>
					<tr>
						<th>신고번호</th>
						<th>대상</th>
						<th>대상ID</th>
						<th>신고자</th>
						<th>사유</th>
						<th>상태</th>
						<th>신고일</th>
						<th>상세</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td>${dto.reportId}</td>
							<td>${dto.targetType}</td>
							<td>${dto.targetId}</td>
							<td>${dto.memberId}</td>
							<td>${dto.reasonCode}</td>
							<td>
								<c:choose>
									<c:when test="${dto.status == 'PENDING'}">
										<span class="admin-list-status pending">${dto.status}</span>
									</c:when>
									<c:when test="${dto.status == 'APPROVED'}">
										<span class="admin-list-status approved">${dto.status}</span>
									</c:when>
								</c:choose>
							</td>
							<td>${dto.createdAt}</td>
							<td>
								<a class="admin-list-link"
								   href="${pageContext.request.contextPath}/report/admin/adminDetail.do?reportId=${dto.reportId}">
									보기
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>

				<tfoot>
					<tr>
						<td colspan="8">
							<ul class="admin-list-pagination">
								<!-- 이전 -->
								<c:if test="${paging.start > paging.bottomlist}">
									<li>
										<a href="?pstartno=${paging.start - 1}&targetType=${param.targetType}&status=${param.status}"
											class="admin-list-page-btn">이전</a>
									</li>
								</c:if>

								<!-- 페이지 번호 -->
								<c:forEach var="i" begin="${paging.start}" end="${paging.end}">
									<li>
										<a href="?pstartno=${i}&targetType=${param.targetType}&status=${param.status}"
										   class="admin-list-page-btn <c:if test='${i == paging.current}'>active</c:if>">
											${i}
										</a>
									</li>
								</c:forEach>

								<!-- 다음 -->
								<c:if test="${paging.end < paging.pagetotal}">
									<li>
										<a href="?pstartno=${paging.end + 1}&targetType=${param.targetType}&status=${param.status}"
											class="admin-list-page-btn">다음</a>
									</li>
								</c:if>
							</ul>
						</td>
					</tr>
				</tfoot>
				
			</table>
		</div>
	</section>

</div>

<jsp:include page="../../inc/userFooter.jsp" />