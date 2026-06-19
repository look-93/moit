<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../inc/userHeader.jsp" />

<style>
.report-page {
	width: 1180px;
	margin: 0 auto;
	padding: 34px 0 80px;
}

.report-title-row {
	display: flex;
	align-items: flex-end;
	justify-content: space-between;
	margin-bottom: 22px;
}

.report-title h1 {
	margin: 0 0 10px;
	font-size: 34px;
	letter-spacing: -1.5px;
}

.report-title p {
	margin: 0;
	color: #64748b;
	font-size: 15px;
}

.report-url-chip {
	min-width: 230px;
	text-align: center;
	padding: 12px 18px;
	border: 1px solid #dbe5f5;
	background: #fff;
	border-radius: 12px;
	color: #24437c;
	font-size: 14px;
	box-shadow: 0 10px 24px rgba(33, 75, 155, .06);
}

.report-card {
	background: #ffffff;
	border: 1px solid #dbe5f5;
	border-radius: 20px;
	box-shadow: 0 18px 45px rgba(43, 89, 185, 0.10);
	overflow: hidden;
}

.report-card-head {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 28px 30px;
	border-bottom: 1px solid #edf1f7;
}

.report-card-title {
	display: flex;
	align-items: center;
	gap: 12px;
	font-size: 25px;
	font-weight: 900;
	letter-spacing: -0.8px;
}

.report-step {
	width: 36px;
	height: 36px;
	border-radius: 50%;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	background: #2f6df6;
	color: #fff;
	font-weight: 900;
	font-size: 18px;
}

.report-small-note {
	font-size: 13px;
	color: #64748b;
}

.report-table-wrap {
	padding: 30px;
}

.report-table {
	width: 100%;
	border-collapse: collapse;
	background: #fff;
}

.report-table thead th {
	background: #f5f7fc;
	color: #1e293b;
	font-weight: 900;
	padding: 18px 16px;
	font-size: 14px;
	border-bottom: 1px solid #e5ebf4;
	text-align: center;
}

.report-table tbody td {
	text-align: center;
	padding: 19px 16px;
	font-size: 15px;
	border-bottom: 1px solid #e5ebf4;
}

.report-table tbody tr:last-child td {
	border-bottom: none;
}

.report-status {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	padding: 7px 12px;
	border-radius: 999px;
	font-size: 12px;
	font-weight: 900;
}

.report-status.pending {
	background: #fff1d6;
	color: #de8c00;
}

.report-status.approved {
	background: #def7e9;
	color: #24945b;
}

.report-link {
	color: #2f6df6;
	font-weight: 900;
	text-decoration: none;
}

.report-pagination {
	display: flex;
	justify-content: center;
	gap: 10px;
	padding: 14px 0 6px;
}

.report-page-btn {
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
	text-decoration: none;
}

.report-page-btn.active {
	background: #2f6df6;
	color: #fff;
	border-color: #2f6df6;
}

.report-empty {
	padding: 60px 0;
	color: #64748b;
	font-weight: 700;
}
</style>

<div class="report-page">

	<section class="report-title-row">
		<div class="report-title">
			<h1>내 신고내역</h1>
			<p>사용자 본인이 작성한 신고 내역 확인</p>
			<pre>
			${paging }
			${list }
			</pre>
		</div>
	</section>

	<section class="report-card">
		<div class="report-card-head">
			<div class="report-card-title">
				<span class="report-step">4</span>내 신고내역
			</div>
		</div>

		<div class="report-table-wrap">
			<table class="report-table">
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
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="7" class="report-empty">
									작성한 신고 내역이 없습니다.
								</td>
							</tr>
						</c:when>

						<c:otherwise>
							<c:forEach var="dto" items="${list}" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td>${dto.targetType}</td>
									<td>${dto.targetId}</td>
									<td>${dto.reasonCode}</td>
									<td>
										<c:choose>
											<c:when test="${dto.status == 'PENDING'}">
												<span class="report-status pending">PENDING</span>
											</c:when>
											
											<c:otherwise>
												<span class="report-status approved">${dto.status}</span>
											</c:otherwise>
										</c:choose>
									</td>
									<td>${dto.createdAt}</td>
									<td><a class="report-link" href="${pageContext.request.contextPath}/report/user/detail.do?reportId=${dto.reportId}">상세</a></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>

				<tfoot>
						<tr>
							<td colspan="7">
								<ul class="pagination justify-content-center">
									<!-- 이전 -->
									<c:if test="${paging.start > paging.bottomlist}">
										<li><a href="?pstartno=${paging.start - 1}"
											class="page-btn">이전</a></li>
									</c:if>

									<!-- 페이지 번호 -->
									<c:forEach var="i" begin="${paging.start}" end="${paging.end}">
										<li><a href="?pstartno=${i}"
											class="page-btn <c:if test='${i == paging.current}'>active</c:if>">
												${i} </a></li>
									</c:forEach>

									<!-- 다음 -->
									<c:if test="${paging.end < paging.pagetotal}">
										<li><a href="?pstartno=${paging.end + 1}"
											class="page-btn">다음</a></li>
									</c:if>
								</ul>
							</td>
						</tr>
					</tfoot>
				
				
			</table>


		</div>
	</section>

</div>


<!--	footer	-->
<!--	footer	-->
<jsp:include page="../../inc/userFooter.jsp" />