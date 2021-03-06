<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<div>
	<form method="post" enctype="multipart/form-data" action="productBoardRegist">
		<input type="hidden" name="id" value="${Userlogin.id}" id="productId">
		
		<button type="button" id="imageInsert">이미지추가</button>
		<button type="button" id="imageDelete">이미지삭제</button>
		<button type="button" id="imageShow">미리보기</button>
		<br>
		<div id="imageSelection"></div><br><!-- 	이미지나오는 부분	  -->
		<div id="preview"></div><!-- 	이미지나오는 부분	  -->
		<table>
			<thead></thead>
			<tfoot></tfoot>
			<tbody>
				<tr>
					<td>제목:</td>
					<td><input type="text" name="title"></td>
				</tr>			
				<tr>
					<td>가격(숫자만 입력):</td>
					<td><input type="text" name="price"></td>
				</tr>			
				<tr>
					<td>거래장소:</td>
					<td><input type="text" name="productLocation"></td>
				</tr>			
				<tr>
					<td>물건종류</td>
					<td>
						<input type="radio" value="가구" name="productType" style="width: 30">가구
						<input type="radio" value="책" name="productType" style="width: 30">책
						<input type="radio" value="취미" name="productType" style="width: 30">취미
						<input type="radio" value="악세사리" name="productType" style="width: 30">"악세사리"
						<input type="radio" value="의류" name="productType" style="width: 30">"의류"
						<input type="radio" value="디지털" name="productType" style="width: 30">"디지털"
					</td>
				</tr>			
				<tr>
					<td>내용:</td>
					<td><textarea rows="100px" cols="150px" name="pcontents"></textarea></td>
				</tr>			
			</tbody>
		</table>
		<input type="submit" value="업로드" id="productSumbit">
		<input type="reset" value="다시작성">
	</form>
	
</div>
<script>
 $(document).ready(function()
 	{
		var imageSelectionNo = 1;
		
	 	$("#imageShow").on("click",function()
		{
 			showPreview($(".theFile"));
		});	 	
	 	//연속으로 처리
	 	$("#imageInsert").on("click",function()
		{	 		
	 		switch(imageSelectionNo)
	 		{
	 		case 1: 
	 			console.log("before",imageSelectionNo);
	 			$("#imageSelection").append("<input type='file' class='theFile' name='image"+imageSelectionNo+"'>");	 		
	 			imageSelectionNo=2;
	 			console.log("after",imageSelectionNo);
	 			break;
	 		case 2:	
	 			$("#imageSelection").append("<input type='file' class='theFile' name='image"+imageSelectionNo+"'>");	 		
	 			imageSelectionNo=3;
	 			console.log(imageSelectionNo);	
	 			break;
	 		case 3:
	 			$("#imageSelection").append("<input type='file' class='theFile' name='image"+imageSelectionNo+"'>");	 		
	 			imageSelectionNo=4;
	 			console.log(imageSelectionNo);
	 			break;
	 		case 4:
	 			alert("최대 3개까지 첨부할 수 있습니다");
	 		}	 		
		});	 	
	 	$("#imageDelete").on("click",function()
		{
	 		$(".theFile:last").remove();	 		
	 		$(".imgTarget:last").remove();
	 		switch (imageSelectionNo) {
			case 4:
				imageSelectionNo = 3;
				break;
			case 3:
				imageSelectionNo = 2;
				break;
			case 2:
				imageSelectionNo = 1;
				break;
			default:
				break;
			}
		});	 	
 	});
 
 	function showPreview(_input)
	{
 		for(var i=0; i < 3 ;i++)
 		{
 			console.dir(_input[i])
	 		var file = _input[i].files[0];
	 		console.dir(file);
	 		var reader = new FileReader();
	 		console.dir(reader);
	 		if(file!=null)
	 		{
		 		reader.onload = function (img)
		 		{
		 			console.dir(img);
		 		   //$(".imgTarget").remove();
		            $("#preview").append(
		                "<img class='imgTarget' src='" + img.target.result + "' width='100px' height='100px' />"
		            );
		        };        
		        reader.readAsDataURL(file); 			 			
	 		}else
	 		{
	 			$(".imgTarget").remove();
	 		}
 		}
 		
	}
</script>



