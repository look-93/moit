<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="../inc/header.jsp" %>

<div class="container my-5">
  <h3>마이페이지</h3> 
  <table class="table table-bordered table-striped">
    <caption>Userinfo</caption>
    <tbody>
      <tr> <th scope="row">닉네임</th> <td>${dto.nickname }</td> </tr>
      <tr> <th scope="row">이메일</th> <td>${dto.email }</td> </tr>
      <tr> <th scope="row">휴대폰</th> <td>${dto.mobile }</td> </tr>
      <tr> <th scope="row">가입일</th> <td>${dto.udate }</td> </tr>
      <tr> <th scope="row">가입IP</th> <td>${dto.bip }</td> </tr>
    </tbody>
    
    
  </table>
  ${ad}
<br>
${ad.title}
<br>
${ad.imageUrl}
  <c:if test="${not empty ad}">

    <div class="card mt-4">

        <div class="card-header">
            광고
        </div>

        <div class="card-body text-center">

            <a href="${pageContext.request.contextPath}/advertisement/click.do?adId=${ad.adId}">

                <img src="${pageContext.request.contextPath}${ad.imageUrl}"
                     style="max-width:100%; border-radius:10px;">

            </a>

        </div>

    </div>

</c:if>
</div>

<%@include file="../inc/footer.jsp" %>
