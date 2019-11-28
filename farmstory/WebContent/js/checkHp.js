$(function() {
	$('input[name=hp]').focusout(function() {

		var input = $(this);

		$.ajax({
			url	: '/farmstory/user/checkHpProc.jsp?hp='+input.val(),
			type: 'get',
			dataType: 'json',
			success:function(data){
				if(data.result == 1){
					$('.resultHp').css('color', 'red').text('이미 사용중인 전화번호 입니다.');
					input.focus();
				}else{
					$('.resultHp').css('color', 'blue').text('사용 가능한 전화번호 입니다.');
				}
			}
		});
	});
});