<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#updateForm>table{width:100%;}
    #updateForm>table *{ margin:5px;}
</style>
</head>
<body>
    <jsp:include page="../../common/menubar.jsp"/>

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 수정하기</h2>
            <br>

            <form id="updateForm" method="post" action="update.sns" enctype="multipart/form-data">
            	<input type="hidden" name="snsNo" value="${ s.snsNo }">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="snsTitle" value="${ s.snsTitle }" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="${ loginUser.empName }" readonly></td>
                    </tr>
                    <tr>
                        <th><label for="uploadFile">첨부파일</label></th>
                        <td>
                            <input type="file" id="uploadFile" class="form-control-file border" name="reUploadFile">
                            <c:if test="${ !empty a.originFile }">
	                                                               현재 업로드된 파일 : ${ a.originFile } <br>
	                            <input type="hidden" name="changeFile" value="${ a.changeFile }">
	                            <input type="hidden" name="originFile" value="${ a.originFile }">
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="form-control" required name="snsContent" id="content" rows="10" style="resize:none;">${ s.snsContent }</textarea></th>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
                </div>
            </form>
        </div>
        <br><br>
    </div>

    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>