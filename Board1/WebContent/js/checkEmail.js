$(function() {
	$('input[name=email]').focusout(function() {

		var input = $(this);

		$.ajax({
			url	: '/Board1/user/checkEmailProc.jsp?email='+input.val(),
			type: 'get',
			dataType: 'json',
			success:function(data){
				if(data.result == 1){
					$('.resultEmail').css('color', 'red').text('이미 사용중인 이메일 입니다.');
					input.focus();
				}else{
					$('.resultEmail').css('color', 'blue').text('사용 가능한 이메일 입니다.');
				}
			}
		});
	});
});