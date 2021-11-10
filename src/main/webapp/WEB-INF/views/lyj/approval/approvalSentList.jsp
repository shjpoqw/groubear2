<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상신 문서함</title>
<style>
	#sentListTb{text-align: center;}
    #sentListTb>tbody>tr:hover{cursor:pointer;}

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
<body id="page-top">
	
	<div id="wrapper">
		
		<jsp:include page="../../common/menubarSide.jsp"/>
		
		<div id="content-wrapper" class="d-flex flex-column">
		
			<jsp:include page="../../common/menubarTop.jsp"/>
	
			<div class="content">
		        <div class="container-fluid">
		        	<h1 class="h3 mb-0 text-gray-800">상신 문서함</h1>
		            <br>
		            <table id="sentListTb" class="table table-hover" align="center">
		                <thead>
		                  <tr>
		                  	<th>No</th>
		                    <th>분류</th>
		                    <th>제목</th>
		                    <th>기안일</th>
		                    <th>마감일</th>
		                    <th>상태</th>
		                  </tr>
		                </thead>
		                <tbody>
		                	<c:forEach items="${ sentList }" var="sl">
			                    <tr>
			                        <td>${ sl.approvalNo }</td>
			                        <td>${ sl.approvalFormName }</td>
			                        <td>${ sl.approvalTitle }</td>
			                        <td>${ sl.writtenDate }</td>
			                        <td>${ sl.dueDate }</td>
			                        <td>
			                        	<c:choose>
			                        		<c:when test="${ sl.status == 1 }"><button class="btn btn-secondary">미결</button></c:when>
			                        	</c:choose>
			                        	<c:choose>
			                        		<c:when test="${ sl.status == 2 }"><button class="btn btn-warning">진행중</button></c:when>
			                        	</c:choose>
			                        	<c:choose>
			                        		<c:when test="${ sl.status == 3 }"><button class="btn btn-success">완료</button></c:when>
			                        	</c:choose>
			                        	<c:choose>
			                        		<c:when test="${ sl.status == 4 }"><button class="btn btn-danger">반려</button></c:when>
			                        	</c:choose>
			                        </td>
			                    </tr>
		                    </c:forEach>
		                </tbody>
		            </table>
		            <br>
		            
		            <c:if test="${ loginUser.empNO eq sl.writerNo }">
			            <form id="postForm" action="" method="post">
							<input type="hidden" name="eno" value="${ sl.writerNo }">
						</form>
		            </c:if>
		            <br><br>
		
		            <div id="pagingArea">
		                <ul class="pagination">
		                	<c:choose>
		                		<c:when test="${ pi.currentPage ne 1 }">
		                			<li class="page-item"><a class="page-link" href="sentList.ep?currentPage=${ pi.currentPage-1 }">Previous</a></li>
		                		</c:when>
		                		<c:otherwise>
		                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
		                		</c:otherwise>
		                	</c:choose>
		                	
		                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
		                    	<c:choose>
			                		<c:when test="${ pi.currentPage ne p }">
		                    			<li class="page-item"><a class="page-link" href="sentList.ep?currentPage=${ p }">${ p }</a></li>
			                		</c:when>
			                		<c:otherwise>
			                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
			                		</c:otherwise>
			                	</c:choose>
		                    </c:forEach>
		                    
		                    
		                    <c:choose>
		                		<c:when test="${ pi.currentPage ne pi.maxPage }">
		                			<li class="page-item"><a class="page-link" href="sentList.ep?currentPage=${ pi.currentPage+1 }">Next</a></li>
		                		</c:when>
		                		<c:otherwise>
		                			<li class="page-item disabled"><a class="page-link" href="sentList.ep?currentPage=${ pi.currentPage+1 }">Next</a></li>
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
		
		</div>
	</div>
    
    <script>
    	$(function(){
    		$("#sentListTb tbody tr").click(function(){
    			location.href="sentDetail.ep?ano=" + $(this).children().eq(0).text();
    		});
    	});
    </script>
	
</body>
</html>