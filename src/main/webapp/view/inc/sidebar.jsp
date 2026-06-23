<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ì‚¬ì´ë“œë°” -->
	<div class="col-md-2 sidebar p-0">

		<div class="logo">MOIT</div>

		<div class="menu">
			<a href="/moit/admin/member/list.do">íšŒì›ê´€ë¦¬</a> <a
				href="/moit/admin/admin/list.do">ê´€ë¦¬ìê´€ë¦¬</a> <a
				href="${pageContext.request.contextPath}/meetup/admin/list.do"
<<<<<<< HEAD
				class="<c:if test='${menu eq \"meetup\"}'>active</c:if>"> >¸ğÀÓ°ü¸®</a>
			<a href="/moit/admin/region/list.do">Áö¿ª°ü¸®</a> <a
				href="/moit/admin/category/list.do">Ä«Å×°í¸®°ü¸®</a> <a
				href="/moit/admin/notice/list.do">°øÁö»çÇ×</a> <a
				href="/moit/admin/event/list.do">Çà»ç°ü¸®</a> <a
				href="/moit/admin/advertisement/list.do">±¤°í°ü¸®</a>
				
				 <a
				href="${pageContext.request.contextPath}/review/admin/list.do"
				class="<c:if test='${menu eq \"review\"}'>active</c:if>">ÈÄ±â°ü¸®</a>
=======
				class="<c:if test='${menu eq \"meetup\"}'>active</c:if>">ëª¨ì§‘ê´€ë¦¬</a> <a
				href="${pageContext.request.contextPath}/advertisement/admin/adList.do">ê´‘ê³ ê´€ë¦¬</a>
			<a
				href="${pageContext.request.contextPath}/report/admin/adminList.do"
				class="<c:if test='${menu eq \"report\"}'>active</c:if>">ì‹ ê³ ê´€ë¦¬</a>
>>>>>>> f731dd0135d56e4b9713e9d5d6f3425152d15e84
		</div>
	</div>
</body>
</html>