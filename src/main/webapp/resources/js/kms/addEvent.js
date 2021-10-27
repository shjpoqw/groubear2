var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var beamCode = $('#beamCode');
var editTitle = $('#title');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editContent = $('#content');
var editNo = $('empNo');
var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end, eventType) {

    $("#contextMenu").hide(); //메뉴 숨김

    modalTitle.html('새로운 일정');
    editType.val(eventType).prop('selected', true);
    editTitle.val('');
    editStart.val(start);
    editEnd.val(end);
    editContent.val('');
    editNo.val('');
    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');

   

    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {

        var eventData = {
            
        	empNo : editNo.val(),
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            content: editContent.val(),
            roomNo: editType.val(),
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            beam: "N"
        };

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title === '') {
            alert('대여자명은 필수입니다.');
            return false;
        }
        

        

        if (beamCode.is(':checked')) {
            
            eventData.beam = "Y";
        }

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        beamCode.prop('checked', false);
        eventModal.modal('hide');

        //새로운 일정 저장
        $.ajax({
            type: "post",
            url: "reserveRoom.re",
            data: {
            	"empNo" : eventData.empNo,
            	"title" : eventData.title,
            	"startDate" : eventData.start,
            	"endDate" : eventData.end,
                "roomContent" : eventData.content,
                "roomNo": eventData.roomNo ,
                "beamCode" : eventData.beam
                
            },
            success: function () {
            	
            	console.log("성공");
            	
                //DB연동시 중복이벤트 방지를 위한
               // $('#calendar').fullCalendar('removeEvents');
               // $('#calendar').fullCalendar('refetchEvents');
            },
            error:function(request,status,error){
            	console.log("실패 : ",error);
               }
             

        });
    });
};