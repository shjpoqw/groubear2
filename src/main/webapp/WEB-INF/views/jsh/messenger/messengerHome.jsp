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

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
	
	
	function submitFunction(empNO, toEmpNo) {
		var message = $('#message').val()
		$.ajax({
			type:"post",
			url: "submit.msg",
			data: {
				empNO, 
				toEmpNo,
				message
			}
		});
		$('#message').val('');
	}

	var lastID = 0;
	function chatListFunction(num) {
		var toEmpNo = $('#toEmpNo').val()
		var empNO = $('#empNO').val()
		console.log("==num : " + num)
		console.log("==toEmpNo : " + toEmpNo)
		var data = {
			"empNO" : empNO,
			"toEmpNo" : toEmpNo,
			"num" : num 
		}
		$.ajax({
			type:"post",
			url: "chatListFunction.msg",
			contentType: "application/json",
			dataType : "json",
			
			data: JSON.stringify(data),
			success: function(data) {
				console.log("==data : " + data)
				if(data =="") return;
				var parsed = JSON.parse(data);
				var result = parsed.result;
				$("#chatList").html("");
				for(var i=0; i < result.length; i++){
					
					addChat(result[i][0].value, result[i][2].value, result[i][3].value);
				}
				lastID = Number(parsed.last);
			}
		});
	}
	function addChat(chatName, message, createDate) {
		console.log("addChat")
		$("#chatList").append('<div class="row">' +
				'<div class="col-lg-12">' +
				'<div class="media">' +
				'<a class="pull-left" href="#">' +
				'<img class="media-object img-circle" style="width:30px; height: 30px;" src="${pageContext.request.contextPath}/resources/images/common/member.png">' +
				'</a>' +
				'<div class="media-heading">' +
				'<h4  class="media-body">' +
				chatName +
				'<span class="small pull-right">' +
				createDate +
				'</span>' +
				'</h4>' + 
				message +
				'</p>' +
				'</div>' +
				'</div>' +
				'</div>' +
				'</div>' +
				'<hr>');

		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	}
	function getInfiniteChat() {
		setInterval(function() {
			chatListFunction(String(lastID))
		}, 3000);
	}


	</script>




	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />

	<!-- =============================== -->







	<main class="content">
		<div class="container p-0">


			<div class="card">
				<div class="row g-0">
					<div class="col-12 col-lg-5 col-xl-3 border-right">
						<div class="px-4 d-none d-md-block">
							<div class="d-flex align-items-start">
								<c:if test="${!empty sessionScope.profile.originName }">
									<img
										src="${ pageContext.servletContext.contextPath }/resources/profile_files/${sessionScope.profile.changeName}"
										class="rounded-circle mr-1" alt="Vanessa Tucker" width="40"
										height="40">
								</c:if>
								<c:if test="${empty sessionScope.profile.originName }">
									<img
										src="${ pageContext.servletContext.contextPath }/resources/images/common/member.png"
										class="rounded-circle mr-1" alt="Vanessa Tucker" width="40"
										height="40">
								</c:if>
								<div class="flex-grow-1 ml-3">
									${me.empName}
									<div class="small">
										<span class="fas"></span> ${me.message}
									</div>
								</div>
								<input type="hidden" value="${me.empNO}" id="empNO" /> <a
									type="button" class="float-right" data-toggle="modal"
									data-target="#stateModal" style="margin-top: 20px;"
									onclick="stateUpdate('${me.empNO}', '${me.message}', ${me.stateMessageNo});">수정</a>
							</div>
						</div>
						<div class="px-4 d-none d-md-block">
							<div class="d-flex align-items-center">
								<div class="flex-grow-1">
									<form method="post">

										<input class="form-control my-3"
											style="width: 160px; display: inline-block;" type="text"
											name="q1" value="${param.q}" /> <input
											class="btn-sm btn-dark" style="display: inline-block;"
											type="submit" value="검색" />
									</form>
								</div>
							</div>
						</div>
						<c:forEach var="e" items="${emp}">
							<c:if test="${e.empNO != sessionScope.loginUser.empNO}">
								<form method="post">
									<input type="hidden" name="toEmpNo" value="${e.empNO}">
									<button type="submit"
										class="list-group-item list-group-item-action border-0">
										<c:forEach var="r" items="${chatRead}">
											<c:if test="${r.empNO eq e.empNO}">
												<div class="badge bg-success float-right">${r.count}</div>
											</c:if>
										</c:forEach>
										<div class="d-flex align-items-start">
											<c:if test="${!empty e.originName }">
												<img
													src="${ pageContext.servletContext.contextPath }/resources/profile_files/${e.changeName}"
													class="rounded-circle mr-1" width="40" height="40">
											</c:if>
											<c:if test="${empty e.originName }">
												<img
													src="${pageContext.request.contextPath}/resources/images/common/member.png"
													class="rounded-circle mr-1" width="40" height="40">
											</c:if>
											<div class="flex-grow-1 ml-3">
												${e.empName}
												<div class="small">
													<span class="fas"></span> ${e.message}
												</div>
											</div>
										</div>

									</button>
								</form>
							</c:if>
						</c:forEach>
						<hr class="d-block d-lg-none mt-1 mb-0">
					</div>


					<!-- 상대방 클릭하기 전 -->
					<c:if test="${empty toEmp}">
						<div class="col-12 col-lg-7 col-xl-9">
							<div class="py-2 px-4 border-bottom d-none d-lg-block">
								<div class="d-flex align-items-center py-1">
									<div class="position-relative">
										<img
											src="${pageContext.request.contextPath}/resources/images/common/member.png"
											class="rounded-circle mr-1" width="40" height="40">
									</div>
									<div class="flex-grow-1 pl-3">
										<strong></strong>
									</div>

								</div>
							</div>

							<div class="position-relative">
								<div class="chat-messages p-4">

									<div class="chat-message-right pb-4">
										<div>
											<img src="https://bootdey.com/img/Content/avatar/avatar1.png"
												class="rounded-circle mr-1" alt="Chris Wood" width="40"
												height="40">
											<div class="text-muted small text-nowrap mt-2">2:33 am</div>
										</div>
										<div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
											<div class="font-weight-bold mb-1">You</div>
											Lorem ipsum dolor sit amet, vis erat denique in, dicunt
											prodesset te vix.
										</div>
									</div>

									<div class="chat-message-left pb-4">
										<div>
											<img src="https://bootdey.com/img/Content/avatar/avatar3.png"
												class="rounded-circle mr-1" alt="Sharon Lessman" width="40"
												height="40">
											<div class="text-muted small text-nowrap mt-2">2:34 am</div>
										</div>
										<div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
											<div class="font-weight-bold mb-1">Sharon Lessman</div>
											Sit meis deleniti eu, pri vidit meliore docendi ut, an eum
											erat animal commodo.
										</div>
									</div>

								</div>
							</div>

							<div class="flex-grow-0 py-3 px-4 border-top">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="메시지를 입력하세요">
									<button class="btn btn-primary">Send</button>
								</div>
							</div>
						</div>
					</c:if>


					<!-- 상대방 클릭한 후 -->
					<c:if test="${!empty toEmp}">
						<div class="col-12 col-lg-7 col-xl-9">
							<div class="py-2 px-4 border-bottom d-none d-lg-block">
								<div class="d-flex align-items-center py-1">
									<div class="position-relative">
										<c:if test="${!empty toEmp.originName }">
											<img
												src="${ pageContext.servletContext.contextPath }/resources/profile_files/${toEmp.changeName}"
												class="rounded-circle mr-1" width="40" height="40">
										</c:if>
										<c:if test="${empty toEmp.originName }">
											<img
												src="${pageContext.request.contextPath}/resources/images/common/member.png"
												class="rounded-circle mr-1" width="40" height="40">
										</c:if>
									</div>
									<div class="flex-grow-1 pl-3">
										<strong>${toEmp.empName}</strong>
									</div>

								</div>
							</div>

							<div class="position-relative">
								<div class="chat-messages p-4" id="chatList"></div>
							</div>
							<input type="hidden" value="${toEmp.empNO}" name="toEmpNo"
								id="toEmpNo"> <input type="hidden"
								value="${sessionScope.loginUser.empName}" name=empName
								id=empName>
							<div class="flex-grow-0 py-3 px-4 border-top">
								<div class="input-group">
									<textarea class="form-control" id="message" maxlength="2000"
										placeholder="메시지를 입력하세요"></textarea>
									<button type="button" id="btnSend" class="btn btn-primary"
										onclick="submitFunction('${me.empNO}', '${toEmp.empNO}');">전송</button>
								</div>
							</div>
						</div>
					</c:if>

				</div>
			</div>
		</div>
	</main>






	<script
		src="${pageContext.request.contextPath}/resources/js/jsh/messenger/messenger.js"></script>

	<script type="text/javascript">

	$(document).ready(function() {
		console.log("통신");
		chatListFunction('1')
		getInfiniteChat();
	})

	</script>
</body>
</html>