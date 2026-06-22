<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MOIT</title>
<style>
@import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css');

:root{
    --c1:#B6FFFA;
    --c2:#98E4FF;
    --c3:#80B3FF;
    --c4:#687EFF;

    --bg:#f8fafc;
    --white:#fff;
    --text:#1e293b;
    --gray:#64748b;

    --shadow: 0 4px 20px -2px rgba(104, 126, 255, 0.06);
    --radius:20px;
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}




body {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    background: var(--bg);
    margin: 0; /* 기본 마진 제거 */
}

.container{
    width:1200px;
    max-width:95%;
    margin:auto;
}

/* ================= HEADER (로고+메뉴 좌측 밀집 버전) ================= */

.header-inner{
    height:100%;
    display:flex;
    justify-content:space-between; /* 좌측 그룹과 우측 그룹을 양 끝으로 배치 */
    align-items:center;
}

/* 💡 [NEW] 로고와 메뉴를 한 공간에 묶어 왼쪽에 밀착시킵니다 */
.left-group {
    display: flex;
    align-items: center;
    gap: 45px; /* 로고와 '홈' 메뉴 사이의 간격 */
}

.logo {
	font-size: 24px;
	font-weight: bold;
	color: #4a7dff;
	padding: 25px;
	text-align: center;
	border-bottom: 1px solid #eee;
	text-decoration: none;
}

nav{
    display:flex;
    gap:30px; /* 홈과 모집찾기 사이의 간격 */
}

nav a{
    text-decoration:none;
    color:#475569;
    font-weight: 600;
    padding: 8px 0;
    position: relative;
    transition: color 0.2s ease;
}

nav a:hover, nav a.active {
    color: var(--c4);
}

nav a::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 0;
    height: 3px;
    background-color: var(--c4);
    border-radius: 2px;
    transition: width 0.2s ease;
}

nav a:hover::after, nav a.active::after {
    width: 100%;
}

/* 💡 [NEW] 우측 유저박스와 슬로건을 감싸는 그룹 */
.right-group {
    display: flex;
    align-items: center;
    gap: 30px; /* 슬로건과 알림 아이콘 사이의 간격 */
}

/* 예쁜 슬로건 텍스트 바 */
.header-slogan {
    font-size: 13px;
    font-weight: 700;
    color: var(--c4);
    background: rgba(104, 126, 255, 0.08);
    padding: 6px 16px;
    border-radius: 20px;
    letter-spacing: -0.3px;
    display: flex;
    align-items: center;
    gap: 6px;
    user-select: none;
}

.header-slogan::before {
    content: '✨';
}

.user-box{
    display:flex;
    align-items:center;
    gap:24px;
}

.alarm{
    font-size:22px;
    cursor: pointer;
    position: relative;
    transition: transform 0.2s;
}

.alarm:hover {
    transform: scale(1.1);
}

.alarm::after {
    content: '';
    position: absolute;
    top: -2px;
    right: -2px;
    width: 6px;
    height: 6px;
    background-color: #ef4444;
    border-radius: 50%;
}

.profile{
    display:flex;
    align-items:center;
    gap:12px;
    padding: 6px 16px 6px 6px;
    border-radius:30px;
    border: 1px solid #f1f5f9;
    background:#f8fafc;
    cursor: pointer;
    transition: all 0.2s ease;
}

.profile:hover {
    background: #f1f5f9;
    border-color: #e2e8f0;
}

.profile-img{
    width:38px;
    height:38px;
    border-radius:50%;
    background: linear-gradient(135deg, var(--c3) 0%, var(--c4) 100%);
    color:white;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:700;
    box-shadow: 0 2px 6px rgba(104, 126, 255, 0.25);
}

.profile-info{
    display:flex;
    flex-direction:column;
    line-height: 1.4;
}

.profile-info strong{
    font-size:14px;
    color: #1e293b;
    font-weight: 700;
}

.profile-info span{
    font-size:11px;
    color:var(--gray);
    font-weight: 500;
}

/* ==================
FOOTER
================== */

footer {
    margin-top: auto; /* 💡 flex 구조에서 자동으로 최하단에 배치됨 */
    background: white;
    padding: 30px;
    text-align: center;
    color: var(--gray);
    border-top: 1px solid #edf2f7;

/* ================= 헤더 깨짐 방지 반응형 코드 추가 ================= */
@media (max-width: 1024px) {
    /* 1. 화면이 좁아지면 자리를 많이 차지하는 슬로건을 숨깁니다 */
    .header-slogan {
        display: none !important;
    }
    
    /* 2. 로고와 메뉴, 유저박스 사이의 간격을 좁혀 여유 공간을 만듭니다 */
    .left-group {
        gap: 20px;
    }
    nav {
        gap: 15px;
    }
    .right-group {
        gap: 15px;
    }
    .user-box {
        gap: 12px;
    }
}

@media (max-width: 768px) {
    /* 3. 모바일 환경에서 글자가 절대 세로로 찢어지지 않도록 강제 고정 */
    nav a, .logo, .profile-info strong {
        white-space: nowrap !important;
        word-break: keep-all !important;
    }
    
    /* 4. 프로필의 등급(일반회원) 텍스트를 숨겨 공간을 확보합니다 */
    .profile-info span {
        display: none;
    }
    .profile {
        padding: 4px 10px 4px 4px;
    }
}
</style>
</head>

<body>

<header>
<div class="container header-inner">

    <div class="left-group">
       	<a href="${pageContext.request.contextPath}/" class="logo">
       		MOIT
   		</a>
		<nav>
		    <a href="${pageContext.request.contextPath}/meetup/user/list.do"
		       class="<c:if test='${menu eq "meetup"}'>active</c:if>">모집찾기</a>
		       
		    <a href="/inquiry/list" class="inquiry-btn">💬 관리자 1:1 문의 </a>
		     
		</nav>
    </div>

    <div class="right-group">
        <div class="header-slogan">
            <span>우리들의 취향 맞춤 소모임 플랫폼</span>
        </div>
        
        <div class="user-box">
            <div class="alarm">🔔</div>
            <div class="profile">
                <div class="profile-img">J</div>
                <div class="profile-info">
                    <strong>예진님</strong>
                    <span>일반회원</span>
                </div>
            </div>
        </div>
    </div>

</div>
</header>
