<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 1:1 문의 등록</title>

<style>
*{margin:0;padding:0;box-sizing:border-box;}
body{
    font-family:'Pretendard',sans-serif;
    background:#f5f7fb;
    color:#222;
}

.page-title{
    text-align:center;
    font-size:56px;
    font-weight:800;
    color:#1f5cff;
    margin:30px 0 10px;
}

.wrapper{
    width:1200px;
    margin:0 auto 40px;
    border:1px solid #dcdfe6;
    background:#fff;
    display:flex;
    min-height:1180px;
}

.sidebar{
    width:180px;
    border-right:1px solid #dcdfe6;
    background:#fff;
}

.logo{
    height:105px;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:42px;
    font-weight:800;
    color:#1f5cff;
    border-bottom:1px solid #dcdfe6;
}

.menu a{
    display:flex;
    align-items:center;
    gap:12px;
    height:62px;
    padding:0 26px;
    text-decoration:none;
    color:#222;
    font-weight:600;
}

.menu a.active{
    background:#0f4cff;
    color:#fff;
}

.content{
    flex:1;
    padding:35px 30px;
}

.content h1{
    font-size:26px;
    margin-bottom:18px;
}

.breadcrumb{
    color:#8088a3;
    font-size:14px;
    margin-bottom:35px;
}

.card{
    background:#fff;
    border-radius:20px;
    padding:40px;
    box-shadow:0 8px 30px rgba(0,0,0,.05);
}

.card h2{
    font-size:22px;
    margin-bottom:35px;
}

.label{
    display:block;
    font-weight:700;
    margin-bottom:12px;
}

.required{color:red;}

.input,
.textarea{
    width:100%;
    border:1px solid #d9deea;
    border-radius:10px;
    padding:18px;
    font-size:16px;
}

.input{
    margin-bottom:35px;
}

.textarea{
    height:360px;
    resize:none;
}

.counter{
    text-align:right;
    color:#7c86aa;
    margin-top:10px;
    font-weight:600;
}

.section-title{
    margin-top:40px;
    margin-bottom:20px;
    font-size:18px;
    font-weight:700;
}

.checkbox-row{
    display:flex;
    align-items:center;
    gap:10px;
    font-size:18px;
    font-weight:600;
}

.desc{
    margin-top:15px;
    color:#7c86aa;
}

.btn-area{
    display:flex;
    justify-content:flex-end;
    gap:20px;
    margin-top:50px;
}

.btn{
    min-width:140px;
    height:60px;
    border-radius:10px;
    border:1px solid #d7dcea;
    font-size:24px;
    font-weight:700;
    cursor:pointer;
}

.btn-primary{
    background:#0f4cff;
    color:#fff;
    border:none;
}
</style>
</head>
<body>

<div class="page-title">&nbsp;</div>

<div class="wrapper">

    <aside class="sidebar">
        <div class="logo">MOIT</div>

        <nav class="menu">
            <a href="#">👥 회원관리</a>
            <a href="#">📋 관리자관리</a>
            <a href="#">🏠 지역관리</a>
            <a href="#">📷 카테고리관리</a>
            <a href="#">⚙ 공지사항</a>
            <a href="#">🗓 행사관리</a>
            <a href="#">📸 광고관리</a>
            <a href="#" class="active">💬 1:1 문의</a>
            <a href="#">⚙ 시스템 설정</a>
        </nav>
    </aside>

    <main class="content">

        <h1>관리자 1:1 문의 등록</h1>
        <div class="breadcrumb">1:1 문의 &nbsp; › &nbsp; 문의 등록</div>

        <div class="card">

            <h2>문의 정보 입력</h2>

            <label class="label">
                제목 <span class="required">*</span>
            </label>

            <input type="text" class="input"
                   placeholder="제목을 입력하세요">

            <label class="label">
                문의 내용 <span class="required">*</span>
            </label>

            <textarea class="textarea"
                      placeholder="문의 내용을 입력하세요."></textarea>

            <div class="counter">0 / 1000</div>

            <div class="section-title">비공개 설정</div>

            <label class="checkbox-row">
                <input type="checkbox">
                비공개로 등록합니다.
            </label>

            <div class="desc">
                · 비공개로 설정 시 관리자만 볼 수 있습니다.
            </div>

            <div class="btn-area">
                <button type="submit" class="btn btn-primary">등록하기</button>
                <button type="button" class="btn">취소</button>
            </div>

        </div>

    </main>

</div>

</body>
</html>
