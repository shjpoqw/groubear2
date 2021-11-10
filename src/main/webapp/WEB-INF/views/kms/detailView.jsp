<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	#btn{
		text-align:center;
	}
	#img_box{
		margin:0 auto;
		height: 250px;
		width: 250px;
		border-radius: 70%;
		text-align: center;
		overflow: hidden;
	}
	#show_profile{
	width: 100%;
	height: 100%;
	object-fit:cover;
	}
	

	</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
 <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>사원 수정</h2>
            <br>

            <form action="update.ad" method="post" onsubmit="">
                <div class="form-group">
                    
                    <label for="userName"> 이름 :</label>
                    <input type="text" class="form-control" id="empName" name="empName" value="${member.empName}" readonly><br>
                     
                    <label for="userName"> 부서 :</label>
	                <select name="deptCode" class="form-control"> 
							<c:forEach var="dept" items="${dept}" >
								<option value="${dept.deptCode}">${dept.deptName}</option>
							</c:forEach>
					</select> 
					<br>
					<label for="userName" > 직책 :</label>
					<select name="jobCode"  class="form-control"> 
						<c:forEach var="job" items="${job}" >
							<option value="${job.jobCode}">${job.jobName}</option>
						</c:forEach>
					</select> 
                    <br>
                    <label for="userName"> 입사일 :</label>
                    <input type="text" class="form-control" id="hireDate" name="hireDate" value="${ member.hireDate }" readonly><br>
                    
                    <label for="userName"> 급여 :</label>
                    <input type="number" class="form-control" id="salary" name="salary" value="${ member.salary }" ><br>
                    
                    <label for="email"> &nbsp; 이메일 :</label>
                    <input type="email" class="form-control" id="email" name="email" value="${ member.email }" readonly><br>
              
                    <label for="phone"> &nbsp; 전화번호 :</label>
                    <input type="tel" class="form-control" id="phone" name="phone" value="${ member.phone }" readonly><br>
                    
                    <label for="address"> &nbsp; 주소 :</label><br>
                    <input type="tel" class="form-control" id="phone" name="phone" value="${ member.address }" readonly><br>

					<input type="hidden" id="empNO" name="empNO" value="${member.empNO }"/>
	
	

                   
				<!-- jQuery와 Postcodify를 로딩한다. -->
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<script>
					// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
					$(function(){
						$("#postcodify_search_button").postcodifyPopUp();
					});
				</script>
				<br><br>
                    
                    
                </div>
                <br>
                
                <div class="btns" align="center">
					<button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" onclick="$('#postForm').submit();" class="btn btn-danger">삭제하기</button>
                
                </div>
                
                
				
            </form>
        </div>
        <br><br>
    </div>
    
    <form action="delete.ad" method="post" id="postForm">
    	<input type="hidden" name="empId" value="${ member.empId }">
    </form>
</body>
</html>