$(function(){
		
	var theater_city = $('#theater_city');
	var theater_name = $('#theater_name');
	var screen_name  = $('#screen_name');
	var movie_no 	 = $('#movie_no');
	var movie_date 	 = $('#movie_date');
	var round_view 	 = $('#round_view');
	var price 		 = $('#price');
	
	theater_city.change(function(){

		var city = $(this).val();			
		var url  = "/jcinema/admin/api/theater?city="+city;
		
		$.get(url, function(data){
			//모든 option태그 삭제
			theater_name.empty();
			theater_name.append('<option>선택</option>');
			
			for(var i=0; i<data.length; i++){
				theater_name.append('<option value="'+data[i].theater_no+'">'+data[i].theater_name+'</option>');
			}
			
		});
	});

	// 영화관 선택하고 서버로 부터 상영관 정보 가져오기
	theater_name.change(function(){
		
		var theater_no = $(this).val();
		var url = "/jcinema/admin/api/screen?theater_no="+theater_no;
					
		$.get(url, function(data){
			
			// 모든 option태그 삭제
			screen_name.empty();
			screen_name.append('<option>선택</option>');
			
			for(var i=0 ; i<data.length ; i++){
				screen_name.append('<option value="'+data[i].screen_no+'">'+data[i].screen_name+'</option>');
			}
							
		});
		
		// 영화관을 선택하고 input[name=theater_no]에 영화관 번호 입력
		var theater_no = $(this).val();
		$('input[name=theater_no]').val(theater_no);
		
	});
	
	screen_name.change(function(){
		
		var screen_no = $(this).val();
		$('input[name=screen_no]').val(screen_no);
		
	});
	
	round_view.change(function(){
		
		var count = $(this).val();
		
		if(count == 0){
			alert('회차를 선택하세요.');
		}
		
		var theater_no 		= $('input[name=theater_no]').val();
		var screen_no 		= $('input[name=screen_no]').val();
		var schedule_date   = $('input[name=movie_date]').val();
		var round_view 		= $('select[name=round_view]').val();
		
		
		var json = {'theater_no': theater_no, 
				    'screen_no': screen_no, 
				    'schedule_date': schedule_date,
				    'round_view':round_view};

		
		var url = "/jcinema/admin/api/movie-schedule";
		
		
		$.post(url, json, function(data){
			
			$('input[name=movie_no]').val(data.schedule_movie_no);
			$('input[name=movie_title]').val(data.movie_title);
			
		});
		
		
	});
	
});