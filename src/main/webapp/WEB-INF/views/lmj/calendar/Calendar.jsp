<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.kh.groubear.lmj.calendar.model.vo.Calendar" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js'></script>
<%
		List<Calendar> list=
	(ArrayList<Calendar>)request.getAttribute("showCalendar");

	System.out.println("@@@@@@@@@jsp list : @@@@@@@" + list);
%>

<script>

	document.addEventListener('DOMContentLoaded', function(){
		
		var calendarEl = document.getElementById('calendar');
		
		var calendar = new FullCalendar.Calendar(calendarEl, {
			
			eventClick : function(info){
				
				var eventObj = info.event;
				
				var eventStr = JSON.stringify(eventObj);
				
				var eventC = JSON.parse(eventStr);
				
			
				
				
				alert(eventC.extendedProps.num);
				
				
				var url = "calendarDetailView.cal?cno="+eventC.extendedProps.num;
				var name = "일정보기";
				var option = "width=600, height =600 ,left=100, top=50, location=no";
				
				window.open(url,name,option);
			},
			
			headerToolbar: {
				left: 'prev,next',
				center: 'title',
				right: 'dayGridMonth, timeGridDay, list'
			},
			navLinks: true,
			businessHours: true,
			editable:true,
			
			locale : "ko",
			
			
			
			events: [
		<%
				for(int i = 0; i < list.size(); i++){
					Calendar cal = (Calendar)list.get(i);
					 
		%>		
				{
				title : '<%= cal.getCalendarTitle() %>',
				start : '<%= cal.getStartDate() %>',
				end : '<%= cal.getEndDate() %>',
				num : '<%= cal.getCalendarNo() %>'
				
				
				},
				
		<%
			}
		
		%>
					{
						title : 'default',
						start : "2021-01-01 12:00",
						end : "2021-01-01 12:00",
						num : 0
						
						
					}
		
			]
			
			
			
		});
		calendar.render();
		
	});
</script>



<style>
	body{
		margin: 40px 10px;
		padding: 0;
		font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
		font-size: 14px;
		
	}
	
	#calendar{
		max-width: 1100px;
		margin: 0 auto;
	}
	
	.add-button{
		position: absolute;
		top: 1px;
		right: 230px;
		background: #2C3E50;
		border: 0;
		color: white;
		height: 35px;
		border-radius: 3px;
		width: 157px;
		
	}
</style>


  </head>
 <body>
 
 
<div id='calendar' style="position : relative;">
	
		<button  class="add-button" type="button" onclick="click_add();">일정추가</button>
	
</div>

<script>
	function click_add(){
		var url = "calendarEnrollForm.cal";
		var name = "일정등록";
		var option = "width=600, height =600 ,left=100, top=50, location=no";
		
		window.open(url,name,option);
	};
</script>





 <jsp:include page="../../common/footer.jsp"/>
</body>


 
</html>