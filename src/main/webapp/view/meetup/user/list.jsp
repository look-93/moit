<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../../inc/userHeader.jsp"%>
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

    --radius:20px;
    --shadow:0 5px 15px rgba(0,0,0,.07);
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:sans-serif;
    background:var(--bg);
}

.container{
    width:1400px;
    max-width:95%;
    margin:auto;
}

/* PAGE */

.page{
    margin-top:30px;
    display:grid;
    grid-template-columns:260px 1fr;
    gap:25px;
}

/* SIDEBAR */

.sidebar{
    background:white;
    border-radius:20px;
    padding:25px;
    box-shadow:var(--shadow);
    height:fit-content;
}

.sidebar h3{
    margin-bottom:20px;
}

.category{
    display:flex;
    flex-direction:column;
    gap:10px;
}

.category a{
    padding:12px;
    border-radius:12px;
    text-decoration:none;
    color:#333;
}

.category a:hover,
.category .active{
    background:var(--c2);
}

/* CONTENT */

.content{
    display:flex;
    flex-direction:column;
    gap:20px;
}

.filter-box{
    background:white;
    border-radius:20px;
    padding:20px;
    box-shadow:var(--shadow);

    display:flex;
    gap:10px;
    flex-wrap:wrap;
}

.filter-box input,
.filter-box select{
    padding:12px;
    border-radius:12px;
    border:1px solid #ddd;
}

.filter-box button{
    background:var(--c4);
    color:white;
    border:none;
    padding:12px 20px;
    border-radius:12px;
}

/* CARD */

.card-grid{
    display:grid;
    grid-template-columns:
    repeat(auto-fill,minmax(280px,1fr));
    gap:20px;
}

.card{
    background:white;
    border-radius:20px;
    overflow:hidden;
    box-shadow:var(--shadow);
    transition:.3s;
}

.card:hover{
    transform:translateY(-5px);
}

.card-img{
    height:180px;
    background:linear-gradient(
    135deg,
    var(--c2),
    var(--c3)
    );
}

.card-body{
    padding:20px;
}

.badge{
    display:inline-block;
    background:#dfffe4;
    color:#009933;
    padding:5px 10px;
    border-radius:20px;
    font-size:12px;
    margin-bottom:10px;
}

.badge-close{
    background:#ffe5e5;
    color:red;
}

.card h4{
    margin-bottom:10px;
}

.card p{
    color:var(--gray);
    margin-bottom:5px;
    font-size:14px;
}

.card-footer{
    margin-top:15px;
    display:flex;
    justify-content:space-between;
}

.like{
    color:var(--c4);
}

/* PAGINATION */

.pagination{
    display:flex;
    justify-content:center;
    gap:10px;
    margin-top:20px;
}

.pagination a{
    width:40px;
    height:40px;
    background:white;
    display:flex;
    justify-content:center;
    align-items:center;
    border-radius:10px;
    text-decoration:none;
    color:#333;
}

.pagination .active{
    background:var(--c4);
    color:white;
}

/* MOBILE */

@media(max-width:768px){

.page{
    grid-template-columns:1fr;
}

nav{
    display:none;
}

.search-top{
    display:none;
}

}

/* SIDEBAR AD */

.sidebar-ad{
    margin-top:25px;
    height:320px;

    background:linear-gradient(
        180deg,
        var(--c4),
        var(--c3)
    );

    border-radius:20px;
    padding:25px;

    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;

    text-align:center;
    color:white;

    box-shadow:var(--shadow);
}

.sidebar-ad .ad-tag{
    background:rgba(255,255,255,.2);
    padding:5px 12px;
    border-radius:20px;
    margin-bottom:15px;
    font-size:12px;
}

.sidebar-ad h3{
    font-size:24px;
    margin-bottom:15px;
    line-height:1.4;
}

.sidebar-ad p{
    margin-bottom:20px;
    line-height:1.6;
}

.sidebar-ad a{
    background:white;
    color:var(--c4);

    text-decoration:none;

    padding:12px 20px;
    border-radius:12px;

    font-weight:bold;
}

/* TOP AD */

.top-ad{
    background:linear-gradient(
        135deg,
        var(--c1),
        var(--c2)
    );
    border-radius:20px;
    padding:25px;
    box-shadow:var(--shadow);

    display:flex;
    justify-content:space-between;
    align-items:center;
}

.top-ad-left h3{
    margin-bottom:10px;
}

.top-ad-btn{
    background:var(--c4);
    color:white;
    padding:12px 20px;
    border-radius:12px;
    text-decoration:none;
}

</style>

<div class="container">

    <div class="page">

        <!-- LEFT -->

        <aside class="sidebar">

            <h3>카테고리</h3>

            <div class="category">

                <a href="#" class="active">전체</a>
                <a href="#">운동/스포츠</a>
                <a href="#">문화/예술</a>
                <a href="#">스터디</a>
                <a href="#">봉사활동</a>
                <a href="#">게임</a>
                <a href="#">여행</a>
                <a href="#">음악</a>

            </div>

            <div class="sidebar-ad">

                <div class="ad-tag">
                    ADVERTISEMENT
                </div>

                <h3>
                    신규 회원<br>
                    특별 혜택
                </h3>

                <p>
                    가입만 해도<br>
                    할인 쿠폰 지급
                </p>

                <a href="#">
                    지금 확인하기
                </a>

            </div>

        </aside>

        <!-- RIGHT -->

        <section class="content">

            <section class="content">

                <div class="top-ad">

                    <div class="top-ad-left">
                        <h3>🔥 신규 제휴업체 오픈</h3>
                        <p>
                            가입 회원 대상 20% 할인 쿠폰 지급
                        </p>
                    </div>

                    <a href="#" class="top-ad-btn">
                        바로가기
                    </a>

                </div>

            <div class="filter-box">

                <input
                type="text"
                placeholder="모임명 검색">

                <select>
                    <option>전체 지역</option>
                    <option>서울</option>
                    <option>인천</option>
                    <option>경기</option>
                </select>

                <select>
                    <option>최신순</option>
                    <option>인기순</option>
                    <option>마감임박순</option>
                </select>

                <button>검색</button>

            </div>

            <div class="card-grid">

                <!-- CARD 1 -->

                <div class="card">

                    <div class="card-img"></div>

                    <div class="card-body">

                        <span class="badge">
                            모집중
                        </span>

                        <h4>러닝 크루 모집</h4>

                        <p>🏃 운동/스포츠</p>
                        <p>📍 서울</p>
                        <p>👥 8 / 10명</p>

                        <div class="card-footer">
                            <span>2026.06.15</span>
                            <span class="like">❤️ 34</span>
                        </div>

                    </div>

                </div>

                <!-- CARD -->

                <div class="card">

                    <div class="card-img"></div>

                    <div class="card-body">

                        <span class="badge">
                            모집중
                        </span>

                        <h4>독서 스터디</h4>

                        <p>📚 스터디</p>
                        <p>📍 인천</p>
                        <p>👥 5 / 8명</p>

                        <div class="card-footer">
                            <span>2026.06.14</span>
                            <span class="like">❤️ 21</span>
                        </div>

                    </div>

                </div>

                <div class="card">

                    <div class="card-img"></div>

                    <div class="card-body">

                        <span class="badge badge-close">
                            마감
                        </span>

                        <h4>보드게임 모임</h4>

                        <p>🎲 게임</p>
                        <p>📍 경기</p>
                        <p>👥 10 / 10명</p>

                        <div class="card-footer">
                            <span>2026.06.10</span>
                            <span class="like">❤️ 48</span>
                        </div>

                    </div>

                </div>

                <div class="card">

                    <div class="card-img"></div>

                    <div class="card-body">

                        <span class="badge">
                            모집중
                        </span>

                        <h4>주말 등산 모임</h4>

                        <p>⛰️ 운동</p>
                        <p>📍 서울</p>
                        <p>👥 12 / 15명</p>

                        <div class="card-footer">
                            <span>2026.06.12</span>
                            <span class="like">❤️ 62</span>
                        </div>

                    </div>

                </div>

                <div class="card">
                    <div class="card-img"></div>
                    <div class="card-body">
                        <span class="badge">모집중</span>
                        <h4>영화 같이 볼 사람</h4>
                        <p>🎬 문화</p>
                        <p>📍 부천</p>
                        <p>👥 7 / 10명</p>
                    </div>
                </div>

                <div class="card">
                    <div class="card-img"></div>
                    <div class="card-body">
                        <span class="badge">모집중</span>
                        <h4>카페 투어 모임</h4>
                        <p>☕ 문화</p>
                        <p/모집글목록.html>📍 서울</p>
                        <p>👥 4 / 8명</p>
                    </div>
                </div>

            </div>

            <div class="pagination">

                <a href="#">‹</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">›</a>

            </div>

        </section>

    </div>

</div>
<%@ include file="../../inc/userFooter.jsp"%>