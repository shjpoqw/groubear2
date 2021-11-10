<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jsh/contact.css" />
<script src="/resources/js/jsh/contact/header.js"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />


	<!-- ===================================================== -->


	<div class="container bootstrap snippets bootdey">

		<div class="right">
			<form method="post">
				<select class="form-control selectpicker noborder " name="d"
					style="width: 100px; display: inline-block;">
					<option value="">전체</option>
					<c:forEach var="d" items="${dept}">
						<option value="${d.deptCode}">${d.deptName}</option>
					</c:forEach>
				</select> <input type="text" class="form-control" name="q" value="${param.q}"
					style="width: 250px; display: inline-block;"
					" placeholder="이름을 입력하세요 " /> <input class="btn btn-dark"
					type="submit" value="검색" />
			</form>
		</div>
		<div class="row" align="right">
			<div class="col-lg-12">
				<div class="main-box no-header clearfix">
					<div class="main-box-body clearfix">
						<div class="table-responsive">
							<table class="table user-list">
								<thead>
									<tr>
										<th><span>이름</span></th>
										<th><span>휴대폰</span></th>
										<th class="text-center"><span>이메일</span></th>
										<th><span>부서</span></th>
										<th>직급</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="m" items="${list}">
										<tr>
											<td><span class="label label-default" class="user-link">${m.empName}</span>
											</td>
											<td>${m.phone}</td>
											<td class="text-center"><span
												class="label label-default">${m.email}</span></td>
											<td><span class="label label-default">${m.deptName}</span>
											</td>
											<td><span class="label label-default">${m.jobName}</span>
											</td>

										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:set var="page" value="${(empty param.p)?1:param.p}" />
		<c:set var="startNum" value="${page-(page-1)%5}" />
		<c:set var="lastNum"
			value="${fn:substringBefore(Math.ceil(count/10),'.') }" />

		<nav aria-label="Page navigation example" class="d-flex justify-content-center">
			<ul class="pagination">
				<c:if test="${startNum>1}">
					<li class="page-item"><a class="page-link"  href="?p${startNum-1}&t=&q=">&lt;</a></li>
				</c:if>
				<c:if test="${startNum<=1}">
					<li class="page-item"><a class="page-link"  onclick="alert('이전 페이지가 없습니다.');">&lt;</a></li>
				</c:if>

				<c:forEach var="i" begin="0" end="4">
					<c:if test="${(startNum+i) <= lastNum }">
						<li class="page-item"><a class="page-link"
							href="?p=${startNum+i}&f=${param.f}&q=${param.q}">${startNum+i}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${startNum+4<lastNum}">
					<li class="page-item"><a class="page-link" href="?p=${startNum+5}&t=&q=">&gt;</a></li>
				</c:if>
				<c:if test="${startNum+4>=lastNum}">
					<li class="page-item"><a class="page-link"  onclick="alert('다음 페이지가 없습니다.');">&gt;</a></li>
				</c:if>
			</ul>
		</nav>
	</div>

















	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>