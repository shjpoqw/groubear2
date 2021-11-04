<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#snsList{text-align: center;}
    #snsList>tbody>tr:hover{cursor:pointer;}

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
            <h2>게시판</h2>
            <br>
            <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
            <c:if test="${ !empty loginUser }">
            	<a class="btn btn-secondary" style="float:right" href="enrollForm.sns">글쓰기</a>
            </c:if>
            <br>
            <table id="snsList" class="table table-hover" align="center">
                <thead>
                  <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>좋아요</th>
                    <th>작성일</th>
                    <th>내용</th>
                    <th>추천수</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach items="${ list }" var="s">
	                    <tr>
	                        <td>${ s.snsNo }</td>
	                        <td>${ s.snsTitle }</td>
	                        <td>${ sessionScope.loginUser.empName }</td>
	                        <td>${ s.LCount }</td>
	                        <td>${ s.snsDate }</td>
	                        <td>${ s.snsContent }</td>
	                       
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>

           

            <br clear="both"><br>
            
			
            <br><br>
        </div>
        <br><br>
    </div>
    
    <script>
    	$(function(){
    		$("#snsList tbody tr").click(function(){
    			location.href="detail.sns?sno=" + $(this).children().eq(0).text();
    		});
    	});
    </script>
    
    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>