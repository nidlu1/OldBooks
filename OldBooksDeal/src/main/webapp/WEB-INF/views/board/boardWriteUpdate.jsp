<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/board.css">
<c:set value="${boardRetrieve}" var="b"/>

<h1>게시판 글수정</h1>
<br>
<div>
<table border="1">
	<thead>글수정</thead>
	<tbody>
		<form method="get" id="boardWriteForm">
		<input type="hidden" name="id" value="${Userlogin.id}">
		<input type="hidden" name="username" value="${Userlogin.username}">
		<input type="hidden" name="no" value="${b.no}">
			<tr>
				<th>제목</th>
				<td><input type="text" value="${b.title}" name="title"></td>
			</tr>
			<tr>
				<th>분류</th>
				<td><select name="type">
					<option selected="selected">자유</option>
					<option>요청</option>
					<option>감상</option>
				</select>
				&nbsp;작성자: ${Userlogin.username}
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea cols="10" rows="20" name="content">${b.content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
				<button class="boardBtn" id="boardWrite" type="submit">수정하기</button>
				<button class="boardBtn" type="reset">재작성</button>
				<button class="boardBtn" id="back" type="submit">돌아가기</button>
			</tr>
		</form>
	</tbody>
</table>
</div>
<script type="text/javascript"> //버튼클릭 스크립트
	$(document).ready(function()
	{
		$("#boardWrite").on("click",function()
			{
				$("#boardWriteForm").attr("action","logCheckboardWriteUpdate");
			});
			$("#back").on("click",function()
			{
				$("#boardWriteForm").attr("action","boardUI/1");
			});
	});
</script>
