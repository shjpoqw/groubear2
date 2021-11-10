<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<style>
#pagingArea{width:fit-content;margin:auto;}
    /* #pagingArea a{color:black} */
a { color: #000; }
a:link { color: #000; }
a:visited { color: #000; }
a { text-decoration:none } 
.box{
		width:75%;
		height:500px;
		margin:auto;
		margin-top:50px;
		
	}
	.board{
		border:1px solid white;
		text-align:center;
		
	}
	
	
	.board>tbody>tr:hover{
		cursor:pointer;
		
	}
	
	td {
  		
  	}
	table {
    	width: 100%;
    	
  	}
  	td {
    	border-bottom: 1px solid #444444;
    	padding: 10px;
    	font-size:11px;
    	height:30px;
  	}
  	th{
  		background-color: rgb(53,61,64);
  		color: rgb(255,255,255);
  	}
  	h1{
  		color: rgb(23,62,96);
  	} 
  	button{
  		background-color: rgb(53,61,64);
  		color: rgb(255,255,255);
  	}	
  	</style>
<body>
<jsp:include page="../common/menubar.jsp"/>
<div class="box">

		<br>
		
		<h1>직원 조회</h1>
		<br>
		
		

  <div class="content">
		<div class="search">
			<form>
				<select name="searchDept"> 
					<option value="">부서명</option>
						<c:forEach var="dept" items="${dept}" >
							<option value="${dept.deptCode}">${dept.deptName}</option>
						</c:forEach>
				</select> 
				<select name="searchJob"> 
					<option value="">직책명</option>
						<c:forEach var="job" items="${job}" >
							<option value="${job.jobCode}">${job.jobName}</option>
						</c:forEach>
				</select> 
				
				 <input type="text" name="search" placeholder="사원의 이름을 입력하세요" /> 
				 <input class="btn-search" type="submit" value="검색" />
			</form>
		</div>
</div>


		
		<table class="board" id="boardList"  align="center">
			<thead>
				<tr>
					<th  width="7%">사번</th>
					<th  width="7%">사원명</th>
					<th width="6%">부서</th>
					<th width="7%">직책</th>
					<th width="10%">입사 날짜</th>
					<th width="48%">날짜</th>
				</tr>
			<thead>
	
			<tbody>
				
				<c:forEach items="${ list }" var="member">
	                    <tr>
	                     	<td>${ member.empNO }</td>
	                        <td>${ member.empName }</td>
	                        <td>${ member.deptName }</td>
	                        <td>${ member.jobName }</td>
	                        <td>${ member.hireDate }</td>
	                        <td>${ member.address }</td>
	                    </tr>
                </c:forEach>
			</tbody>
		</table>
		
		<br>

	</div>
	
<div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<a class="page-link" href="list.bo?currentPage=${ pi.currentPage-1 }">&lt;</a></li>
                		</c:when>
                		<c:otherwise>
                			<a class="page-link" href="">&lt;	</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<a class="page-link" href="list.bo?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<a class="page-link" href="list.bo?currentPage=${ pi.currentPage+1 }"> &gt;</a></li>
                		</c:when>
                		<c:otherwise>
                			<a class="page-link" href="list.bo?currentPage=${ pi.currentPage+1 }"> &gt;</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
           
     
		
	


 <script>
    	$(function(){
    		$("#boardList tbody tr").click(function(){
    			
    			
    			
    				location.href="detail.mem?empNo=" + $(this).children().eq(0).text();
    			
    			
    		});
    	});
    </script>
	
</body>
</html>