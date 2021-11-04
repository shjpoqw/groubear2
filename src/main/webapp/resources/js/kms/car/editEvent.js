/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view) {

    $('#deleteEvent').data('id', event._id); //클릭한 이벤트 ID

    $('.popover.fade.top').remove();
    $(element).popover("hide");

    
    
    modalTitle.html('일정 수정');
    editTitle.val(event.title);
    editStart.val(event.start.format('YYYY-MM-DD HH:mm'));
    editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    editType.val(event.type).prop("selected",true);
    editDesc.val(event.description);

   
   

    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');

    //업데이트 버튼 클릭시
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () {

        if (editStart.val() > editEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (editTitle.val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }

       
        var startDate;
        var endDate;
        var displayDate;
   
            start = editStart.val();
            end = editEnd.val();
            displayDate = end;
        

        eventModal.modal('hide');

       
        event.title = editTitle.val();
        event.start = start;
        event.end = displayDate;
        event.type = editType.val();
        event.description = editDesc.val();
       
  
        $("#calendar").fullCalendar('updateEvent', event);

        //일정 업데이트
        $.ajax({
            type: "get",
            url: "updateCar.re",
            data: {
            	_id : event._id,
                title :  event.title,
                start : event.start,
                end : event.end,
                type : event.type,
                description : event.description
                
            },
            success: function (response) {
                alert('수정되었습니다.');
                
                
            },
            error:function(request,status,error){
           	 alert("수정 실패하였습니다. : 모든 항목을 기재 해주시길 바랍니다. ");
           	
           }
        });

    });
 // 삭제버튼
    $('#deleteEvent').on('click', function () {

        $('#deleteEvent').unbind();
        $("#calendar").fullCalendar('removeEvents', $(this).data('id'));
        eventModal.modal('hide');

        console.log("id : "+$('#deleteEvent').data('id', event._id));
        console.log("id : "+event._id);
        
        
        //삭제시
        $.ajax({
            type: "get",
            url: "deleteCar.re",
            data: {
            	_id : event._id,
            },
            success: function (response) {
                alert('삭제되었습니다.');
            },
            error:function(request,status,error){
            	 alert("삭제 실패하였습니다. : 모든 항목을 기재 해주시길 바랍니다. ");
            	
            }
          
            
        });

    });


};

