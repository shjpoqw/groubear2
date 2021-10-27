<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<!-- css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/kms/fullcalendar.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/kms/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/kms/select2.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/kms/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/kms/bootstrap.min.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">



<style>
	.add-button{
		position:absolute;
		top:1px;
		right:230px;
		border:0;
		height: 35px;
		border-radous:3px;
		width:150px;
	}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
 <div class="container">

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">대회의실?</a></li>
                <li><a tabindex="-1" href="#">소회의실1</a></li>
                <li><a tabindex="-1" href="#">소회의실2</a></li>
                <li><a tabindex="-1" href="#">소회의실3</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"> </div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
            
            	 <input class="inputModal" type="hidden" name=empNo id="empNo" value="	${sessionScope.empNo }">
                                   
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                     

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="title">일정명</label>
                                <input class="inputModal" type="text" name="title" id="title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="01">대회의실</option>
                                    <option value="02">소회의실1</option>
                                    <option value="03">소회의실2</option>
                                    <option value="04">소회의실3</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="content">목적</label>
                                <textarea rows="4" cols="50" class="inputModal" name="content"
                                    id="content"></textarea>
                            </div>
                        </div>
                          <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="beamCode">빔 대여 여부</label>
                                <input class='beamNewEvent' id="beamCode" type="checkbox">
                            </div>
                        </div>
                        
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->


    </div>
    <!-- /.container -->
	

	<!-- js -->
	<script src="<%=request.getContextPath()%>/resources/js/kms/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/kms/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/kms/moment.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/kms/fullcalendar.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/kms/ko.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/kms/select2.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/kms/bootstrap-datetimepicker.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/kms/main.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/kms/addEvent.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/kms/editEvent.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/kms/etcSetting.js"></script>





</body>
</html>