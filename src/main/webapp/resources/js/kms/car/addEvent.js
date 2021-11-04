var eventModal = $('#eventModal');
var modalTitle = $('.modal-title');
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
        };

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.일정명 === '') {
            alert('일정명은 필수입니다.');
            return false;
        }
        if (eventData.구분 ===''){
        	alert('차종을 선택해주세요');
        	return false;
        }

        

      

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        eventModal.modal('hide');

        //새로운 일정 저장
        $.ajax({
            type: "post",
            url: "reserveCar.re",
            data: {

            	title : eventData.title,
            	start : eventData.start,
            	end : eventData.end,
            	description : eventData.description,
            	type: eventData.type 
                
            },
            success: function () {
            	
            	console.log("성공");
            	
                
             
                           },
            error:function(request,status,error){
            	console.log("실패 : "+"error : "+error);
               }
             

        });
    });
};