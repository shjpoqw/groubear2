<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		        	<h1 class="h3 mb-0 text-gray-800">문서 작성</h1>
		            <br>
		            <h5 class="m-0 font-weight-bold text-primary">문서 양식</h5>
		            <br>
		            <table id="formListTb" class="table table-hover" align="center">
		                <thead>
		                  <tr>
		                    <th>분류</th>
		                    <th>제목</th>
		                    <th>&nbsp;</th>
		                  </tr>
		                </thead>
		                <tbody>
		                	<c:forEach items="${ formList }" var="fl">
			                    <tr>
			                        <td>${ fl.approvalCatName }</td>
			                        <td>${ fl.approvalFormName }</td>
			                        <td><button class="btn btn-primary" onclick="location.href='write.ep?ano=${ fl.approvalFormNo }';">작성하기</button></td>
			                    </tr>
		                    </c:forEach>
		                </tbody>
		            </table>
		            <br>
		
		            <div id="pagingArea">
		                <ul class="pagination">
		                	<c:choose>
		                		<c:when test="${ pi.currentPage ne 1 }">
		                			<li class="page-item"><a class="page-link" href="formList.ep?currentPage=${ pi.currentPage-1 }">Previous</a></li>
		                		</c:when>
		                		<c:otherwise>
		                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
		                		</c:otherwise>
		                	</c:choose>
		                	
		                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
		                    	<c:choose>
			                		<c:when test="${ pi.currentPage ne p }">
		                    			<li class="page-item"><a class="page-link" href="formList.ep?currentPage=${ p }">${ p }</a></li>
			                		</c:when>
			                		<c:otherwise>
			                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
			                		</c:otherwise>
			                	</c:choose>
		                    </c:forEach>
		                    
		                    
		                    <c:choose>
		                		<c:when test="${ pi.currentPage ne pi.maxPage }">
		                			<li class="page-item"><a class="page-link" href="formList.ep?currentPage=${ pi.currentPage+1 }">Next</a></li>
		                		</c:when>
		                		<c:otherwise>
		                			<li class="page-item disabled"><a class="page-link" href="formList.ep?currentPage=${ pi.currentPage+1 }">Next</a></li>
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
	
</body>
</html>