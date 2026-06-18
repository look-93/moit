<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MOIT | 모집글 상세</title>

<style>

:root{
    --c1:#B6FFFA;
    --c2:#98E4FF;
    --c3:#80B3FF;
    --c4:#687EFF;

    --bg:#f7faff;
    --white:#fff;
    --text:#222;
    --gray:#777;

    --shadow:0 5px 15px rgba(0,0,0,.07);
    --radius:20px;
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    background:var(--bg);
    font-family:sans-serif;
}

/* container */
.container{
    width:1300px;
    max-width:95%;
    margin:auto;
}

/* ================= HEADER (요청 버전) ================= */

header{
    background:white;
    height:80px;
    box-shadow:var(--shadow);
}

.header-inner{
    height:100%;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.logo{
    font-size:30px;
    font-weight:bold;
    color:var(--c4);
}

nav{
    display:flex;
    gap:30px;
}

nav a{
    text-decoration:none;
    color:#333;
}

.search-top{
    width:250px;
    padding:12px;
    border-radius:30px;
    border:1px solid #ddd;
}

.user-box{
    display:flex;
    align-items:center;
    gap:20px;
}

.alarm{
    font-size:22px;
}

.profile{
    display:flex;
    align-items:center;
    gap:12px;
    padding:8px 15px;
    border-radius:30px;
    border:1px solid #eee;
    background:white;
}

.profile-img{
    width:40px;
    height:40px;
    border-radius:50%;
    background:var(--c4);
    color:white;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:bold;
}

.profile-info{
    display:flex;
    flex-direction:column;
}

.profile-info strong{font-size:14px;}
.profile-info span{font-size:12px;color:var(--gray);}

/* ==================
FOOTER
================== */

footer{
    margin-top:50px;
    background:white;
    padding:30px;
    text-align:center;
}

}

</style>
</head>

<body>

<header>
<div class="container header-inner">

    <div class="logo">MOIT</div>

    <nav>
        <a href="#">홈</a>
        <a href="#">모집찾기</a>
        <a href="#">커뮤니티</a>
        <a href="#">공지사항</a>
    </nav>

    <input class="search-top" placeholder="검색">

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
</header>