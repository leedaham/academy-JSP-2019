<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="./_header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<style>
/* bxSlider 커스텀 */
	.bx-wrapper {
		max-width: none !important;
		box-shadow: none;
    	border: none;
	}
	.bx-wrapper img {
		width: 188px;
	}
</style>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>

	// 상단배너
	$(function(){
		
		
		
	});
	
	// 예매순위
	$(function(){});
	
	// 슬라이드 배너
	$(function(){});

	// 영화 포스터 배너
	$(function(){
		var posterUl = $('.poster > article > ul');
		
		$.ajax({
			url:'/jcinema/movie/posters',
			type:'get',
			dataType:'json',
			success:function(data){
				// alert(data.length);
				for(var i=0; i<data.length ; i++){
					posterUl.append(
							"<li><a href='/jcinema/movie/detail?movie_no="+data[i].movie_no+"'><img src='/jcinema/resource/poster/"+data[i].movie_poster+"' alt='"+data[i].movie_title+"'></a></li>"
							);	
				}
				// bxSlider로 실행
				posterUl.bxSlider({
					slideWidth: '188px',
					minSlides: 5,
					maxSlides: 5,
					moveSlides: 1,
					auto:true,
					pause:3000,
					controls: false,
					pager: false
				});
			}
		});
	});
</script>
        <main>
            <div class="slider">
                <div>
                    <ul>
                        <li><img src="./img/slider_banner_poster1.jpg" alt=""></li>
                    </ul>
                    <div class="box-office">
                        <div class="top">
                            <img src="./img/tit_boxoffice.png" alt="BOX OFFICE">
                            <span class="tab">
                                <a href="#" class="on">예매순</a>
                                <span>|</span>
                                <a href="#">평점순</a>
                            </span>
                        </div>
                        <ul>
                            <li>
                                <a href="#">
                                    <em class="rank">1.</em>
                                    <span class="grade gradeAll">12</span>
                                    <span class="tit">조커</span>
                                </a>
                                <span>예매율<em>24.2%</em></span>
                            </li>
                            <li>
                                <a href="#">
                                    <em class="rank">2.</em>
                                    <span class="grade grade12">12</span>
                                    <span class="tit">82년생 김지영</span>
                                </a>
                                <span>예매율<em>24.2%</em></span>
                            </li>
                            <li>
                                <a href="#">
                                    <em class="rank">3.</em>
                                    <span class="grade grade15">12</span>
                                    <span class="tit">가장 보통의 연애</span>
                                </a>
                                <span>예매율<em>24.2%</em></span>
                            </li>
                            <li>
                                <a href="#">
                                    <em class="rank">4.</em>
                                    <span class="grade grade18">12</span>
                                    <span class="tit">조커</span>
                                </a>
                                <span>예매율<em>24.2%</em></span>
                            </li>
                            <li>
                                <a href="#">
                                    <em class="rank">5.</em>
                                    <span class="grade grade19">12</span>
                                    <span class="tit">조커</span>
                                </a>
                                <span>예매율<em>24.2%</em></span>
                            </li>
                            <li>
                                <a href="#">
                                    <em class="rank">6.</em>
                                    <span class="grade grade12">12</span>
                                    <span class="tit">조커</span>
                                </a>
                                <span>예매율<em>24.2%</em></span>
                            </li>
                            <li>
                                <a href="#">
                                    <em class="rank">7.</em>
                                    <span class="grade grade12">12</span>
                                    <span class="tit">조커</span>
                                </a>
                                <span>예매율<em>24.2%</em></span>
                            </li>
                        </ul>
                        <a href="#">예매하기</a>
                    </div>
                </div>
            </div>
            <div class="poster">
                <article>
                    <ul>
                        
                    </ul>
                </article>
            </div>
            <div class="sponsor">
                <article>
                    <ul>
                        <li><a href="#"><img src="./img/sponsor_img1.jpg" alt=""></a></li>
                        <li><a href="#"><img src="./img/sponsor_img2.jpg" alt=""></a></li>
                        <li><a href="#"><img src="./img/sponsor_img3.jpg" alt=""></a></li>
                        <li><a href="#"><img src="./img/sponsor_img4.jpg" alt=""></a></li>
                        <li><a href="#"><img src="./img/sponsor_img5.jpg" alt=""></a></li>
                        <li><a href="#"><img src="./img/sponsor_img6.jpg" alt=""></a></li>
                        <li><a href="#"><img src="./img/sponsor_img7.jpg" alt=""></a></li>
                        <li><a href="#"><img src="./img/sponsor_img8.jpg" alt=""></a></li>
                    </ul>
                </article>
            </div>
            <div class="event">
                <article>
                    <h1>Event</h1>

                    <div>
                        <a href="#"><img src="./img/event_img3.jpg" alt=""></a>
                        <a href="#"><img src="./img/event_img2.jpg" alt=""></a>
                        <a href="#"><img src="./img/event_img1.jpg" alt=""></a>
                        <a href="#"><img src="./img/event_img6.jpg" alt=""></a>
                        <a href="#"><img src="./img/event_img5.jpg" alt=""></a>
                        <a href="#"><img src="./img/event_img4.jpg" alt=""></a>
                        <a href="#"><img src="./img/event_img7.jpg" alt=""></a>
                    </div>
                </article>            
            </div>
            <div class="quick">
                <article>
                    <a href="#"><img src="./img/quick_menu1.gif" alt=""></a>
                    <a href="#"><img src="./img/quick_menu2.gif" alt=""></a>
                    <a href="#"><img src="./img/quick_menu3.gif" alt=""></a>
                    <a href="#"><img src="./img/quick_menu4.gif" alt=""></a>
                    <a href="#"><img src="./img/quick_menu5.gif" alt=""></a>
                </article>
            </div>
            <div class="notice">
                <article>
                    <h2>공지사항</h2>
                    <ul>
                        <li><a href="#">시스템 점검 안내</a></li>
                        <li><a href="#">개인정보 이용내역 안내</a></li>
                        <li><a href="#">개인정보 처리방침 개정 안내</a></li>
                        <li><a href="#">씨티카드 시스템 점검 안내</a></li>
                        <li><a href="#">환불규정 안내</a></li>                        
                    </ul>

                    <a class="more" href="#">MORE</a>

                </article>
            </div>            
        </main>
<%@ include file ="./_footer.jsp" %>