<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출/퇴근 기록</title>
</head>
</head>
<body id="page-top" onload="printClock()">
	
	<div id="wrapper">
		
		<jsp:include page="../../common/menubarSide.jsp"/>
		
		<div id="content-wrapper" class="d-flex flex-column">
		
			<jsp:include page="../../common/menubarTop.jsp"/>
	
			<div class="content">
		        <div class="container-fluid">
		        	<h1 class="h3 mb-0 text-gray-800">출/퇴근 기록</h1>
		        	<br><br>
					 
					<c:if test="${ commuteIs == 0 }">
						<form id="insertForm" action="insertStart.cm" method="post">
							<table id="formBasic" class="table" align="center" style="width:50%; margin:auto; text-align:center;">
								<tr>
									<th><label for="commuteDate">날짜</label></th>
									<td><input type="date" name="commuteDate" id="commuteDate" readonly></td>
								</tr>
								<tr>
									<th style="vertical-align:middle;"><label for="clock">시간</label></th>
									<td>
										<div style="width:100%; height:80px; line-height:80px; color:#666;font-size:40px; text-align:center;" id="clock">
										</div>
									</td>
								<tr>
									<td colspan="2">
										<button type="submit" id="startBtn" class="btn btn-primary" style="width:75%; height:200px;">출근하기</button>
									</td>
								</tr>
							</table>
						
						</form>
					</c:if>
					
					<c:if test="${ commuteIs == 1 }">
						<form id="updateForm" action="updateEnd.cm" method="post">
							<table id="formBasic" class="table" align="center" style="width:50%; margin:auto; text-align:center;">
								<tr>
									<th><label for="commuteDate">날짜</label></th>
									<td><input type="date" name="commuteDate" id="commuteDate" readonly></td>
								</tr>
								<tr>
									<th style="vertical-align:middle;"><label for="clock">시간</label></th>
									<td>
										<div style="width:100%; height:80px; line-height:80px; color:#666;font-size:40px; text-align:center;" id="clock">
										</div>
									</td>
								<tr>
								<tr>
									<td colspan="2">
										<button type="submit" id="endBtn" class="btn btn-warning" style="width:75%; height:200px;">퇴근하기</button>
									</td>
								</tr>
							</table>
						
						</form>
					</c:if>
					
					<c:if test="${ commuteIs >= 2 }">
						<table id="formBasic" class="table" align="center" style="width:50%; margin:auto; text-align:center;">
								<tr>
									<th><label for="commuteDate">날짜</label></th>
									<td><input type="date" name="commuteDate" id="commuteDate" readonly></td>
								</tr>
								<tr>
									<th style="vertical-align:middle;"><label for="clock">시간</label></th>
									<td>
										<div style="width:100%; height:80px; line-height:80px; color:#666;font-size:40px; text-align:center;" id="clock">
										</div>
									</td>
								<tr>
								<tr>
									<td colspan="2">
										<br><br>
										<h1 class="m-0 font-weight-bold text-primary">오늘의 근무가 종료되었습니다.</h1>
										<br><br>
									</td>
								</tr>
						</table>
					</c:if>
				</div>
				<br>
					
		    </div>

			<jsp:include page="../../common/footer.jsp"/>
		
		</div>
	</div>
		
	<script>
		var today = new Date();
	
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
	
		var dateString = year + '-' + month  + '-' + day;
		
		$('input[name=commuteDate]').attr('value', dateString);
		
		
		// 시계
		function printClock() {
		    
		    var clock = document.getElementById("clock");            // 출력할 장소 선택
		    var currentDate = new Date();                                     // 현재시간
		    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
		    var amPm = 'AM'; // 초기값 AM
		    var currentHours = addZeros(currentDate.getHours(),2); 
		    var currentMinute = addZeros(currentDate.getMinutes() ,2);
		    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
		    
		    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
		    	amPm = 'PM';
		    	currentHours = addZeros(currentHours - 12,2);
		    }
		
		    if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
		       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
		    }
		    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:15px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
		    
		    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
		}
		
		function addZeros(num, digit) {
			  var zero = '';
			  num = num.toString();
			  if (num.length < digit) {
			    for (i = 0; i < digit - num.length; i++) {
			      zero += '0';
			    }
			  }
			  return zero + num;
		}
	</script>

</body>
</html>