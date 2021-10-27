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
</style>
</head>
<body>

	<jsp:include page="../../common/menubar.jsp"/>

	<div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
        	<h2>문서 작성</h2>
            <br>
            
            <form id="writeForm" action="write.ep" method="post">
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
            	
            	<h3>결재선 지정</h3><br> <!-- 수정 필요 -->
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
	                		<td><input type="text" id="mName" class="form-control" name="approvalMName"></td>
	                		<td><input type="text" id="fName" class="form-control" name="approvalFName" required></td>
	                	</tr>
	                	<tr>
	                		<th>부서</th>
	                		<td><input type="text" id="mDept" class="form-control" name="approvalMDept"></td>
	                		<td><input type="text" id="fDept" class="form-control" name="approvalFDept" required></td>
	                	</tr>
	                	<tr>
	                		<th>직급</th>
	                		<td><input type="text" id="mJob" class="form-control" name="approvalMJob"></td>
	                		<td><input type="text" id="fJob" class="form-control" name="approvalF" required></td>
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
            		<tr>
            			<th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" name="approvalContent" cols="30" rows="5" placeholder="${ af.approvalFormContent }" required></textarea></td>
            		</tr>
            	</table>
            	
            	<div class="btns" align="center">
                    <button type="submit" id="writeBtn" class="btn btn-primary">제출하기</button>
                    <button type="button" class="btn btn-danger">임시저장</button>
                </div>
            	
            </form>
           
            <br clear="both"><br>
            
			
            <br><br>
        </div>
        <br><br>
    </div>
    
    <jsp:include page="../../common/footer.jsp"/>

</body>
</html>