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
            <h2>마이페이지</h2>
            <br>

            <form action="update.me" method="post" onsubmit="" enctype="multipart/form-data">
                <div class="form-group">
                	<c:if test="${!empty sessionScope.profile.originName}">
                		<div id="img_box">
	                		<img id="show_profile" height="240px" 
	                		src="${ pageContext.servletContext.contextPath }/resources/profile_files/${sessionScope.profile.changeName}"/>
                		</div>
                		<div>
                			<label for="profile" style="align-content:center;" >프로필 사진</label>
                			<input id="profile" type="file" name="profile" class="form-control"
                			  accept=".jpg,.jpeg,.png,.gif">
                		</div>
                	</c:if>
                	
                	<c:if test="${empty sessionScope.profile.originName}">
	                	<div id="img_box">
		                	<img id="show_profile" height="240px" 
		                	src="${pageContext.request.contextPath}/resources/images/common/member.png"/>
	                	</div>
	                	<div>
	                		<label for="profile" style="align-content:center;" >프로필 사진</label>
	                		<input id="profile" type="file" name="profile" class="form-control" accept=".jpg,.jpeg,.png,.gif">
	                	</div>
                	</c:if>
                	
                    <input type="hidden" name="empNO" value="${loginUser.empNO}">
                    
                    <label> 아이디 :</label>
                    <input type="text" class="form-control" name="empId" value="${ loginUser.empId }" readonly><br>
                    
                    <label for="empName"> 이름 :</label>
                    <input type="text" class="form-control" id="empName" name="empName" value="${ loginUser.empName }" readonly><br>
                     
                    <label for="deptCode"> 부서 :</label>
                    <input type="text" class="form-control" id="deptCode" name="deptCode" value="${ loginUser.deptCode }" readonly><br>
                    
                    <label for="jobCode"> 직책 :</label>
                    <input type="text" class="form-control" id="jobCode" name="jobCode" value="${ loginUser.jobCode }" readonly><br>
                    
                    <label for="hireDate"> 입사일 :</label>
                    <input type="text" class="form-control" id="hireDate" name="hireDate" value="${ loginUser.hireDate }" readonly><br>
                    
                    <label for="salary"> 급여 :</label>
                    <input type="text" class="form-control" id="salary" name="salary" value="${ loginUser.salary }" readonly><br>
                    
                    <label for="email"> &nbsp; 이메일 :</label>
                    <input type="email" class="form-control" id="email" name="email" value="${ loginUser.email }"><br>
              
                    <label for="phone"> &nbsp; 전화번호 :</label>
                    <input type="tel" class="form-control" id="phone" name="phone" value="${ loginUser.phone }"><br>
                    <label for="address"> &nbsp; 주소 :</label><br>
                    

	
	

				<c:forTokens var="addr" items="${ loginUser.address }" delims="/" varStatus="status">
					<c:if test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
						<c:set var="post" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
						<c:set var="address1" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 1 }">
						<c:set var="address1" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 2 }">
						<c:set var="address2" value="${ addr }"/>
					</c:if>
				</c:forTokens>
					<div class="form-inline">
					<label> &nbsp; 우편번호 : &nbsp;</label>
					<input type="text"  name="post" class="form-control mr-2 postcodify_postcode5" value="${ post }" size="6">
					<button type="button" class="btn btn-primary" id="postcodify_search_button">검색</button>
					</div>
					<br>
					<label> &nbsp; 도로명주소 : </label>
					<input type="text" name="address1" class="form-control postcodify_address" value="${ address1 }" size="30">
					<br>
				    <label> &nbsp; 상세주소 : </label>
					<input type="text" name="address2" class="form-control postcodify_extra_info" value="${ address2 }" size="30">
				
				
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
                    <%-- <a href="delete.me?userId=${ loginUser.userId }" class="btn btn-danger">탈퇴하기</a> --%>
                    <button type="button" onclick="$('#postForm').submit();" class="btn btn-danger">탈퇴하기</button>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">비밀번호 변경</button>
                </div>
                
                <!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">회원 비밀번호 변경</h4>
				      </div>
				      <div class="modal-body">
						새 비밀번호 : <input type="text" name="newPwd" id="newPwd"><br/><br/>
            			새 비밀번호 확인 : <input type="text" name="newPwdAgain" id="newPwdAgain">
				      </div>
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-default" onclick="location.href='updatePwd.me'">변경하기</button>
				        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
				
            </form>
        </div>
        <br><br>
    </div>
    
    <form action="delete.me" method="post" id="postForm">
    	<input type="hidden" name="empId" value="${sessionScope.loginUser.empId}">
    </form>
    
    <script>
    
    function loadProfile() {
    	var $file = $("#profile")[0].files[0];
    	var maxSize = 1024*1024*5;	
    	if($file.size>maxSize){
    		Swal.fire({
    			icon: 'error',
    			title : "프로필 크기 오류",
    			text : '프로필 사진은 5MB를 넘을 수 없습니다.'
    		})
    		$("#profile").val("");
    		$("#show_profile").removeAttr("src");
    		return false;
    	}
    	var $file = $("#profile")[0].files[0];
    	var reader = new FileReader();
    	
    	reader.onload = function () {
			$("#show_profile").attr("src", reader.result);
		}
    	reader.readAsDataURL($file);
    }
    
	$(document).ready(function () {
		$("#profile").on("change", loadProfile);
	})		
    
	$(document).ready(function(){
	    $("#myBtn").click(function(){
	        $("#myModal").modal();
	    });
	});
	</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>