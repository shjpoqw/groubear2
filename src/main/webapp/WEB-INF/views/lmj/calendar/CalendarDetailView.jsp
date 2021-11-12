<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>일정보기</title>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link rel="stylesheet"  type="text/css" href="<%=request.getContextPath()%>/resources/css/lmj/jquery.datetimepicker.css">
<script src="<%=request.getContextPath()%>/resources/js/lmj/jquery.datetimepicker.full.min.js"></script>



</head>
<body>



 <div class="row" id="enrollForm">
    <div class="col-md-4 col-md-offset-4">
      <form class="form-horizontal" role="form" id="enrollFormData" action="" method="post">
        <fieldset>

          <!-- Form Name -->
          <legend>일정</legend>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">일정제목</label>
            <div class="col-sm-10">
              <input class="subject" id="calendarTitle" type="text" name="calendarTitle" value="${ cal.calendarTitle }" readonly>
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">시작</label>
            <div class="col-sm-4">
              <input class="date" id="startDate" type="text" name="startDate" value="${ cal.startDate }" readonly>
            </div>

            <label class="col-sm-2 control-label" for="textinput">종료</label>
            <div class="col-sm-4">
              <input class="date" id="endDate" type="text" name="endDate" value="${ cal.endDate }" readonly>
            </div>
          </div>



          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">내용</label>
            <div class="col-sm-10">
              <input class="content" id="calendarContent" type="text" name="calendarContent" value="${ cal.calendarContent }" readonly>

            </div>
          </div>
         
			
			<label class="col-sm-2 control-label" for="textinput">작성일</label>
            <div class="col-sm-4">
               <input  class="empNo" id="empNo" type="text" name="empNo" value="${loginUser.empNO }" style="display:none">
               <input  class="cno" id="cno" type="text" name="cno" value="${cal.calendarNo }" style="display:none">
               <input  class="calendarDate" id="calendarDate" type="text" name="calendarDate" value="${cal.calendarDate }" readonly>
            </div>
          </div>
			
			
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                <button type="button" class="btn btn-default">Cancel</button>
                <button type="button" class="btn btn-primary" onclick="enrollFormDataSubmit();">삭제하기</button>
              </div>
            </div>
          </div>

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->




<script>
					function enrollFormDataSubmit(){
						var postForm = $("#enrollFormData");
						
						
							postForm.attr("action", "delete.cal");
						
						postForm.submit();
					}
					
					
					
				</script>




</body>
</html>