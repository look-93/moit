<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../inc/userHeader.jsp" %>

<style>

.inquiry-wrap{
    padding:40px 0;
}

.page-header{
    display:flex;
    justify-content:space-between;
    align-items:flex-start;
    margin-bottom:30px;
}

.page-header h1{
    font-size:34px;
    margin-bottom:10px;
}

.page-header p{
    color:#64748b;
}

.write-btn{
    background:#2563ff;
    color:white;
    text-decoration:none;
    padding:14px 24px;
    border-radius:12px;
    font-weight:600;
}

.status-tab{
    display:flex;
    gap:40px;
    margin-bottom:25px;
}

.status-tab a{
    text-decoration:none;
    color:#64748b;
    padding-bottom:10px;
}

.status-tab .active{
    color:#2563ff;
    border-bottom:3px solid #2563ff;
}

.content-layout{
    display:flex;
    gap:30px;
}

.list-section{
    flex:1;
    background:white;
    border-radius:20px;
    padding:25px;
    box-shadow:0 4px 15px rgba(0,0,0,0.04);
}

.search-box{
    display:flex;
    gap:15px;
    margin-bottom:25px;
}

.search-box select,
.search-box input{
    height:46px;
    border:1px solid #e5e7eb;
    border-radius:10px;
    padding:0 15px;
}

.search-box input{
    flex:1;
}

.search-box button{
    width:90px;
    border:none;
    border-radius:10px;
    background:#2563ff;
    color:white;
    cursor:pointer;
}

.inquiry-table{
    width:100%;
    border-collapse:collapse;
}

.inquiry-table th{
    background:#f8fafc;
    padding:18px;
    text-align:center;
}

.inquiry-table td{
    padding:18px;
    text-align:center;
    border-bottom:1px solid #f1f5f9;
}

.inquiry-table tbody tr{
    cursor:pointer;
}

.inquiry-table tbody tr:hover{
    background:#f8fafc;
}

.badge{
    padding:5px 12px;
    border-radius:20px;
    font-size:13px;
    font-weight:600;
}

.waiting{
    color:#f97316;
    border:1px solid #f97316;
}

.complete{
    color:#22c55e;
    border:1px solid #22c55e;
}

.paging{
    display:flex;
    justify-content:center;
    gap:8px;
    margin-top:25px;
}

.paging a{
    width:38px;
    height:38px;
    display:flex;
    align-items:center;
    justify-content:center;
    border:1px solid #e2e8f0;
    border-radius:10px;
    text-decoration:none;
    color:#475569;
}

.paging .active{
    background:#2563ff;
    color:white;
}

.guide-box{
    width:260px;
    background:white;
    border-radius:20px;
    padding:25px;
    box-shadow:0 4px 15px rgba(0,0,0,0.04);
}

.guide-box h3{
    margin-bottom:20px;
}

.guide-item{
    display:flex;
    gap:15px;
    margin-bottom:25px;
}

.icon{
    font-size:24px;
}

.guide-item strong{
    display:block;
    margin-bottom:5px;
}

.guide-item p{
    font-size:13px;
    color:#64748b;
}

</style>

<main class="container inquiry-wrap">

    <div class="page-header">
        <div>
            <h1>모임 문의</h1>
            <p>내가 모임 글 작성자에게 문의한 내역을 확인할 수 있습니다.</p>
        </div>

        <a href="${pageContext.request.contextPath}/meetupInquiry/write" class="write-btn">
            ✎ 문의 등록
        </a>
    </div>

    <!-- 상태 탭 -->
    <div class="status-tab">
        <a href="#" class="active">전체</a>
        <a href="#">답변 대기</a>
        <a href="#">답변 완료</a>
    </div>

    <div class="content-layout">
        <!-- 목록 영역 -->
        <div class="list-section">
            <!-- 검색 -->
            <form class="search-box">
                <select name="type">
                    <option>제목</option>
                    <option>모임명</option>
                </select>

                <input type="text" name="keyword" placeholder="검색어를 입력하세요">

                <select name="status">
                    <option>전체 상태</option>
                    <option>답변 대기</option>
                    <option>답변 완료</option>
                </select>

                <button type="submit">검색</button>
            </form>

            <!-- 목록 -->
            <table class="inquiry-table">
                <thead>
                    <tr>
                        <th width="80">번호</th>
                        <th width="180">모임명</th>
                        <th>제목</th>
                        <th width="120">답변 상태</th>
                        <th width="120">등록일</th>
                        <th width="120">답변일</th>
                        <th width="60"></th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>8</td>
                        <td>등산모임 서울/경기</td>
                        <td>주차는 어디에 하나요?</td>
                        <td><span class="badge waiting">답변 대기</span></td>
                        <td>2026-06-18</td>
                        <td>-</td>
                        <td>›</td>
                    </tr>

                    <tr>
                        <td>7</td>
                        <td>독서모임 책이랑</td>
                        <td>준비물이 있나요?</td>
                        <td><span class="badge complete">답변 완료</span></td>
                        <td>2026-06-16</td>
                        <td>2026-06-16</td>
                        <td>›</td>
                    </tr>

                    <tr>
                        <td>6</td>
                        <td>러닝크루 함께 뛰자</td>
                        <td>초보도 참여 가능한가요?</td>
                        <td><span class="badge complete">답변 완료</span></td>
                        <td>2026-06-15</td>
                        <td>2026-06-15</td>
                        <td>›</td>
                    </tr>

                    <tr>
                        <td>5</td>
                        <td>사진모임 빛과 순간</td>
                        <td>모임 장소가 변경됐나요?</td>
                        <td><span class="badge complete">답변 완료</span></td>
                        <td>2026-06-14</td>
                        <td>2026-06-14</td>
                        <td>›</td>
                    </tr>

                    <tr>
                        <td>4</td>
                        <td>캠핑모임 불멍캠프</td>
                        <td>참여 인원 제한이 있나요?</td>
                        <td><span class="badge waiting">답변 대기</span></td>
                        <td>2026-06-12</td>
                        <td>-</td>
                        <td>›</td>
                    </tr>
                </tbody>
            </table>

            <!-- 페이징 -->
            <div class="paging">
                <a href="#">‹</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">›</a>
            </div>

        </div>

        <!-- 우측 가이드 -->
        <aside class="guide-box">
            <h3>이용 가이드</h3>
            <div class="guide-item">
                <div class="icon">📎</div>
                <div>
                    <strong>문의 등록</strong>
                    <p>궁금한 내용을 등록해 주세요.</p>
                </div>
            </div>

            <div class="guide-item">
                <div class="icon">💬</div>
                <div>
                    <strong>답변 확인</strong>
                    <p>작성자의 답변을 확인할 수 있어요.</p>
                </div>
            </div>

            <div class="guide-item">
                <div class="icon">🗓</div>
                <div>
                    <strong>문의 수정/삭제</strong>
                    <p>답변 전까지 수정/삭제가 가능합니다.</p>
                </div>
            </div>
        </aside>
    </div>

</main>

<%@ include file="../../inc/userFooter.jsp" %>