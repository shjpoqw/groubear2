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
.box{
		width:800px;
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
  		color: rgb(232,180,81);
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
<div class="box">
		<br>
		
		<h1>직원 조회</h1>
		<br>
		
		
<DIV class='aside_menu'>
  <FORM name='frm' method='GET' action='./list.bo'>
    <ASIDE align = 'center'>
      <SELECT name='type'> 
        <OPTION value='userId'>이름</OPTION>
        <OPTION value='BoardTitle'>제목</OPTION>
      </SELECT>
      <input type='text' name='search'>
      <button type='submit'>검색</button>    

    </ASIDE> 
  </FORM>
  <DIV class='menu_line' style='clear: both;'></DIV>
</DIV>
		
		<table class="board"  align="center">
			<thead>
				<tr>
					<th  width="7%">사원명</th>
					<th width="6%">부서</th>
					<th width="55%">직책</th>
					<th width="10%">입사 날짜</th>
					<th width="7%">주소</th>
				</tr>
			<thead>
	
			<tbody>
				
				<c:forEach items="${ list }" var="member">
	                    <tr>
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
                			<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage+1 }">Next</a></li>
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