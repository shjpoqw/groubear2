<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>일정추가</title>

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
	<form id="enrollFormData">
		<div class="top">
			<input class="subject" id="calendarTitle" type="text" name="calendarTitle" placeholder="제목을 입력해주세요">
		</div>
		<div class="domain">
			<h3 class="zTree-h3">시작</h3>
		</div>
		<div class="domain">
			<input class="date" id="startDate" type="text" name="startDate">
		</div>
		<div class="domain">
			<h3 class="zTree-h3">종료</h3>
		</div>
		<div class="domain">
			<input class="date" id="endDate" type="text" name="endDate">
		</div>
		<div class="domain">
			<h3 class="zTree-h3">내용</h3>
		</div>
		<div class="domain">
			<textarea class="content" id="calendarContent" name="calendarContent"  rows="5" cols="20" placeholder="100글자까지 입력가능합니다"></textarea>
			
		</div>
		
		<div class="domain">
			<input  class="empNo" id="empNo" type="text" name="empNo" value="${loginUser.empNO }" style="display:none">
		</div>
		
	</form>
		<button class="ok-button" type="button" onclick="click_ok();">확인</button>
	</div>
</div>

<script>
	$.fn.serializeObject = function(){
		
		var o = {};
		var a = this.serializeArray();
		$.each(a, function(){
			var name = $.trim(this.name),
					value = $.trim(this.value);
			
			if(o[name]){
				if(!o[name].push){
					o[name] = [o[name]];
				}
				o[name].push(value || '');
			}else{
				o[name] = value || '';
			}
		});
		return o;
	};
	
	function click_ok(){
		 var enrollFormData = 
	JSON.stringify($('form#enrollFormData').serializeObject());
		 
		 $.ajax({
			 data : enrollFormData,
			 url : "addCalendar",
			 type : "POST",
			 dataType : "json",
			 contentType : "application/json; charset=UTF-8",
			 success : function(data){
				 opener.parent.location.reload();
					window.close();
			 }
		 });
	};
</script>

<script>
	$(function(){
		$('.date').datetimepicker({
			lang:'kr',
			format:"Y-m-d H:i",
			inline:true
		});
	});
	
</script>

</body>
</html>