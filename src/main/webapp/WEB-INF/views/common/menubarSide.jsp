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

<body>

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15" style="width:50px; height:50px;">
                  	<img  src="${pageContext.request.contextPath}/resources/images/common/undraw_profile_1.svg">
                                           
                </div>
                <div class="sidebar-brand-text mx-3">GROUBEAR</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="index.html">
                   
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
                  		<img  src="${pageContext.request.contextPath}/resources/images/common/undraw_profile_1.svg">                 
                	</span>
                    <span>전자결재</span>
                    
                </a>
                <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        
                        <a class="collapse-item" href="#">문서 작성</a>
                        <a class="collapse-item" href="#">임시 저장함</a>
						<a class="collapse-item" href="#">상신 문서함</a>
						<a class="collapse-item" href="#">결재 문서함</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Collapse Menu tow -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseUtilities">
                   <span style="display:inline-block; width:20px; height:20px;">
                  		<img  src="${pageContext.request.contextPath}/resources/images/common/undraw_profile_1.svg">                 
                	</span>
                    <span>근태관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="#">출/퇴근 기록</a>
                        <a class="collapse-item" href="#">나의 근태현황</a>
                        <a class="collapse-item" href="#">연차 내역</a>
                        <a class="collapse-item" href="#">전사 근태현황</a>
                    </div>
                </div>
            </li>

	<li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
                    aria-expanded="true" aria-controls="collapseUtilities">
                   <span style="display:inline-block; width:20px; height:20px;">
                  		<img  src="${pageContext.request.contextPath}/resources/images/common/undraw_profile_1.svg">                 
                	</span>
                    <span>인사관리</span>
                </a>
                <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        
                        <a class="collapse-item" href="#">출/퇴근 기록</a>
                        <a class="collapse-item" href="#">나의 근태현황</a>
                        <a class="collapse-item" href="#">연차 내역</a>
                        <a class="collapse-item" href="#">전사 근태현황</a>
                    </div>
                </div>
            </li>

	<!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFour"
                    aria-expanded="true" aria-controls="collapseUtilities">
                   <span style="display:inline-block; width:20px; height:20px;">
                  		<img  src="${pageContext.request.contextPath}/resources/images/common/undraw_profile_1.svg">                 
                	</span>
                    <span>자원관리</span>
                </a>
                <div id="collapseFour" class="collapse" aria-labelledby="headingFour"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                    
                        <a class="collapse-item" href="roomView.re">회의실 예약</a>
                        <a class="collapse-item" href="#">차량 예약</a>
                    </div>
                </div>
            </li>

	<!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFive"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span style="display:inline-block; width:20px; height:20px;">
                  		<img  src="${pageContext.request.contextPath}/resources/images/common/undraw_profile_1.svg">                 
                	</span>
                    <span>캘린더</span>
                </a>
                <div id="collapseFive" class="collapse" aria-labelledby="headingFive"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                       
                        <a class="collapse-item" href="calendarList.cal">개인 일정</a>
                        <a class="collapse-item" href="#">그룹 일정</a>
                        
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
                  		<img  src="${pageContext.request.contextPath}/resources/images/common/undraw_profile_1.svg">                 
                	</span>
                    <span>주소록</span>
                </a>
                <div id="collapseSix" class="collapse" aria-labelledby="headingSix"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="#">사원 조회</a>
                        <a class="collapse-item" href="#">개인 주소록</a>
                    
                    </div>
                </div>
            </li>


 	<!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <span style="display:inline-block; width:20px; height:20px;">
                  		<img  src="${pageContext.request.contextPath}/resources/images/common/undraw_profile_1.svg">                 
                	</span>
                    <span>메신저</span></a>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="list.sns">
                    <span style="display:inline-block; width:20px; height:20px;">
                  		<img  src="${pageContext.request.contextPath}/resources/images/common/undraw_profile_1.svg">                 
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