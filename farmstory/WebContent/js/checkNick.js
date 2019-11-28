$(function() {
	$('input[name=nick]').focusout(function() {

		var input = $(this);

		$.ajax({
			url	: '/farmstory/user/checkNickProc.jsp?nick='+input.val(),
			type: 'get',
			dataType: 'json',
			success:function(data){
				if(data.result == 1){
					$('.resultNick').css('color', 'red').text('이미 사용중인 닉네임 입니다.');
					input.focus();
				}else{
					$('.resultNick').css('color', 'blue').text('사용 가능한 닉네임 입니다.');
				}
			}
		});
	});
});