<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jsh/tab.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />

	<div class="tab_messenger">
		<input type="radio" id="tab01" name="temMenu" checked> 
		 <input type="radio" id="tab02" name="temMenu">
		 <input type="radio" id="tab03" name="temMenu">
		<div class="btn">
			<label for="tab01">1</label><br> 
			<label for="tab02">2</label><br>
			<label for="tab03">3</label>
		</div>

		<!-- ================ 1. 회원 목록 =============== -->
		<div class="conbox con1">
			<div></div>
			<div>
				<label>${me.empName}</label><br> <label>${me.message}</label> <a
					type="button" class="" data-toggle="modal"
					data-target="#stateModal"
					onclick="stateUpdate('${me.empNO}', '${me.message}', ${me.stateMessageNo});">수정</a>
				<br>
				<hr>
				<br>

				<table>


					<tbody>
						<tr>
							<form>
								<input type="text" name="q1" value="${param.q}"
									placeholder="이름을 입력하세요" /> <input class="btn-search"
									type="submit" value="검색" />
							</form>
						</tr>
						<c:forEach var="e" items="${emp}">
							<c:if test="${e.empNO != sessionScope.loginUser.empNO}">
								<tr>
									<td>${e.empName}<br></td>
									<td>${e.message}</td>
								</tr>


							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div></div>
		</div>
		
		<!-- 상태 메시지 수정 모달  -->
		<div class="modal fade" id="stateModal">

			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">상태 메시지</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<form action="updateStateMessage.msg" method="post">
						<!-- Modal Body -->
						<div class="modal-body">
							<input type="text" id="stateUpdateMessege" name="message" /> <input
								type="hidden" id="stateUpdateNo" name="empNO" /> <input
								type="hidden" id="stateUpdateSMNO" name="stateMessageNo" />

						</div>

						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">변경</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>


		<!-- ================ 2. 대화목록 =============== -->
		<div class="conbox con2">
			<form>
				<input type="text" name="q2" value="${param.q}" placeholder="채팅방을 입력하세요" />
				<input class="btn-search" type="submit" value="검색" />
			</form>
			<hr>
			 <a type="button" class="" data-toggle="modal"
				data-target="#insertMsgModal"
				onclick="msgInsert('${me.empNO}');">수정</a>
		</div>
		
		
		
		
		<!-- 대화방 생성 모달 -->
		<div class="modal fade" id="insertMsgModal">

			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">대화방 생성</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<form action="insertMsg.msg" method="post">
						<!-- Modal Body -->
						<div class="modal-body">
							<input type="text" id="titleInsertMessege" name="title" /> 
							<input type="password" id="pwdInsertMessege" name="pwd" /> 
							<input type="hidden" id="msgInsertNo" name="empNO" /> 

						</div>

						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">생성</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		
		
		

		<!-- ================ 3. 대화방 리스트 =============== -->
		<div class="conbox con3">
			<form>
				<input type="text" name="q3" value="${param.q}" placeholder="채팅방을 입력하세요" />
				<input class="btn-search" type="submit" value="검색" />
			</form>
			<hr>
			<table>
				<tbody>
					<c:forEach var="m" items="${msgList}">
					<tr>
						<th>${m.title}</th>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


		
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/jsh/messenger/messenger.js"></script>
</body>
</html>