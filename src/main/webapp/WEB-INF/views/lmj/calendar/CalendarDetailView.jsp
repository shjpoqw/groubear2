<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>일정보기</title>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>



<link rel="stylesheet"  type="text/css" href="<%=request.getContextPath()%>/resources/css/lmj/jquery.datetimepicker.css">
<script src="<%=request.getContextPath()%>/resources/js/lmj/jquery.datetimepicker.full.min.js"></script>



</head>
<body>



<section class="section" style="width:770px; margin-left:30px;">

    <!--Section heading-->
    <h2 class="section-heading h1 pt-4">일정보기</h2>
    <!--Section description-->
   
    <div class="row">

        <!--Grid column-->
        <div class="col-md-8 col-xl-9" style="max-width:800px;">
            <form id="contact-form" name="enrollFormData"  method="POST">
 				
 				<!--Grid row-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="md-form">
                         <label for="subject" class="">일정제목</label>
                           <input class="form-control" id="subject" type="text" name="calendarTitle" value="${ cal.calendarTitle }" readonly>
                        
                        </div>
                        <br>
                    </div>
                </div>
                <!--Grid row-->
                <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form">
                        <label for="name" class="">시작</label>
                            <input class="form-control" id="startDate" type="text" name="startDate" value="${ cal.startDate }" readonly>
                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6">
                        <div class="md-form">
                        <label for="email" class="">종료</label>
                          
                            <input class="form-control" id="endDate" type="text" name="endDate" value="${ cal.endDate }" readonly>
                        </div>
                    </div>
                    <!--Grid column-->
					
                </div>
                <!--Grid row-->

               
            

                <!--Grid row-->
                <div class="row" style="margin-right:15px;">

                    <!--Grid column-->
                    <div class="col-md-12">
						<br>
                        <div class="md-form">
                         <label for="message">내용</label>
                            <textarea type="text" id="calendarContent" name="calendarContent" rows="2" class="form-control md-textarea" readonly>${ cal.calendarContent }</textarea>
                           
                        </div>

                    </div>
                </div>
                <!--Grid row-->

            </form>
			<br>
			
			
            
            <div class="center-on-small-only">
               
               
               <div class="md-form">
                        <label for="email" class="">작성일</label>
                          	<input  class="empNo" id="empNo" type="text" name="empNo" value="${loginUser.empNO }" style="display:none">
              				 <input  class="cno" id="cno" type="text" name="cno" value="${cal.calendarNo }" style="display:none">
                            <input class="form-control" id="calendarDate" type="text" name="calendarDate" value="${ cal.calendarDate }" readonly>
                        </div>
               
               
            <br><br>
                <button type="button" class="btn btn-primary" onclick="deleteCal();">삭제하기</button>
            </div>
            <div class="status"></div>
        </div>
        <!--Grid column-->

       

    </div>

</section>
<!--Section: Contact v.2-->



<script>
	function deleteCal(){
		
		var cno = ${cal.calendarNo};
		
		
		$.ajax({
			type:'post',
			url:'delete.cal',
			data : {"cno" : cno},
			success : function(data){
				
				 opener.parent.location.reload();
				 window.close();
			}
		});
	};
</script>


</body>
</html>