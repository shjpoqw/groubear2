<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 근태현황</title>
</head>
<body id="page-top">
	
	<div id="wrapper">
		
		<jsp:include page="../../common/menubarSide.jsp"/>
		
		<div id="content-wrapper" class="d-flex flex-column">
		
			<jsp:include page="../../common/menubarTop.jsp"/>
	
			<div class="content">
		        <div class="container-fluid">
		        	<h1 class="h3 mb-0 text-gray-800">나의 근태현황</h1>
					<br>
					
					<table id="cctArea" class="table" align="center">
						<thead>
							<tr>
								<th colspan="4">
									<input type="date" name="startDate" id="startDate"> - <input type="date" name="endDate" id="endDate">&nbsp;
									<button class="btn btn-secondary" id="myRecordBtn">제출</button>
								</th>
							</tr>
		
							<tr>
								<td colspan="4">누적시간 (<span id="cct">0</span>)
								</td>
							</tr>
						</thead>
						<tbody>
		
						</tbody>
					</table>
		
				</div>
		        <br><br>
		    </div>

			<jsp:include page="../../common/footer.jsp"/>
		
		</div>
	</div>
	
	<script>
	 	$(function(){
	 		selectCommuteList();
			
			$("#myRecordBtn").click(function(){
	    		
	    		$.ajax({
					url:"rlist.cm",
					type:"post",
					data:{startDate:$("#startDate").val().replaceAll('-', '/'),
					      endDate:$("#endDate").val().replaceAll('-', '/'),
					      eno:"${loginUser.empNO}"},
					success:function(){
						selectCommuteList();
						
					},error:function(){
						console.log("출/퇴근 기록 조회 ajax 통신 실패");
					}
				});
				
			});
		});
		
		function selectCommuteList(){
			
			var eno = ${loginUser.empNO};
			var startDate = $("#startDate").val().replaceAll('-', '/');
			var endDate = $("#endDate").val().replaceAll('-', '/');
			
			$.ajax({
				url:"rlist.cm",
				data:{eno:eno,
					startDate:startDate,
					endDate:endDate},
				type:"get",
				success:function(list){					
					var value="";
					var cct=0;
					
					$.each(list, function(i, obj){
						var commuteDate = obj.commuteDate.replaceAll('/', '-');
						var worktimeEnd = new Date(commuteDate + " " + obj.worktimeEnd);
						var worktimeStart = new Date(commuteDate + " " + obj.worktimeStart);
						
						cct += worktimeEnd - worktimeStart;
						
						if("${loginUser.empNO}" == obj.empNo){
							value += "<tr style='background:#EAFAF1'>";
						}else{
							value += "<tr>";
						}
						
						value += "<th>" + obj.empName + " / " + obj.deptName + " / " + obj.jobName + "</th>" + 
									 "<td>" + obj.commuteDate + "</td>" + 
									 "<td>" + obj.worktimeStart + "</td>" + 
									 "<td>" + obj.worktimeEnd + "</td>" +
							 "</tr>";
						
					});
					$("#cctArea tbody").html(value);
					
					var hours = cct / (1000*60*60);
					var absoluteHours = Math.floor(hours);
					var h = absoluteHours > 9 ? absoluteHours : '0' + absoluteHours;
					
					var minutes = (hours - absoluteHours) * 60;
					var absoluteMinutes = Math.floor(minutes);
					var m = absoluteMinutes > 9 ? absoluteMinutes : '0' +  absoluteMinutes;
					
					$("#cct").text(h + "시간 " + m + "분");
				},error:function(){
					console.log("출/퇴근 기록 리스트 조회 ajax 통신 실패");
				}
			});
		}
    </script>

</body>
</html>