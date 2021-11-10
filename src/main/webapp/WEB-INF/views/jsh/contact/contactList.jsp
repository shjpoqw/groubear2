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
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div class="container bootstrap snippets bootdey">

		<div class="right">
			<form method="post">
				<input type="text" class="form-control" name="q" value="${param.q}"
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
										<th><span>상세정보</span></th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="con" items="${list}">
										<tr>
											<td><span class="label label-default" class="user-link">${con.name}</span>
											</td>
											<td>${con.phone}</td>
											<td class="text-center"><span
												class="label label-default">${con.email}</span></td>
											<td><a type="button" class="btn btn-primary"
								data-toggle="modal" data-target="#updateContact" href="#"
								onclick="selectContact('${con.contactNo}', 
				'${con.name}', '${con.phone}', '${con.email}', 
				'${con.companyName}', '${con.companyPhone}', '${con.memo}' );">조회</a></td>
							<td><a type="button" class="btn btn-primary"
								data-toggle="modal" data-target="#deleteContact" href="#"
								onclick="deleteContact('${con.contactNo}');">삭제</a></td>

										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<a class="float-right" data-toggle="modal" data-target="#insertContact"><button
				type="button" class="btn btn-primary ">연락처 추가</button></a>
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
	
	

	<!-- 연락처 추가 -->
	<div class="modal fade" id="insertContact">

		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">연락처 추가</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<form action="insertContact.me" method="post">
					<!-- Modal Body -->
					<div class="modal-body">
						<table>
							<tbody>
								<tr>
									<td>이름</td>
									<td><input type="text" name="name" /></td>
								</tr>
								<tr>
									<td>연락처</td>
									<td><input type="tel" name="phone" /></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="text" name="email" /></td>
								</tr>
								<tr>
									<td>회사</td>
									<td><input type="text" name="companyName" /></td>
								</tr>
								<tr>
									<td>회사번호</td>
									<td><input type="tel" 
										name="companyPhone" /></td>
								</tr>
								<tr>
									<td>메모</td>
									<td><textarea name="memo"></textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
					<input type="hidden" value="${loginUser.empNO}" 
						name="empNO" />
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">등록</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	

	<!-- 게시글 수정  -->
	<div class="modal fade" id="updateContact">

		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">연락처 조회</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<form action="updateContact.ct" method="post">
					<!-- Modal Body -->
					<div class="modal-body">
						<table>
							<tbody>
								<tr>
									<td>이름</td>
									<td><input type="text" name="name" id="name" /></td>
								</tr>
								<tr>
									<td>연락처</td>
									<td><input type="tel" name="phone" id="phone" /></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="text" name="email" id="email" /></td>
								</tr>
								<tr>
									<td>회사</td>
									<td><input type="text" name="companyName"
										id="companyName" /></td>
								</tr>
								<tr>
									<td>회사번호</td>
									<td><input type="tel" name="companyPhone"
										id="companyPhone" /></td>
								</tr>
								<tr>
									<td>메모</td>
									<td><textarea name="memo" id="memo">${c.memo}</textarea></td>
								</tr>
							</tbody>
						</table>
					<input type="hidden" id="contactNo" name="contactNo" />
					</div>
					<input type="hidden" value="${loginUser.empNO}" id="empNo"
						name="empNO" />
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">수정</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	
	
	<!-- 게시글 삭제  -->
	<div class="modal fade" id="deleteContact">

		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">연락처 추가</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<form action="deleteContact.ct" method="post">
					<!-- Modal Body -->
					<div class="modal-body">
						
					<input type="hidden" id="deleteNo"  name="deleteNo" />
					</div>
					
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">삭제</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	<script src="${pageContext.request.contextPath}/resources/js/jsh/contact/contact.js"></script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>