<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../_header.jsp" %>
<script>

	$(function(){
		
		var theater_city = $('#theater_city');
		var theater_name = $('#theater_name');
		var screen_name  = $('#screen_name');
		var movie_no 	 = $('#movie_no');
		var movie_date 	 = $('#movie_date');
		var round_view 	 = $('#round_view');
		var price 		 = $('#price');
		
		
		theater_name.attr('disabled', true);
		screen_name.attr('disabled', true);
		movie_no.attr('disabled', true);
		movie_date.attr('disabled', true);
		round_view.attr('disabled', true);
		price.attr('disabled', true);
		
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
				theater_name.attr('disabled', false);
				screen_name.attr('disabled', false);
				
			});
		});

		theater_name.change(function(){
			
			var theater_no = $(this).val();
			var url = "/jcinema/admin/api/screen?theater_no="+theater_no;
			
			$.get(url, function(data){
				//모든 option태그 삭제
				screen_name.empty();
				screen_name.append('<option>선택</option>');
				
				for(var i=0; i<data.length; i++){
					screen_name.append('<option value="'+data[i].screen_no+'">'+data[i].screen_name+'</option>');
				}
				screen_name.attr('disabled', false);
				movie_no.attr('disabled', false);
			});
		});
		
	});

</script>      
<section class="ticket-register">

    <nav>
        <h3>티켓등록</h3>
        <p>티켓관리 > 티켓등록</p>
    </nav>
                        
    <article>
        <form action="#">
            <div class="field">
                <label for="theater_city">영화관</label>
                <select name="theater_city" id="theater_city">
                    <option>서울</option>
                    <option>경기/인천</option>
                    <option>충청/대전</option>
                    <option>전라/광주</option>
                    <option>경북/대구</option>
                    <option>경남/부산/울산</option>
                    <option>강원</option>
                    <option>제주</option>
                </select>
                <select name="theater_name" id="theater_name">
                    <option>선택</option>
                </select>
            </div>
            <div class="field">
                <label for="screen_name">상영관</label>
                <select name="screen_name" id="screen_name">
                    <option value="01">1관</option>
                    <option value="02">2관</option>
                    <option value="03">3관</option>
                    <option value="04">4관</option>
                    <option value="05">5관</option>
                </select>
            </div>
            <div class="field">
                <label for="movie_no">영화</label>
                <select name="movie_no" id="movie_no">
                    <option value="001">겨울왕국2</option>
                    <option value="002">백두산</option>
                    <option value="003">캣츠</option>
                    <option value="004">시동</option>
                    <option value="005">천문:하늘에 묻는다.</option>                                    
                </select>
            </div>
            <div class="field">
                <label for="movie_date">상영일</label>
                <input id="movie_date" type="date" name="movie_date" />
            </div>
            <div class="field">
                <label for="round_view">상영회차</label>
                <select name="round_view" id="round_view">
                    <option value="1">1회차</option>
                    <option value="2">2회차</option>
                    <option value="3">3회차</option>
                    <option value="4">4회차</option>
                    <option value="5">5회차</option>                                    
                </select>
            </div>
            
            <div class="field">
                <label for="price">티켓가격</label>
                <input id="price" type="text" name="price" />
                <span>1인 1매 가격 예) 10000, 12000, 18000</span>
            </div>              
            
            <button type="submit" class="btnRegister">등록하기</button>
        </form>
    </article>

    

</section>

<%@ include file ="../_footer.jsp" %>