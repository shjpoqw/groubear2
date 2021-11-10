<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 문서함</title>
<style>
	.box{
		display: inline-block;
    	margin-top: 60px;
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
		        	<h1 class="h3 mb-0 text-gray-800">결재 문서함</h1>
		            <br>
		            <h3 style="display:inline">${ a.approvalFormName }</h3>
		            <!-- stauts -->
		            <button class="btn btn-secondary" id="statusBtn"></button>
		            <div class="my-2"></div>
		            <b>작성자 </b>${ wEmp.empName }<br>
		            <b>결재자 </b>
		            <c:if test="${ mEmp.empName != null }">${ mEmp.empName }, </c:if>
		            ${ fEmp.empName }
		            <hr>
		            
		            <div style="width:100%; text-align: center; display: block;">
			            <div>
			                <div class="box" style="width:50%; float:left;">
			                    <h1>${ a.approvalFormName }</h1>
			                </div>
			                    
			                <div style="width:50%; float:right;">
								<table id="tb1" class="table table-bordered">
									<tr>
										<th rowspan="3" style="vertical-align:middle;">결재</th>
										<td>${ wEmp.jobName }</td>
										<td>${ mEmp.jobName }</td>
										<td>${ fEmp.jobName }</td>
									</tr>
									<tr>
										<!--<td></td>-->
										<td><!-- 작성자 서명 --><h1 class='m-0 font-weight-bold text-primary'>○</h1></td>
										<td id="signMEmp"><!-- 중간 결재자 서명 --></td>
										<td id="signFEmp"><!-- 최종 결재자 서명 --></td>
									</tr>
									<tr>
										<!--<td></td>-->
										<td>${ wEmp.empName }</td>
										<td>${ mEmp.empName }</td>
										<td>${ fEmp.empName }</td>
									</tr>
								</table>
							</div>
			            </div>
			            <div>
			                <table id="tb2" class="table table-bordered">
			                    <tr>
			                        <th>문서번호</th>
			                        <td>${ a.approvalNo }</td>
			                        <th>처리기한</th>
			                        <td>${ a.dueDate }</td>
			                    </tr>
			                    <tr>
			                        <th>보존년한</th>
			                        <td>${ a.preservedYears }년</td>
			                        <th>기안일자</th>
			                        <td>${ a.writtenDate }</td>
			                    </tr>
			                    <tr>
			                        <th>기안부서</th>
			                        <td>${ wEmp.deptName }</td>
			                        <th>기 안 자</th>
			                        <td>${ wEmp.empName }</td>
			                    </tr>
			                    <tr>
			                        <th>제   목</th>
			                        <td colspan="3"><b>${ a.approvalTitle }</b></td>
			                    </tr>
			                    <tr>
			                        <td colspan="4" style="height:500px; vertical-align:middle;">${ a.approvalContent }</td>
			                    </tr>
			                </table>
			            </div>
			        </div>
		            <br><br>
		
		            <table id="replyArea" class="table" align="center">
		                <thead>
		                	<c:if test="${ loginUser.empNO == a.approvalMNo || (a.status == 2 && loginUser.empNO == a.approvalFNo) }">
		                    	<tr>
			                        <th colspan="4">
			                            <textarea class="form-control" id="replyContent" rows="2" style="resize:none; width:100%"></textarea>
			                        </th>
		                        </tr>
		                        <tr>
		                        	<td colspan="4">
			                        	<div class="btns" align="center">
						                    <button class="btn btn-primary" id="approveReply">승인</button>
						                    <button class="btn btn-danger" id="rejectReply">반려</button>
						                </div>
						                <div class="my-2"></div>
		              				</td>
		                        </tr>
		                    </c:if>
		                    <tr>
		                       <td colspan="4"><h5 class="m-0 font-weight-bold text-primary">결재의견</h5></td> 
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
			selectReplyList();
			
			$("#approveReply").click(function(){
	    		var ano = ${a.approvalNo};
	    		var mno = ${mEmp.empNO};
	    		var fno = ${fEmp.empNO};
	
				if($("#replyContent").val().trim().length != 0){
					
					$.ajax({
						url:"rinsert.ep",
						type:"post",
						data:{replyContent:$("#replyContent").val(),
							  refApprovalNo:ano,
							  replyWriterNo:"${loginUser.empNO}",
							  status:"Y",
							  mno:mno,
							  fno:fno},
						success:function(result){
							if(result > 0){
								$("#replyContent").val("");
								selectReplyList();
								
							}else{
								alert("결재의견 등록 실패");
							}
						},error:function(){
							console.log("결재의견 작성 ajax 통신 실패");
						}
					});
					
				}else{
					alert("결재의견을 작성하세요.");
				}
				
			});
		});
	 	
	 	$(function(){
			selectReplyList();
			
			$("#rejectReply").click(function(){
	    		var ano = ${a.approvalNo};
	    		var mno = ${mEmp.empNO};
	    		var fno = ${fEmp.empNO};
	
				if($("#replyContent").val().trim().length != 0){
					
					$.ajax({
						url:"rinsert.ep",
						type:"post",
						data:{replyContent:$("#replyContent").val(),
							  refApprovalNo:ano,
							  replyWriterNo:"${loginUser.empNO}",
							  status:"N",
							  mno:mno,
							  fno:fno},
						success:function(result){
							if(result > 0){
								$("#replyContent").val("");
								selectReplyList();
								
							}else{
								alert("결재의견 등록 실패");
							}
						},error:function(){
							console.log("결재의견 작성 ajax 통신 실패");
						}
					});
					
				}else{
					alert("결재의견을 작성하세요.");
				}
				
			});
		});
		
		function selectReplyList(){
			var ano = ${a.approvalNo};
			var status = ${a.status};
			var mno = ${mEmp.empNO};
			var fno = ${fEmp.empNO};
			var signMEmp = 0;
			var signFEmp = 0;
			
			$.ajax({
				url:"rlist.ep",
				data:{ano:ano},
				type:"get",
				success:function(list){
					
					var value="";
					$.each(list, function(i, obj){
						
						if("${loginUser.empNO}" == obj.replyWriterNo){
							value += "<tr style='background:#EAFAF1'>";
						}else{
							value += "<tr>";
						}
						
						if(obj.status == 'Y'){
							value += "<th>" + obj.replyWriterName + "</th>" + 
											 "<td><button class='btn btn-primary'>승인</button></td>" + 
											 "<td>" + obj.replyContent + "</td>" + 
											 "<td>" + obj.createDate + "</td>" +
									 "</tr>";
						}else{
							value += "<th>" + obj.replyWriterName + "</th>" + 
											 "<td><button class='btn btn-danger'>반려</button></td>" + 
											 "<td>" + obj.replyContent + "</td>" + 
											 "<td>" + obj.createDate + "</td>" +
									 "</tr>";
						}
						
						// 서명
						if (obj.replyWriterNo == mno) {
							signMEmp = 1;
						}
						if (obj.replyWriterNo == fno) {
							signFEmp = 1;
						}
						
					});
					$("#replyArea tbody").html(value);
					
					// 서명
					if (signMEmp == 1) {
						$("#signMEmp").html("<h1 class='m-0 font-weight-bold text-primary'>○</h1>");
					}
					if (signFEmp == 1) {
						$("#signFEmp").html("<h1 class='m-0 font-weight-bold text-primary'>○</h1>");
					}
					
					// 상태
					if (status == 1) {
						$("#statusBtn").text("미결");
					} else if (status == 2) {
						$("#statusBtn").text("진행중");
						$("#statusBtn").attr('class','btn btn-warning');
					} else if (status == 3) {
						$("#statusBtn").text("완료");
						$("#statusBtn").attr('class','btn btn-success');
					} else if (status == 4) {
						$("#statusBtn").text("반려");
						$("#statusBtn").attr('class','btn btn-danger');
					}
					
				},error:function(){
					console.log("결재의견 리스트조회용 ajax 통신 실패");
				}
			});
		}
    </script>

</body>
</html>