var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var beamCode = $('#beamCode');
var editTitle = $('#title');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');

var editDesc = $('#edit-desc');
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
    editDesc.val('');
    $("edit-type").val("01").prop('selected',true);
    
   
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');

   var eventId;

    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {

        var eventData = {
            
        	_id: 0,
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            description: editDesc.val(),
            type: editType.val(),
            beam: "N"
        };
        
        alert(eventData.type);
        

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title == '') {
            alert('일정명은 필수입니다.');
            return false;
        }
        if (eventData.type ==null){
        	alert('회의실을 선택해주세요');
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

            	title : eventData.title,
            	start : eventData.start,
            	end : eventData.end,
            	description : eventData.description,
                type: eventData.type ,
                beamCode : eventData.beam
                
            },
            success: function () {
            	
            	alert('일정 추가되었습니다.');
            	
                
              
            },
            error:function(request,status,error){
            	alert("일정 추가에 실패하였습니다. : 모든 항목을 기재 해주시길 바랍니다. ");
               }
             

        });
    });
};