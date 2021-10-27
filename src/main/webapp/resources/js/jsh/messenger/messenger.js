
function stateUpdate(empNO, messege, stateMessageNo) {
	$('#stateModal').on('show.bs.modal', function(event) {
		$(".modal-body #stateUpdateSMNO").val(stateMessageNo);
		$(".modal-body #stateUpdateMessege").val(messege);
		$(".modal-body #stateUpdateNo").val(empNO);
		
	})
}

function stateUpdate(empNO) {
	$('#insertMsgModal').on('show.bs.modal', function(event) {
		$(".modal-body #msgInsertNo").val(empNO);
		
	})
}
