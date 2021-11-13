<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jsh/tab.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jsh/msg_emp.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jsh/chat.css" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />




	<!-- =============================== -->
	<div class="container bootstrap snippets bootdey">
		<div class="tile tile-alt" id="messages-main">
			<div class="ms-menu">
				<div class="ms-user clearfix">
					<c:if test="${!empty sessionScope.profile.originName }">
						<img class="img-avatar pull-left"
							src="${ pageContext.servletContext.contextPath }/resources/profile_files/${sessionScope.profile.changeName}" />
					</c:if>
					<c:if test="${empty sessionScope.profile.originName}">
						<img class="img-avatar"
							src="${pageContext.request.contextPath}/resources/images/common/member.png">
					</c:if>

					<div>
						${me.empName} <br> ${me.message}
					</div>
					<a type="button" class="" data-toggle="modal"
						data-target="#stateModal"
						onclick="stateUpdate('${me.empNO}', '${me.message}', ${me.stateMessageNo});">수정</a>
				</div>

				<div class="p-15">
					<form method="post">
						<input type="text" name="q1" value="${param.q}"
							placeholder="이름을 입력하세요" /> <input class="btn-search"
							type="submit" value="검색" />
					</form>
				</div>

				<!-- 회원 리스트 -->
				<div class="list-group lg-alt">
					<c:forEach var="e" items="${emp}">
						<c:if test="${e.empNO != sessionScope.loginUser.empNO}">
							<form method="post">
								<input type="hidden" name="toEmpNo" value="${e.empNO}">
								<button class="list-group-item media" type="submit">
									<div class="pull-left">
										<c:if test="${!empty e.originName }">
											<img class="img-avatar"
												src="${ pageContext.servletContext.contextPath }/resources/profile_files/${e.changeName}" />
										</c:if>
										<c:if test="${empty e.originName}">
											<img class="img-avatar"
												src="${pageContext.request.contextPath}/resources/images/common/member.png">
										</c:if>
									</div>
									<div class="media-body">
										<small class="list-group-item-heading">${e.empName}</small><br>
										<small class="list-group-item-text c-gray">${e.message}</small>
									</div>
								</button>
							</form>
						</c:if>
					</c:forEach>
				</div>
			</div>

			<!-- 상대방 클릭하기 전 -->
			<c:if test="${empty toEmp}">
				<div class="ms-body">
					<div class="action-header clearfix">
						<div class="visible-xs" id="ms-menu-trigger">
							<i class="fa fa-bars"></i>
						</div>
					</div>

					<div class="msb-reply">
						<textarea placeholder="메시지를 입력하세요" id="message" name="message"
							disabled></textarea>
						<input type="hidden" name="toEmpNo" id="toEmpNo">
						<button type="button" disabled>
							<i class="fa fa-paper-plane-o"></i>
						</button>
					</div>
				</div>
			</c:if>






			<!-- 상대방을 클릭할 경우 -->
			<c:if test="${!empty toEmp}">
				<div class="ms-body">
					<div class="action-header clearfix">


						<div class="pull-left hidden-xs">
							<c:if test="${!empty toEmp.originName }">
								<img class="img-avatar pull-left"
									src="${ pageContext.servletContext.contextPath }/resources/profile_files/${sessionScope.profile.changeName}" />
							</c:if>
							<c:if test="${empty toEmp.originName}">
								<img class="img-avatar"
									src="${pageContext.request.contextPath}/resources/images/common/member.png">
							</c:if>
							<div class="lv-avatar pull-left"></div>
							<span>${toEmp.empName}</span>
						</div>

						<ul class="ah-actions actions">

							<li class="dropdown"><a href="" data-toggle="dropdown"
								aria-expanded="true"> <i class="fa fa-bars"></i>
							</a>

								<ul class="dropdown-menu dropdown-menu-right">
									<li><a href="">대화내용 삭제</a></li>
								</ul></li>
						</ul>
					</div>



					<div class="message-feed media">
						<div class="pull-left">
							<img src="https://bootdey.com/img/Content/avatar/avatar1.png"
								alt="" class="img-avatar">
						</div>
						<div class="media-body">
							<div class="mf-content">Quisque consequat arcu eget odio

								pulvinar lobortis.</div>
							<small class="mf-date"><i class="fa fa-clock-o"></i>
								20/02/2015 at 09:00</small>
						</div>
					</div>

					<div class="message-feed right">
						<div class="pull-right">
							<img src="https://bootdey.com/img/Content/avatar/avatar2.png"
								alt="" class="img-avatar">
						</div>
						<div class="media-body">
							<div class="mf-content">Mauris volutpat magna nibh, et
								condimentum est rutrum a. Nunc sed turpis mi. In eu massa a sem
								pulvinar lobortis.</div>
							<small class="mf-date"><i class="fa fa-clock-o"></i>
								20/02/2015 at 09:30</small>
						</div>
					</div>


					<div class="msb-reply">
						<textarea placeholder="메시지를 입력하세요" id="message" name="message"></textarea>
						<input type="hidden" value="${toEmp.empNO}" name="toEmpNo"
							id="toEmpNo">
						<button type="button" onclick="submitFunction();">
							<i class="fa fa-paper-plane-o"></i>
						</button>
					</div>
				</div>
			</c:if>


		</div>
	</div>

	<!-- =============================== -->



	<script
		src="${pageContext.request.contextPath}/resources/js/jsh/messenger/messenger.js"></script>

	<script>
		
	</script>
</body>
</html>