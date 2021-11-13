<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">	
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>
	
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/common/all.min.css" rel="stylesheet" type="text/css">
   
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%=request.getContextPath()%>/resources/css/common/sb-admin-2.min.css" rel="stylesheet"> 
	<script src="https://kit.fontawesome.com/568d1fce8b.js" crossorigin="anonymous"></script>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="main.p">
                <div class="sidebar-brand-icon rotate-n-15" style="width:50px; height:50px;">
                  	<img  src="${pageContext.request.contextPath}/resources/images/common/groubear4.png" style="width:50px; height:50px;">
                                           
                </div>
                <div class="sidebar-brand-text mx-3">GROUBEAR</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="main.p">
                   
                    <span>Home</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                관리
            </div>

            <!-- Nav Item - Collapse Menu one -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOne"
                    aria-expanded="true" aria-id="collapseOne" >
                 	<span style="display:inline-block; width:20px; height:20px;">
                  		<img  src="${pageContext.request.contextPath}/resources/images/common/approval.png" style="width:20px; height:20px;" >                 
                	</span>
                    <span>전자결재</span>
                    
                </a>
                <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        
                        <a class="collapse-item" href="formList.ep">문서 작성</a>
                        <a class="collapse-item" href="tempSentList.ep">임시 저장함</a>
						<a class="collapse-item" href="sentList.ep">상신 문서함</a>
						<a class="collapse-item" href="receivedList.ep">결재 문서함</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Collapse Menu tow -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseUtilities">
                   <span style="display:inline-block; width:20px; height:20px;">
                  		<img  src="${pageContext.request.contextPath}/resources/images/common/commute.png" style="width:20px; height:20px;" >                 
                	</span>
                    <span>근태관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="recordForm.cm">출/퇴근 기록</a>
                        <a class="collapse-item" href="myRecord.cm">나의 근태현황</a>
                        <a class="collapse-item" href="leaveMyRecord.lv">연차 내역</a>
                       	<c:if test="${ loginUser.empId eq 'admin' }">
                           <a class="collapse-item" href="allRecord.cm">전사 근태현황</a>
                        </c:if>
                    </div>
                </div>
            </li>

	<li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
                    aria-expanded="true" aria-controls="collapseUtilities">
                   <span style="display:inline-block; width:20px; height:20px;">
                  		<img src="${pageContext.request.contextPath}/resources/images/common/manage.png" style="width:20px; height:20px;">                 
                	</span>
                    <span>인사관리</span>
                </a>
                <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        
                        <a class="collapse-item" href="list.mem">직원 조회</a>
                       
                    </div>
                </div>
            </li>

	<!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFour"
                    aria-expanded="true" aria-controls="collapseUtilities">
                   <span style="display:inline-block; width:20px; height:20px;">
                  		<img  src="${pageContext.request.contextPath}/resources/images/common/reservation.png" style="width:20px; height:20px;">                 
                	</span>
                    <span>자원관리</span>
                </a>
                <div id="collapseFour" class="collapse" aria-labelledby="headingFour"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                    
                        <a class="collapse-item" href="roomView.re">회의실 예약</a>
                        <a class="collapse-item" href="carView.re">차량 예약</a>
                    </div>
                </div>
            </li>

	<!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFive"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span style="display:inline-block; width:20px; height:20px;">
                  		<img  src="${pageContext.request.contextPath}/resources/images/common/calender.png" style="width:20px; height:20px;">                 
                	</span>
                    <span>캘린더</span>
                </a>
                <div id="collapseFive" class="collapse" aria-labelledby="headingFive"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                       
                        <a class="collapse-item" href="calendarList.cal">개인 일정</a>
                        
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                커뮤니티
            </div>

           	<!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSix"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span style="display:inline-block; width:20px; height:20px;">
                  		<img  src="${pageContext.request.contextPath}/resources/images/common/contact.png" style="width:20px; height:20px;">                 
                	</span>
                    <span>주소록</span>
                </a>
                <div id="collapseSix" class="collapse" aria-labelledby="headingSix"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="publicList.ct">사원 조회</a>
                        <a class="collapse-item" href="contactList.ct">개인 주소록</a>
                    
                    </div>
                </div>
            </li>


 	<!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="messengerHome.msg">
                    <span style="display:inline-block; width:20px; height:20px;">
                  		<img  src="${pageContext.request.contextPath}/resources/images/common/messenger.png" style="width:20px; height:20px;">                 
                	</span>
                    <span>메신저</span></a>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="list.sns">
                    <span style="display:inline-block; width:20px; height:20px;">
                  		<img  src="${pageContext.request.contextPath}/resources/images/common/sns.png" style="width:20px; height:20px;">                 
                	</span>
                    <span>SNS</span></a>
            </li>

        

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                   

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                      

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"> ${sessionScope.loginUser.empName}</span>
                                <c:if test="${!empty sessionScope.profile.originName }">
                                <img class="img-profile rounded-circle"
                                	src="${ pageContext.servletContext.contextPath }/resources/profile_files/${sessionScope.profile.changeName}"/>
                                </c:if>
                                <c:if test="${empty sessionScope.profile.originName}">
                                <img class="img-profile rounded-circle"
                                    src="${pageContext.request.contextPath}/resources/images/common/member.png">
                                </c:if>
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="myPage.me">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                  	  마이페이지
                                </a>
                                
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                             	       로그아웃
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

		
	</div>

		</div>
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="logout.me">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="<%=request.getContextPath()%>/resources/js/common/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/common/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%=request.getContextPath()%>/resources/js/common/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%=request.getContextPath()%>/resources/js/common/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="<%=request.getContextPath()%>/resources/js/common/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="<%=request.getContextPath()%>/resources/js/common/chart-area-demo.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/common/chart-pie-demo.js"></script>


	
</body>

</html>