<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 주소록 수정 -->
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">연락처 추가</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
		
				<form action="updateContact.ct" method="post">
					<!-- Modal Body -->
					<div class="modal-body">
						<table>
							<tbody>
								<tr>
									<td>이름</td>
									<td><input type="text"  name="name" value="${c.name}" /></td>
								</tr>
								<tr>
									<td>연락처</td>
									<td><input type="tel" name="phone" value="${c.phone}" /></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="text"  name="email" value="${c.email}" /></td>
								</tr>
								<tr>
									<td>회사</td>
									<td><input type="text" name="companyName" value="${c.companyName}" /></td>
								</tr>
								<tr>
									<td>회사번호</td>
									<td><input type="tel"  name="companyPhone" value="${c.companyPhone}" /></td>
								</tr>
								<tr>
									<td>메모</td>
									<td><textarea name="memo" >${c.memo}</textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
					<input type="hidden" value="${loginUser.empNO}" id="empNo" name="empNO"/>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">등록</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</form>
	
	
</body>
</html>