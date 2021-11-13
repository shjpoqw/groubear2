<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 작성</title>
<style>
	#formListTb{text-align: center;}
    #formListTb>tbody>tr:hover{cursor:pointer;}

    #pagingArea{width:fit-content;margin:auto;}
    /* #pagingArea a{color:black} */
   
    #searchForm{
        width:80%;
        margin:auto;
    }
    #searchForm>*{
        afoat:left;
        margin:5px;
    }
    .select{width:20%;}
    .text{width:53%;}
    .searchBtn{Width:20%;}
    
    .modal-backdrop {
	  display: none;
	}
}
</style>
</head>
<body>

	<jsp:include page="../../common/menubar.jsp"/>

	<div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
        	<h2>문서 작성</h2>
            <br>
            
            <form id="insertForm" action="insert.ep" method="post">
	            <h3>기본 설정</h3><br>
            	<table id="formBasic" align="center">
            		<tr>
            			<th><label for="approvalFormName">문서분류</label></th>
                        <td>${ af.approvalFormName }</td>
            		</tr>
            		<tr>
            			<th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="approvalTitle" required></td>
            		</tr>
            	</table>
            	
            	<h3 style="display:inline">결재선 지정</h3>
            	<a class="ls-modal btn btn-outline-primary" data-toggle="modal" 
            		href="modalView.ep" data-target="#modal">조직도 검색</a>
            	<br>
            	
            	<table id="formLine" align="center">
            		<thead>
	                  <tr>
	                    <th>구분</th>
	                    <th>중간 결재자</th>
	                    <th>최종 결재자 *</th>
	                  </tr>
	                </thead>
	                <tbody>
	                	<tr>
	                		<th>이름</th>
	                		<td><input type="text" id="mName" class="form-control" name="approvalMName" readonly></td>
	                		<td><input type="text" id="fName" class="form-control" name="approvalFName" readonly required></td>
	                	</tr>
	                	<tr>
	                		<th>부서</th>
	                		<td><input type="text" id="mDept" class="form-control" name="approvalMDept" readonly></td>
	                		<td><input type="text" id="fDept" class="form-control" name="approvalFDept" readonly required></td>
	                	</tr>
	                	<tr>
	                		<th>직급</th>
	                		<td><input type="text" id="mJob" class="form-control" name="approvalMJob" readonly></td>
	                		<td><input type="text" id="fJob" class="form-control" name="approvalFJob" readonly required></td>
	                	</tr>
	                </tbody>
            	</table>            	
            	
            	<h3>상세 입력</h3><br>
            	<table id="formBasic" align="center">
            		<tr>
            			<th><label for="writerName">이름</label></th>
                        <td>${ loginUser.empName }</td>
            		</tr>
            		<tr>
            			<th><label for="deptCode">소속</label></th>
                        <td>${ loginUser.deptCode }</td>
            		</tr>
            		<!-- 
            		<tr>
            			<th><label for="writtenDate">기안일</label></th>
            			<td><input type="date" name="writtenDate" id="writtenDate"></td>
            		</tr>
            		 -->
            		<tr>
            			<th><label for="dueDate">마감일</label></th>
            			<td><input type="date" name="dueDate" id="dueDate"></td>
            		</tr>
            		<tr>
            			<th><label for="preservedYears">보존년한</label></th>
            			<td><input type="text" name="preservedYears" id="preservedYears">년</td>
            		</tr>
            		<tr>
            			<th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" name="approvalContent" cols="30" rows="5" placeholder="${ af.approvalFormContent }" required></textarea></td></tr>
            	</table>
            	
            	<!-- hidden -->
            	<input type="hidden" id="afNo" class="form-control" name="approvalFormNo" value="${ af.approvalFormNo }">
            	<input type="hidden" id="mNo" class="form-control" name="approvalMNo">
            	<input type="hidden" id="fNo" class="form-control" name="approvalFNo">
            	<input type="hidden" id="wNo" class="form-control" name="writerNo" value="${ loginUser.empNO }">
            	<input type="hidden" id="tempSave" class="form-control" name="tempSave" value="N">
            	
            	<div class="btns" align="center">
                    <button type="submit" id="writeBtn" class="btn btn-primary">제출하기</button>
                    <button type="button" class="btn btn-danger" onclick="changeTempSave();">임시저장</button>
                </div>
                
				<!-- Modal Start -->
				<div class="modal fade" id="modal" >
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
						
				            <!-- header title -->
								<h4 class="modal-title">조직도 검색</h4>
				             <!-- 닫기(x) 버튼 -->
									<button type="button" class="close" data-dismiss="modal">×</button>
							
							</div>
										
							<!-- body -->
							<div class="modal-body"><!--여기에 외부에서 작성한 테이블 들어옴--></div>
										
							<!-- Footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
            	
            </form>
            <br><br>
        </div>
        <br><br>
    </div>
    
    <!-- 
    <script>
	$(document).ready(function(){
	    $("#myBtn").click(function(){
	        $("#myModal").modal();
	    });
	});
	
	function func(){
		var empName = document.getElementById("empName").value;
		
		$("#mName").val(empName);
		$("#myModal").hide();
	}
	</script>
	 -->
		
	<script type="text/javascript">
		$('.ls-modal').on('click', function(e){
			e.preventDefault();
			$('#modal').modal('show').find('.modal-body').load($(this).attr('href'));
		});
		
		function changeTempSave() {
			$("#tempSave").val("Y");
			
			//$("#insertForm").attr("action", "insert.ep");
			
			$("#insertForm").submit();
		}
	</script>
    
    <jsp:include page="../../common/footer.jsp"/>

</body>
</html>