function selectContact(contactNo, name, phone, email,
		companyName, companyPhone, memo) {
	$('#updateContact').on('show.bs.modal', function(event) {
		$(".modal-body #contactNo").val(contactNo);
		$(".modal-body #name").val(name);
		$(".modal-body #phone").val(phone);
		$(".modal-body #email").val(email);
		$(".modal-body #companyName").val(companyName);
		$(".modal-body #companyPhone").val(companyPhone);
		$(".modal-body #memo").val(memo);
		
	})
}
function deleteContact(contactNo) {
	$('#deleteContact').on('show.bs.modal', function(event) {
		$(".modal-body #deleteNo").val(contactNo);
		
	})
}
