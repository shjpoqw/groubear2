
$(function(){
    $(".heading-compose").click(function() {
      $(".side-two").css({
        "left": "0"
      });
    });

    $(".newMessage-back").click(function() {
      $(".side-two").css({
        "left": "-100%"
      });
    });
}) 

function stateUpdate(empNO, messege, stateMessageNo) {
	$('#stateModal').on('show.bs.modal', function(event) {
		$(".modal-body #stateUpdateSMNO").val(stateMessageNo);
		$(".modal-body #stateUpdateMessege").val(messege);
		$(".modal-body #stateUpdateNo").val(empNO);
		
	})
}








