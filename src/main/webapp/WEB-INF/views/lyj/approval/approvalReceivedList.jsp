<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 작성</title>
<style>
	#receivedListTb{text-align: center;}
    #receivedListTb>tbody>tr:hover{cursor:pointer;}

    #pagingArea{width:fit-content;margin:auto;}
    /* #pagingArea a{color:black} */
   
    #searchForm{
        width:80%;
        margin:auto;
    }
    #searchForm>*{
        float:left;
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
        	<h2>결재 문서함</h2>
            <br>
            <table id="receivedListTb" class="table table-hover" align="center">
                <thead>
                  <tr>
                  	<th>No</th>
                    <th>분류</th>
                    <th>기안자</th>
                    <th>기안일</th>
                    <th>마감일</th>
                    <th>상태</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach items="${ receivedList }" var="rl">
	                    <tr>
	                        <td>${ rl.approvalNo }</td>
	                        <td>${ rl.writerName }</td>
	                        <td>${ rl.dueDate }</td>
	                        <td>${ rl.endDate }</td>
	                        <td>
	                        	<c:choose>
	                        		<c:when test="${ rl.status == 1 }">미결</c:when>
	                        	</c:choose>
	                        	<c:choose>
	                        		<c:when test="${ rl.status == 2 }">진행중</c:when>
	                        	</c:choose>
	                        	<c:choose>
	                        		<c:when test="${ rl.status == 3 }">완료</c:when>
	                        	</c:choose>
	                        	<c:choose>
	                        		<c:when test="${ rl.status == 4 }">반려</c:when>
	                        	</c:choose>
	                        </td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>

            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="receivedList.ep?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="receivedList.ep?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="receivedList.ep?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="receivedList.ep?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
           
            <br clear="both"><br>
            
			
            <br><br>
        </div>
        <br><br>
    </div>
    
    <jsp:include page="../../common/footer.jsp"/>
	
</body>
</html>