<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상신 문서함</title>
</head>
<body>

	<jsp:include page="../../common/menubar.jsp"/>
	
	<div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>상신 문서함</h2>
            <br>
            <h3 style="display:inline">${ a.approvalFormName }</h3>
            <!-- stauts -->
            <c:choose>
            	<c:when test="${ a.status == 1 }">
            		<button class="btn btn-secondary">미결</button>
            	</c:when>
            	<c:when test="${ a.status == 2 }">
            		<button class="btn btn-secondary">진행중</button>
            	</c:when>
            	<c:when test="${ a.status == 3 }">
            		<button class="btn btn-secondary">완료</button>
            	</c:when>
            	<c:when test="${ a.status == 4 }">
            		<button class="btn btn-secondary">반려</button>
            	</c:when>
            </c:choose>
            <br>
            <b>작성자 </b>${ wEmp.empName }<br>
            <b>결재자 </b>
            <c:if test="${ mEmp.empName != null }">${ mEmp.empName }, </c:if>
            ${ fEmp.empName }
            <hr>
            
            <div style="width:100%; text-align: center; display: block;">
	            <div>
	                <div style="width:50%; float:left;">
	                    <h1>${ a.approvalFormName }</h1>
	                </div>
	                    
	                <div style="width:50%; float:right;">
	                    <table id="tb1">
	                        <tr>
	                            <th rowspan="3">결재</th>
	                            <td>${ wEmp.jobName }</td>
	                            <td>${ mEmp.jobName }</td>
	                            <td>${ fEmp.jobName }</td>
	                        </tr>
	                        <tr>
	                            <!--<td></td>-->
	                            <td>작성자 서명</td>
	                            <td>중간 결재자 서명</td>
	                            <td>최종 결재자 서명</td>
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
	            <div> <!-- 가운데 정렬 안 되는 거 해결하기 -->
	                <table id="tb2">
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
	                        <td>${ a.approvalTitle }</td>
	                    </tr>
	                    <tr>
	                        <td>${ a.approvalContent }</td>
	                    </tr>
	                </table>
	            </div>
	        </div>
            <br><br>

            <table id="replyArea" class="table" align="center">
                <thead>
                	<c:if test="${ loginUser.empNO == a.approvalMNo || loginUser.empNO == a.approvalFNo }">
                    	<tr>
	                        <th colspan="2" style="width:75%">
	                            <textarea class="form-control" id="replyContent" rows="2" style="resize:none; width:100%"></textarea>
	                        </th>
                        </tr>
                        <tr>
                        	<td>
	                        	<div class="btns" align="center">
				                    <button class="btn btn-secondary" id="approveReply">승인</button>
				                    <button class="btn btn-danger" id="rejectReply">반려</button>
				                </div>
              				</td>
                        </tr>
                    </c:if>
                    <tr>
                       <td colspan="3">결재의견 (<span id="rcount">0</span>) </td> 
                    </tr>
                </thead>
                <tbody>
                
                </tbody>
            </table>
        </div>
        <br><br>
    </div>
    
     <script>
	 	$(function(){
			selectReplyList();
			
			$("#approveReply").click(function(){
	    		var ano = ${a.approvalNo};
	
				if($("#replyContent").val().trim().length != 0){
					
					$.ajax({
						url:"rinsert.ep",
						type:"post",
						data:{replyContent:$("#replyContent").val(),
							  refApprovalNo:ano,
							  replyWriterNo:"${loginUser.empNO}",
							  status:"Y"},
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
	
				if($("#replyContent").val().trim().length != 0){
					
					$.ajax({
						url:"rinsert.ep",
						type:"post",
						data:{replyContent:$("#replyContent").val(),
							  refApprovalNo:ano,
							  replyWriterNo:"${loginUser.empNO}",
							  status:"N"},
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
			$.ajax({
				url:"rlist.ep",
				data:{ano:ano},
				type:"get",
				success:function(list){
					$("#rcount").text(list.length);
					
					var value="";
					$.each(list, function(i, obj){
						
						if("${loginUser.empNO}" == obj.replyWriterNo){
							value += "<tr style='background:#EAFAF1'>";
						}else{
							value += "<tr>";
						}
						
						if(obj.status == 'Y'){
							value += "<th>" + obj.replyWriterName + "</th>" + 
											 "<td><button class='btn btn-secondary'>승인</button></td>" + 
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
						
					});
					$("#replyArea tbody").html(value);
				},error:function(){
					console.log("결재의견 리스트조회용 ajax 통신 실패");
				}
			});
		}
    </script>

    <jsp:include page="../../common/footer.jsp"/>

</body>
</html>