<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function() {
	$(".slider_02 .btn_prev").click(function(e){
	    slider_02_num=(slider_02_num-1)%$(".slider_02 ul li").length;
	    $(".slider_02 .bullet a:eq("+slider_02_num+")").trigger("click");
	});

	$(".slider_02 .btn_next").click(function(e){
	    slider_02_num=(slider_02_num+1)%$(".slider_02 ul li").length;
	    $(".slider_02 .bullet a:eq("+slider_02_num+")").trigger("click");
	});
});
</script>
<style>
/* Reset */
html,body{min-height:100%}
html,body,div,ul,li,dl,dt,dd,p,h1,h2,h3,h4,h5,h6,a,span,form,input, select { margin:0; padding:0; }
a { border:0; text-decoration:none; font:normal 14px 'Noto Sans KR',sans-serif; color:#333; letter-spacing:-0.3px; }
ul,dl,ol { list-style:none; }
img { max-width:100%; border:0; vertical-align:top; -webkit-user-select:none; -moz-user-select:none; -ms-user-select:none; user-select: none; }
body { min-width:1024px; font:normal 14px 'Noto Sans KR',sans-serif; color:#555; letter-spacing:-0.3px;}
table { width:100%; border-collapse:collapse; font:normal 14px 'Noto Sans KR',sans-serif; color:#333; }
input,select,textarea,button { font:normal 14px 'Noto Sans KR',sans-serif; color:#555; }


#container { padding-top:101px; position: relative; }/*20190325 수정*/
#container.main h3 { margin-bottom:58px; font-size:38px; font-weight:700; color:#292c25; text-align:center; letter-spacing:-1px; }



#contents { width:960px; padding:70px 0 100px; margin:0 auto; }


#sub_01 .item_01 .slider { margin-top:45px; }
#sub_01 .item_02 > ul > li { padding-top:50px; overflow:hidden; }
#sub_01 .item_02 > ul > li:first-child { padding-top:0; }

#sub_01 .item_02 >    ul > li .txt { width:385px; height:260px; display:table; }
#sub_01 .item_02 > ul > li .txt dl { display:table-cell; vertical-align:middle; }
#sub_01 .item_02 > ul > li .txt dl dt { font-size:20px; font-weight:700; color:#292c25; }
#sub_01 .item_02 > ul > li .txt dl dd { margin-top:12px; font-size:15px; line-height:150%; color:#666; }
#sub_01 .item_02 > ul > li .txt dl dd.info { margin-top:5px; font-size:12px; color:#888; }
#sub_01 .item_02 > ul > li .txt dl dd.link { margin-top:20px; }
#sub_01 .item_02 > ul > li .txt dl dd.link a { display:inline-block; width:100px; border:1px solid #b2b2b2; font-size:13px; font-weight:500; line-height:34px; color:#56991f; text-align:center; }
#sub_01 .item_02 > ul > li .txt dl dd.link a:hover { color:#fff; background:#56991f; }
#sub_01 .item_02 > ul > li .img { width:520px; }
#sub_01 .item_02 > ul > li.left .img { float:left; }
#sub_01 .item_02 > ul > li.left .txt { float:right; padding-left:50px; }
#sub_01 .item_02 > ul > li.right .img { float:right; }
#sub_01 .item_02 > ul > li.right .txt { float:left; padding-right:55px; }
#sub_01 .item_03 { text-align:center; }
#sub_01 .item_03 h4 { display:inline-block; padding:0 32px; font-size:32px; font-weight:700; color:#56991f; }
#sub_01 .item_03.man h4 { background:url(/images/icon_man.png) 0 center no-repeat; }
#sub_01 .item_03.woman { margin-top:50px; padding-top:50px; border-top:1px solid #ccc; background:url(/images/sub_01_title.png) 0 50px no-repeat; }
#sub_01 .item_03.woman h4 { background:url(/images/icon_woman.png) 0 center no-repeat; }
#sub_01 .item_03.woman div { margin-bottom:60px; }
#sub_01 .item_03 .line { margin:5px 0 30px; }
#sub_01 .item_03 .line span { display:inline-block; width:40px; height:2px; background:#56991f; }
#sub_01 .item_03 ul { margin-bottom:70px; overflow:hidden; }
#sub_01 .item_03 ul li { width:20%; float:left; padding:24px 10px 30px; border-left:1px solid #fff; box-sizing:border-box; background:#6d7073; }
#sub_01 .item_03 ul li.gray { background:#6d7073; }
#sub_01 .item_03 ul li:first-child { border-left:0; }
#sub_01 .item_03 ul li p { font-size:20px; font-weight:700; color:#fff; }
#sub_01 .item_03 ul li p span { display:block; padding-bottom:5px; font-size:12px; font-weight:800; color:#77c9f9; }
#sub_01 .item_03 ul li p:first-child { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #ddd; }

#sub_01.body .article { margin-top:35px; }
#sub_01.body .article .img { overflow:hidden; }
#sub_01.body .article .img p { width:475px; float:left; position:relative; }
#sub_01.body .article .img p:first-child { margin-right:10px; }
#sub_01.body .article .img p span { width:104px; position:absolute; left:0; top:0; font-size:13px; font-weight:500; line-height:38px; color:#fff; text-align:center; background:rgba(0,0,0,0.4); }
#sub_01.body .article dl { margin-top:30px; }
#sub_01.body .article dl dt { font-size:20px; font-weight:700; color:#292c25; }
#sub_01.body .article dl dd { margin-top:12px; font-size:15px; line-height:150%; color:#666; }
#sub_01.body .article dl dd.info { margin-top:12px; font-size:14px; color:#888; }

</style>
<body>
	<div class="title">
		<h2 class="nsq">편의시설</h2>
		<p></p>
	</div>
		
	<div id="container">
        <div id="contents">
            <div id="sub_01" class="body">
                <div class="item_01">
                    <div class="title">
                        <h3><b>편의시설 안내</b></h3>
                    </div>
                    <div class="article">
                        <div class="img">
                            <p class="left"><img src="../image/FacilitiesImage/parking_01_01.jpg" /><span class="nts">인천방향(상행)</span></p>
                            <p class="right"><img src="../image/FacilitiesImage/parking_01_02.jpg" /><span class="nts">강릉방향(하행)</span></p>
                        </div>
                        <dl>
                            <dt>주차시설&nbsp;&nbsp;l&nbsp;&nbsp;Parking</dt>
                            <dd class="nts">덕평자연휴게소는 넓은 주차공간을 갖추고 있습니다. 인천방향(상행)은 551대, 강릉방향(하행)은 367대로 총 918대의 주차공간을 제공합니다.</dd>
                            <dd class="nts info"><!--- 장시간 주차 시, 장기주차장을 이용해주시기 바랍니다. <br />-->- 24시간 이상 주차 시, 고속도로 최장거리 이용요금이 부과됩니다. (도로공사에서 부과)</dd>
                        </dl>
						 <dl>
                            <dt>전기차 충전소&nbsp;&nbsp;l&nbsp;&nbsp;EV Charging Station</dt>
                            <dd class="nts">덕평자연휴게소 주차장에는 총 4대의 전기차 충전소가 있습니다.<br />인천방향(상행)은 1대, 강릉방향(하행)은 3대로 총 4대입니다.</dd>
                        </dl>
                    </div>
                </div>
                
                <!-- 
                ../Semi_img/information_center_01_01.jpg
                ../Semi_img/information_center_01_02.jpg
                ../Semi_img/nursing_room_01_01.jpg
                ../Semi_img/nursing_room_01_02.jpg
                ../Semi_img/store_01_01.jpg
                 -->
                
                
                
                <div class="item_02">
                    <ul>
                        <li class="left">
                            <div class="img">
                                <div class="slider slider_02">
                                    <ul>
                                        <li><img src="../image/FacilitiesImage/information_center_01_01.jpg"></li>
                                        <li><img src="../image/FacilitiesImage/information_center_01_02.jpg"></li>
                                    </ul>
                                    <a href="javascript:" class="btn_prev"></a>
                                    <a href="javascript:" class="btn_next"></a>
                                    <p class="bullet">
                                        <a class="on" href="javascript:"></a>
                                        <a href="javascript:"></a>
                                    </p>
                                </div>
                            </div>
                            <div class="txt">
                                <dl>
                                    <dt>종합안내소&nbsp;&nbsp;l&nbsp;&nbsp;Information Center</dt>
                                    <dd class="nts">상, 하행 모두 이용할 수 있는 안내소. 비즈니스 <br>서비스(FAX, 인터넷, 문자), 하이패스 충전, <br>교통정보 이용안내, 길안내, 전국 관광명소  <br>안내를 받으실 수 있습니다.</dd>
                                    <dd class="link"><a id="linkA3" class="btn_pop" data-bs-toggle="modal" data-bs-target="#myModal">위치보기</a></dd>
                                </dl>
                            </div>
                        </li>
                        <li class="right">
                            <div class="img">
                                <div class="slider slider_03">
                                    <ul>
                                        <li><img src="../image/FacilitiesImage/nursing_room_01_01.jpg"></li>
                                        <li><img src="../image/FacilitiesImage/nursing_room_01_02.jpg"></li>
                                    </ul>
                                    <a href="javascript:" class="btn_prev"></a>
                                    <a href="javascript:" class="btn_next"></a>
                                    <p class="bullet">
                                        <a class="on" href="javascript:"></a>
                                        <a href="javascript:"></a>
                                    </p>
                                </div>
                            </div>
                            <div class="txt">
                                <dl>
                                    <dt>수유실&nbsp;&nbsp;l&nbsp;&nbsp;Nursing Room</dt>
                                    <dd class="nts">모던하고 환경친화적인 소재를 사용한 인테리어로 꾸며져 <br>있습니다. (수유공간 2곳, 편의시설 완비)</dd>
                                    <dd class="link" id="linkA4"><a class="btn_pop" data-bs-toggle="modal" data-bs-target="#myModal">위치보기</a></dd>
                                </dl>
                            </div>
                        </li>
                        
                        
                        
                        <!-- ////////////////////////////////////////////// -->
                        <li class="left">
                            <div class="img">
                                <div class="slider slider_02">
                                    <ul>
                                        <li><img src="../image/FacilitiesImage/drugstore_01_01.jpg"></li>
                                        <li><img src=""></li>
                                    </ul>
                                    <a href="javascript:" class="btn_prev"></a>
                                    <a href="javascript:" class="btn_next"></a>
                                    <p class="bullet">
                                        <a class="on" href="javascript:"></a>
                                        <a href="javascript:"></a>
                                    </p>
                                </div>
                            </div>
                            <div class="txt">
                                <dl>
                                    <dt>약국&nbsp;&nbsp;l&nbsp;&nbsp;DrugStore</dt>
                                    <dd class="nts">덕평자연휴게소 내부에는 24시간 편의점과 약국이 자리잡고 <br />있습니다. 스낵류, 여행관련 소품 및 비상상비약이 준비되어 <br />있습니다.</dd>
                                    <dd class="link"><a id="linkA5" class="btn_pop" data-bs-toggle="modal" data-bs-target="#myModal">위치보기</a></dd>
                                </dl>
                            </div>
                        </li>
                        <li class="right">
                            <div class="img">
                                <div class="slider slider_04">
                                    <ul>
                                        <li><img src="../image/FacilitiesImage/store_01_01.jpg"></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="txt">
                                <dl>
                                    <dt>편의점&nbsp;&nbsp;l&nbsp;&nbsp;Store</dt>
                                    <dd class="nts">덕평자연휴게소 내부에는 24시간 편의점이 있습니다. 스낵류 뿐만 아니라, 여행 관련 소품, 즉석 조리 식품, 선물용 음료 등을 구매하실 수 있습니다.</dd>
                                    <!--<dd class="nts info">세계자연기금(WWF): 자연 보존과 회복을 위해 각국에서 협력하는 국제단체</dd>-->
                                    <dd class="link"><a id="linkA6" class="btn_pop" data-bs-toggle="modal" data-bs-target="#myModal">위치보기</a></dd>
                                </dl>
                            </div>
                        </li>
                       
                       <!-- success -->
                       <!-- ////////////////////////////////////////////// -->
                        
                        <li class="left">
                            <div class="img">
                                <div class="slider slider_02">
                                    <ul>
                                       <li><img src=""></li>
                                    </ul>
                                    <a href="javascript:" class="btn_prev"></a>
                                    <a href="javascript:" class="btn_next"></a>
                                    <p class="bullet">
                                        <a class="on" href="javascript:"></a>
                                        <a href="javascript:"></a>
                                    </p>
                                </div>
                            </div>
                            <div class="txt">
                                <dl>
                                    <dt>식당가&nbsp;&nbsp;l&nbsp;&nbsp;Restaurant Area</dt>
                                    <dd class="nts"></dd>
                                    <dd class="link"><a id="linkA7" class="btn_pop" href="#image-map">위치보기</a></dd>
                                </dl>
                            </div>
                        </li>
                        <li class="right">
                            <div class="img">
                                <div class="slider slider_04">
                                    <ul>
                                        <li><img src=""></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="txt">
                                <dl>
                                    <dt>주유소&nbsp;&nbsp;l&nbsp;&nbsp;Gas Station</dt>
                                    <dd class="nts"></dd>
                                    <dd class="link"><a id="linkA8" class="btn_pop" href="#image-map">위치보기</a></dd>
                                </dl>
                            </div>
                        </li>
                        
                    </ul> 
                </div>
        </div>
    </div>
	
	
	
	<!-- The Modal -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Modal Heading</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        Modal body..
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	
	
	<!-- <div class="Map">
		<img src="../image/FacilitiesImage/dpImage.jpg" alt="덕평자연휴게소 배치도" usemap="#plan01"/>
	    <div id="linkA1" class="shoppop shop1"></div>
	    <div id="linkA2" class="shoppop shop2"></div>
	    <div id="linkA3" class="shoppop shop3"></div>
	    <div id="linkA4" class="shoppop shop4"></div>
		<div id="linkA5" class="shoppop shop5"></div>
		<div id="linkA6" class="shoppop shop6"></div>
		<div id="linkA7" class="shoppop shop7"></div>
		<div id="linkA8" class="shoppop shop8"></div>
    </div>
    
     
     <map name="plan01" id="plan01" class="plan">
     		
            <area id="#linkA1" href="#" coords="426,567,11" shape="circle" class="blink blinking-area">
		    <area id="#linkA2" href="#" coords="254,489,13" shape="circle" class="blink blinking-area">
		    <area id="#linkA3" href="#" coords="494,626,11" shape="circle" class="blink blinking-area">
		    <area id="#linkA4" href="#" coords="270,599,29" shape="circle" class="blink blinking-area">
		    <area id="#linkA5" href="#" coords="445,249,12" shape="circle" class="blink blinking-area">
		    <area id="#linkA6" href="#" coords="363,519,51" shape="circle" class="blink blinking-area">
		    <area id="#linkA7" href="#" coords="56,602,83,610,69,684,38,684" shape="poly" class="blink blinking-area">
		    <area id="#linkA8" href="#" coords="48,512,74,514,84,594,58,596" shape="poly" class="blink blinking-area">
     </map> -->
	
</body>
</html>