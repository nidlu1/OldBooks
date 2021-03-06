<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!--
START MODULE AREA 1: Feature 1
-->

<section class="MOD_FEATURE">
  <div data-layout="_r">
 
 	<c:forEach items="${productList}" var="prod">
	    <div data-layout="ch8 ec4">
	      <a href="productDetail/${prod.pboard_no}" class="MOD_FEATURE_Container">
	        <img class="MOD_FEATURE_Picture" src="image/${prod.originalFilename1}" alt="이미지가 없습니다" style="height: 400;width: 250" >
	        <div class="MOD_FEATURE_TextContainer">
	          <p class="MOD_FEATURE_Title" data-theme="_ts2">${prod.title}</p>
	          <p class="MOD_FEATURE_Description">작성자: ${prod.username}, 조회수:${prod.pview}<br>등록일:${prod.registdate}</p>
	        </div>
	      </a>
	    </div>
 	</c:forEach>
  </div>
</section>
<c:if test="${empty productList}">
	<h1>조회하신 상품들이 없습니다.</h1>
</c:if>
<!--
END MODULE AREA 1: Feature 1
-->
