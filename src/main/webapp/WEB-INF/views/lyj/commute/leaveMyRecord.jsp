<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연차 내역</title>
<style>
	.modal-backdrop {
	  display: none;
	}
</style>
</head>
<body id="page-top">
	
	<div id="wrapper">
		
		<jsp:include page="../../common/menubarSide.jsp"/>
		
		<div id="content-wrapper" class="d-flex flex-column">
		
			<jsp:include page="../../common/menubarTop.jsp"/>
	
			<div class="content">
		        <div class="container-fluid">
		        	<h1 class="h3 mb-0 text-gray-800">연차 내역</h1>
					<br>
					
					<!-- btns -->
		            <div class="btns" align="center">
		            	<c:if test="${ loginUser.empId eq 'admin' }">
		            		<a class="ls-modal btn btn-outline-primary" data-toggle="modal" 
		            		href="createModalView.lv" data-target="#modal">연차 생성</a>
						</c:if>
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#useModal">연차 사용</button>
						<!-- <button type="button" class="btn btn-primary" onclick="useLeave();">연차 사용</button> -->
					</div>
					<br><br>
					
					<h5 class="m-0 font-weight-bold text-primary">사용내역</h5>
			        <div class="my-2"></div>
					<table id="useArea" class="table" align="center">
						<thead>
							<tr>
								<th>No</th>
								<th>연차 발생일</th>
								<th>연차 사용기간</th>
								<th>연차 사용일</th>
							</tr>
						</thead>
						<tbody>
		
						</tbody>
					</table>
					
					<br><br>
					
					<!-- 생성내역 -->
					<h5 class="m-0 font-weight-bold text-primary">생성내역</h5>
			        <div class="my-2"></div>
					<table id="createArea" class="table" align="center">
						<thead>
							<tr>
								<th>연차 발생일</th>
								<th>연차 사용기간</th>
								<th>발생일수</th>
							</tr>
						</thead>
						<tbody>
		
						</tbody>
					</table>
					
					<br><br>
					
					<!-- Modal Start -->
					<div class="modal fade" id="modal">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">

									<!-- header title -->
									<h4 class="modal-title">연차 생성</h4>
									<!-- 닫기(x) 버튼 -->
									<button type="button" class="close" data-dismiss="modal">×</button>

								</div>

								<!-- body -->
								<div class="modal-body">
									<!--여기에 외부에서 작성한 테이블 들어옴-->
								</div>

								<!-- Footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
					<!-- Modal End -->
					
					<!-- 모달팝업 -->
					<div class="modal fade" id="useModal" tabindex="-1" role="dialog" aria-labelledby="useModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="useModalLabel">연차 사용</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        <form id="updateForm" action="update.lv" method="post">
					          <div class="form-group">
					            <label for="recipient-name" class="col-form-label">연차 사용일 : </label>
					            <input type="date" name="leaveUseDate" id="leaveUseDate">
					          </div>
					        </form>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-primary" id="sendBtn">Send</button>
					      </div>
					    </div>
					  </div>
					</div>

				</div>
		        <br><br>
		    </div>

			<jsp:include page="../../common/footer.jsp"/>
		
		</div>
	</div>
	
	<script>
		$('.ls-modal').on('click', function(e){
			e.preventDefault();
			$('#modal').modal('show').find('.modal-body').load($(this).attr('href'));
		});
		
	 	$(function(){
	 		selectUseList();
	 		selectCreateList();
			
			$("#sendBtn").click(function(){
	    		
	    		$.ajax({
					url:"update.lv",
					type:"post",
					data:{leaveUseDate:$("#leaveUseDate").val().replaceAll('-', '/'),
					      eno:"${loginUser.empNO}"},
					success:function(){
						selectUseList();
						
						$("#useModal").hide();
						
					},error:function(){
						console.log("연차 사용 ajax 통신 실패");
					}
				});
				
			});
		});
		
		function selectUseList(){
			var eno = ${loginUser.empNO};
			
			$.ajax({
				url:"ulist.lv",
				data:{eno:eno},
				type:"get",
				success:function(list){					
					var value="";
					
					$.each(list, function(i, obj){
						
						value += "<tr><td>" + obj.leaveNo + "</td>" + 
									 "<td>" + obj.leaveOccurDate + "</td>" + 
									 "<td>" + obj.leaveEndDate + "</td>" + 
									 "<td>" + obj.leaveUseDate + "</td>" +
							 "</tr>";
						
					});
					$("#useArea tbody").html(value);
					
				},error:function(){
					console.log("사용내역 조회 ajax 통신 실패");
				}
			});
		}
		
		function selectCreateList(){
			var eno = ${loginUser.empNO};
			
			$.ajax({
				url:"clist.lv",
				data:{eno:eno},
				type:"get",
				success:function(list){					
					var value="";
					
					$.each(list, function(i, obj){
						
						value += "<tr><td>" + obj.leaveOccurDate + "</td>" + 
									 "<td>" + obj.leaveEndDate + "</td>" + 
									 "<td>" + obj.count + "</td>" +
							 "</tr>";
						
					});
					$("#createArea tbody").html(value);
					
				},error:function(){
					console.log("생성내역 조회 ajax 통신 실패");
				}
			});
		}
    </script>

</body>
</html>