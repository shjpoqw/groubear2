
let websocket;

function openSocket() {
	$.ajax({
		url:"messengerHome.msg",
		data: {
			userEmail: "${member.userEamil}"
		},
		async: false,
		dataType: "json",
		success:function(data) {
			$('div.chatMiddle ul').append("");
			$.each(data, function(index, item) {
				CheckLR(index,item);
			});
		}
	});
	var wsUri="ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath";
		websocket = new WebSocket(wsUri);
	
	websocket.onmessage = onMessage;
	
}
 function connect() {
	 
	 var wsUri ="ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath";
	 
	 websocket = new WebSocket(wsUri);
	 
	 websocket.onopen = onOpen;
	 
	 websocket.onmessage = onMessage;
		
}
function onOpen(){
	
}

function sendMessage(message) {
	
}

function onMessage(evt) {
	
}

function stateUpdate(empNO, messege, stateMessageNo) {
	$('#stateModal').on('show.bs.modal', function(event) {
		$(".modal-body #stateUpdateSMNO").val(stateMessageNo);
		$(".modal-body #stateUpdateMessege").val(messege);
		$(".modal-body #stateUpdateNo").val(empNO);
		
	})
}

$(function() {
	var tabAnchor = $('.selectChat'),
	 	tabPenel = $('.chatForm');
	tabAnchor.click(function(e) {
		e.preventDefault();
		tabAnchor.removeCalss('active');
		$(this).addClass('active');
	})
})

$(function(){
   if ($('#ms-menu-trigger')[0]) {
        $('body').on('click', '#ms-menu-trigger', function() {
            $('.ms-menu').toggleClass('toggled'); 
        });
    }
});



function autoClosingAlert(selector, delay) {
	var alert = $(selector).alert();
	alert.show();
	window.setTimeout(function() { alert.hide()}, delay );
		
}	
function submitFunction() {
	var message = $('#message').val();
	var toEmpNo = $('#toEmpNo').val();
	$.ajax({
		type:"POST",
		url: "transmit.msg",
		data: {
			toEmpNo ,
			message 
		}
		
	});
	$('#message').val('');
}


