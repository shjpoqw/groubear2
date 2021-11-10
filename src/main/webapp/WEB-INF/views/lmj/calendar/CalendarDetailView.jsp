<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>일정보기</title>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>



<link rel="stylesheet"  type="text/css" href="<%=request.getContextPath()%>/resources/css/lmj/jquery.datetimepicker.css">
<script src="<%=request.getContextPath()%>/resources/js/lmj/jquery.datetimepicker.full.min.js"></script>



</head>
<body>
<div class="group" id="enrollForm">
	<div class="group-head">
		<h1 class="zTree-h1">일정추가</h1>
	</div>
	<div class="group-body">
	<form id="enrollFormData" action="" method="post">
		<div class="top">
			<input class="subject" id="calendarTitle" type="text" name="calendarTitle" value="${ cal.calendarTitle }" readonly>
		</div>
		<div class="domain">
			<h3 class="zTree-h3">시작일</h3>
		</div>
		<div class="domain">
			<input class="date" id="startDate" type="text" name="startDate" value="${ cal.startDate }" readonly>
		</div>
		<div class="domain">
			<h3 class="zTree-h3">종료일</h3>
		</div>
		<div class="domain">
			<input class="date" id="endDate" type="text" name="endDate" value="${ cal.endDate }" readonly>
		</div>
		<div class="domain">
			<h3 class="zTree-h3">내용</h3>
		</div>
		<div class="domain">
			<textarea class="content" id="calendarContent" name="calendarContent"  rows="5" cols="20" readonly>${ cal.calendarContent }</textarea>
			
		</div>
		
		<div class="domain">
			<h3 class="zTree-h3">작성일</h3>
		</div>
		<div class="domain">
			<input  class="calendarDate" id="calendarDate" type="text" name="calendarDate" value="${cal.calendarDate }" readonly>
		</div>
		
		
		<div class="domain">
			<input  class="empNo" id="empNo" type="text" name="empNo" value="${loginUser.empNO }" style="display:none">
		</div>
		
		<div class="domain">
			<input  class="cno" id="cno" type="text" name="cno" value="${cal.calendarNo }" style="display:none">
		</div>
		
		
		
	</form>
		
		<button class="delete-button" type="button" onclick="enrollFormDataSubmit();">삭제하기</button>
	</div>
</div>

<script>
					function enrollFormDataSubmit(){
						var postForm = $("#enrollFormData");
						
						
							postForm.attr("action", "delete.cal");
						
						postForm.submit();
					}
					
					
					
				</script>




</body>
</html>