$(function() {
	$('input[name=uid]').focusout(function() {

		var input = $(this);

		$.ajax({
			url	: '/Board1/user/checkUidProc.jsp?uid='+input.val(),
			type: 'get',
			dataType: 'json',
			success:function(data){
				if(data.result == 1){
					$('.resultId').css('color', 'red').text('이미 사용중인 아이디 입니다.');
					input.focus();
				}else{
					$('.resultId').css('color', 'blue').text('사용 가능한 아이디 입니다.');
				}
			}
		});
	});
});