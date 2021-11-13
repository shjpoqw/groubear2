<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>일정추가</title>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<link rel="stylesheet"  type="text/css" href="<%=request.getContextPath()%>/resources/css/lmj/jquery.datetimepicker.css">
<script src="<%=request.getContextPath()%>/resources/js/lmj/jquery.datetimepicker.full.min.js"></script>



</head>
<body>


<div class="row" id="enrollForm" style="">
    <div class="col-md-4 col-md-offset-4">
      <form class="form-horizontal" role="form" id="enrollFormData">
        <fieldset>

          <!-- Form Name -->
          <legend style="align:center">일정등록</legend>
			
          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">일정제목</label>
            <div class="col-sm-10">
            <br>
              <input class="subject" id="calendarTitle" type="text" name="calendarTitle" placeholder="제목을 입력해주세요" class="form-control">
            </div>
          </div>

        	<br>

          <!-- Text input-->
          <div class="form-group" style="display:flex">
          
          
          
            <label class="col-sm-2 control-label" for="textinput">시작</label>
            <div class="col-sm-4">
              <input class="date" type="text" name="startDate" class="form-control" style="margin-left:-10px">
            </div>

            <label class="col-sm-2 control-label" for="textinput" style="margin-left:20px">종료</label>
            <div class="col-sm-4" style="margin-left:80px;" >
              <input class="date"  type="text" name="endDate" class="form-control" >
            </div>
            
            
            
          </div>


		
          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">일정내용</label>
            <div class="col-sm-10">
              <textarea class="content" id="calendarContent" name="calendarContent"  rows="5" cols="20" placeholder="100글자까지 입력가능합니다"></textarea>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput"></label>
            <div class="col-sm-10">
              <input  class="empNo" id="empNo" type="text" name="empNo" value="${loginUser.empNO }" style="display:none">
            </div>
          </div>

          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                <button type="submit" class="btn btn-default">Cancel</button>
                <button type="button" class="btn btn-primary" onclick="click_ok();">등록하기</button>
              </div>
            </div>
          </div>

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->




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
			alert(enrollFormData);
		 $.ajax({
			 data : enrollFormData,
			 url : "addCalendar",
			 type : "POST",
			 dataType : "json",
			 contentType : "application/json; charset=UTF-8",
			 error : function(){
				 alert("error");
				 opener.parent.location.reload();
				 window.close();
			 },
			 success : function(data){
				alert("success"); 
				 opener.parent.location.reload();
				 window.close();
			 }
			 
			
			
		 });
	};
</script>

<script>
	$(function(){
		$('.date').datetimepicker({
			
			language : 'ko',
			format:"Y-m-d H:i",
			inline:true,
			
		});
	});
	
</script>

</body>
</html>