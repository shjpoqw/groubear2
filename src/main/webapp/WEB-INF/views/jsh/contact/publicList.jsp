<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/jsh/contact/header.js"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	<div class="content">
		<div class="search">
			<form>
				<select name="d"> 
					<option value="">전체</option>
					<c:forEach var="d" items="${dept}" >
						<option value="${d.deptCode}">${d.deptName}</option>
					</c:forEach>
				</select> 
				
				 <input type="text" name="q" value="${param.q}" /> <input
					class="btn-search" type="submit" value="검색" />
			</form>
		</div>
		<div class="innerOuter" style="padding: 5% 10%;">
			<table>
				<thead>
					<tr>
						<th>이름</th>
						<th>휴대폰</th>
						<th>이메일</th>
						<th>부서</th>
						<th>직급</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="m" items="${list}">
						<tr>
							<td>${m.empName}</td>
							<td>${m.phone}</td>
							<td>${m.email}</td>
							<td>${m.deptName}</td>
							<td>${m.jobName}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<c:set var="page" value="${(empty param.p)?1:param.p}" />
		<c:set var="startNum" value="${page-(page-1)%5}" />
		<c:set var="lastNum"
			value="${fn:substringBefore(Math.ceil(count/10),'.') }" />

		<div>
			<c:if test="${startNum>1}">
				<a href="?p${startNum-1}&t=&q=">&lt;</a>
			</c:if>
			<c:if test="${startNum<=1}">
				<a onclick="alert('이전 페이지가 없습니다.');">&lt;</a>
			</c:if>

			<c:forEach var="i" begin="0" end="4">
				<c:if test="${(startNum+i) <= lastNum }">
					<a class="num ${(page==(startNum+i))?'orange':'' } "
						href="?p=${startNum+i}&f=${param.f}&q=${param.q}">${startNum+i}</a>
				</c:if>
			</c:forEach>

			<c:if test="${startNum+4<lastNum}">
				<a href="?p=${startNum+5}&t=&q=">&gt;</a>
			</c:if>
			<c:if test="${startNum+4>=lastNum}">
				<a onclick="alert('다음 페이지가 없습니다.');">&gt;</a>
			</c:if>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>