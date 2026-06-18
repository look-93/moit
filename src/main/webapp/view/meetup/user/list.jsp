<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="../../inc/userHeader.jsp"%> --%>
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
			<form action="${pageContext.request.contextPath}/meetup/user/list.do" method="get">		
	            <div class="filter-box">
					<!-- 검색 -->
	                <input type="text" name="searchText" placeholder="모임명 검색">
					<!-- 시도 -->
	                <select id="sido" name="sido">
	                    <option value="">전체 지역</option>	                    
	                    <c:forEach var="sido" items="${sidoList}" varStatus="status">
	                    	<option value="${sido.sidoId}">${sido.name}</option>	                    
	                    </c:forEach>

	                </select>
	
	                <select id="orderType" name="orderType">
	                    <option value="createAt">최신순</option>
	                    <option value="like">인기순</option>
	                    <option value="meetupAt">마감임박순</option>
	                </select>
	
	                <button>검색</button>
	
	            </div>
            </form>

            <div class="card-grid">

                <!-- CARD -->
				
				<c:forEach var="serchList" items="${serchList}" varStatus="status">
	                <div class="card">
	
	                    <div class="card-img"></div>
	
	                    <div class="card-body">
	
	                        <span class="badge">
	                        	<c:choose>
	                        		<c:when test="${serchList.status eq 'RECRUITING'}" >
	                        			모집중
	                        		</c:when>
	                        		<c:when test="${serchList.status eq 'CLOSED'}" >
	                        			모집마감
	                        		</c:when>	                        	
	                        	</c:choose>
	                        
	                            
	                        </span>
	
	                        <h4>${serchList.title}</h4>
	
	                        <p>🏃 운동/스포츠</p>  <!-- 수정 카테고리추가 -->
	                        <p>${serchList.sigunguName}</p>
	                        <p>👥 ${serchList.participant} / ${serchList.maxParticipants}명</p>
	
	                        <div class="card-footer">
	                            <span>${serchList.fomatMeetupAt}</span>
	                            <span class="like">❤️ 34</span> <!-- 수정 좋아요 -->
	                        </div>
	
	                    </div>
	
	                </div>

				</c:forEach>
            </div>
				
            <div class="pagination">

				<!-- 이전 -->
				<c:if test="${paging.start > paging.bottomlist}">
					<a class="page-link" href="?pstartno= ${paging.start-1}"> < </a>
					
				</c:if>

				<!-- 1,2,3,4,5,6 -->
				<c:forEach var="i" begin="${paging.start}" end="${paging.end}">
			        <a href="?pstartno=${i}"
			           class="${i == paging.current ? 'active' : ''}">
			            ${i}
			        </a>
				</c:forEach>

			    <!-- 다음 -->
			    <c:if test="${paging.pagetotal > paging.end}">
			        <a href="?pstartno=${paging.end+1}">›</a>
			    </c:if>

            </div>

        </section>

    </div>

</div>
<!-- <script>

console.log("${sidoList}")
</script> -->
<%-- <%@ include file="../../inc/userFooter.jsp"%> --%>