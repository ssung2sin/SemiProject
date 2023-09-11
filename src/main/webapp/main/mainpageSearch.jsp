<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Audiowide&family=Hi+Melody&family=Itim&family=Nanum+Pen+Script&family=Rock+Salt&family=Wallpoet&display=swap" rel="stylesheet">
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ddc717c4e4cd5fed053858415435334"></script>

<title>Insert title here</title>
<style type="text/css">
body{
	margin:0;
	padding:0;	
	background-image: url("image/hgsimage.jpg") ;
	background-repeat:no-repeat;
  	background-position:left top;
  	background-size: 1930px 963px;
    background-attachment: scroll;
    height: 2000px;
}

body::-webkit-scrollbar {
    width: 20px;
  }
  
body::-webkit-scrollbar-thumb {
    background-color: khaki;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }

body::-webkit-scrollbar-track {
    background-color: ivory;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }

.container:before{
	content:'';
	position: absolute;
 	width: 100%;
	height:2000px;
	left:0;
	top:0;
	background-color:rgba(0,0,0,0.7);
}

.container h5{
	color:white;
	position:absolute;
	right:20px;
	top:20px;
	font-size: 20px;
}
div.ex-regibox{
	width: 500px;
	position:absolute;
	top:50%;
	left:35%;
	transform:translate(-50%,-50%);
	color: #fff;
	z-index:2;
}
div.shop-regibox{
	width: 500px;
	position:absolute;
	top:50%;
	left:35%;
	transform:translate(-50%,-50%);
	color: #fff;
}
div.loginbox{
	width: 500px;
	position:absolute;
	top:50%;
	left:35%;
	transform:translate(-50%,-50%);
	color: #fff;

}
div.user-regibox{
	width: 500px;
	position:absolute;
	top:50%;
	left:35%;
	transform:translate(-50%,-50%);
	color: #fff;
}

.container2 {
	background-image:url("image/yellowbackground.jpg");
	background-size:1930px 1200px;
	background-repeat:no-repeat;
	position: relative;
	top:903px;
	height: 1100px;
}

.container2_intro{
	position: absolute;
	top: 400px;
	left: 600px;
}
.container h5 span{
	cursor: pointer;
	margin-right: 20px;
}

form.box{

	width: 500px;
	position:absolute;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
	color: #fff;
	text-align: center;
}

form.box h1{
	font-weight:normal;
}

form.box input{
	border:none;
}

.textchang{
	background-color: #fff;
	width: 340px;
	padding: 10px;
	border-radius: 25px 0 0 25px;
}

.searchbtn{
	width:130px;
	background-color: orange;
	padding: 10px;
	border-radius: 0 25px 25px 0;
	color:#fff;
	margin-left: -6px;
}

form.box input[type=text]:placeholder{
	color:gray;
}

#mouse div{
	width: 30px;
	height: 60px;
	border: 3px solid #fff;
	border-radius: 10px 10px 15px 15px;
	margin: 5vw auto 1vw;
	position: relative;
	top:800px;
	margin: auto;
}

#mouse div span{
	width: 6px;
	height: 6px;
	border-radius: 50%;
	background-color: #fff;
	position: absolute;
	top: 10px;
	left: 10px;
	text-indent: -9999px;
	animation: wheel 1s ease-out infinite;
}

@keyframes wheel{
	0%{
		top:10px;
		opacity: 1;
	}
	100%{
		top:30px;
		opacity:0;
	}
}
#map{

	position: absolute;
    border-radius:40px;
	margin-left: 32%;
	margin-top: 8%;
      width: 650px;
      height: 800px;
 
   }
   

#map.input{
	align-self: center;
	
}

</style>
<script type="text/javascript">
	
$(function(){
    $("#map").hide();
 	$("div.ex-regibox").hide();
 	$("div.shop-regibox").hide();
 	$("div.user-regibox").hide();
 	$("div.loginbox").hide();
    
    /* $(function setmap(){
       $("#map").show();
    }); */
    $("#dpbtn").click(function(){
    	
    	location.href="dpecoland.jsp";
    });
    
    $("#ex-register").click(function(){
    	
        $("div.ex-regibox").show();
        $("div.shop-regibox").hide();
     	$("div.user-regibox").hide();
     	$("div.loginbox").hide();
    });
 	$("#shop-register").click(function(){
    	
        $("div.shop-regibox").show();
        $("div.ex-regibox").hide();
     	$("div.user-regibox").hide();
     	$("div.loginbox").hide();
    });
 	$("#u-register").click(function(){
 	
    	$("div.user-regibox").show();
    	$("div.ex-regibox").hide();
     	$("div.shop-regibox").hide();
     	$("div.loginbox").hide();
	});
 	$("#login").click(function(){
 	 	
    	$("div.user-regibox").hide();
    	$("div.ex-regibox").hide();
     	$("div.shop-regibox").hide();
     	$("div.loginbox").show();
	});
    $("#dpbtn").click(function(){
    	
    	location.href="dpecoland.jsp";
    });

 });

 
 function setmap(){
    $("#map").toggle();
 }
 

</script>
</head>

<body>
<div class="ma">
	<section class="container">
		<h5><span id="login">로그인</span>
		<span id="ex-register">휴게소사업자 회원가입</span><span id="shop-register">가게 회원가입</span><span id="u-register">유저 회원가입</span><span id="mypage">마이페이지</span><span id="admin">관리자</span></h5>
		<h1 style="font-family:Wallpoet; font-size: 5em; color:gold; position: absolute; top:10px; left:40px;">HG</h1>
		<form class="box" style="align: center;">
			<h1>What are you looking for?</h1><br>
			<input type="text" class="textchang" id="hgs" placeholder="휴게소명을 입력하세요">
			<input type="button" class="searchbtn" value="Search" onclick="setmap()"><br><br><br>
			<button type="button" class="btn btn-outline-info" id="dpbtn">덕평휴게소로 이동</button>
		</form>
	</section>
		<div class="loginbox">
			<jsp:include page="../userLogin/userLoginForm.jsp"/>	
		</div>
		<div class="ex-regibox">
			<jsp:include page="../businessRegistration/expressRForm.jsp"/>	
		</div>
		<div class="shop-regibox">
			<jsp:include page="../businessRegistration/shopRForm.jsp"/>	
		</div>
		<div class="user-regibox">
			<jsp:include page="../userRegistration/userRForm.jsp"/>	
		</div>
		
	<div id="map"></div>
	<div id="mouse">
		<div><span>wheel</span></div>
	</div>
	<section class="container2">
		<div class="container2_intro">
			<h1>HG 사이트 소개</h1>
			<h5>HG는 휴게소 이용 고객님의 편의를 위한 서비스 사이트입니다.
		많은 이용 부탁드립니다.</h5>
		</div>
	</section>
</div>

 <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new kakao.maps.LatLng(36.41960, 127.84205), // 지도의 중심좌표
         level : 13,      // 지도의 확대 레벨
      
         disableDoubleClickZoom: true  //지도더블클릭확대 막기
         
      };

      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


      // 마우스 드래그와 모바일 터치를 이용한 지도 이동을 막는다
      //map.setDraggable(false);      

      // 마우스 휠과 모바일 터치를 이용한 지도 확대, 축소를 막는다
      map.setZoomable(false); 
      
      
      function setback() {
         
         
         var moveLatLon = new kakao.maps.LatLng(36.41960, 127.84205);
         map.setLevel(13);
         
         map.panTo(moveLatLon); 
      }

      function setgido() {
         var moveLatLon = new kakao.maps.LatLng(36.41960, 127.84205);
         map.setLevel(4);
         
         map.panTo(moveLatLon); 
      }

      // 마커를 표시할 위치와 title 객체 배열입니다 
      var positions = [
          {
              title: '서울특별시청',
              content: '<div><img style="width:100px;"src="../down/1.jpg"><br><b>서울특별시청</b></div>',
              latlng: new kakao.maps.LatLng(37.56542, 126.97904)
          },
          {
              title: '생태연못', 
              content: '<div>생태연못</div>',
              latlng: new kakao.maps.LatLng(33.450936, 126.569477)
          },
          {
              title: '텃밭', 
              content: '<div>텃밭</div>',
              latlng: new kakao.maps.LatLng(33.450879, 126.569940)
          },
          {
              title: '근린공원',
              content: '<div>근린공원</div>',
              latlng: new kakao.maps.LatLng(33.451393, 126.570738)
          },
          {
             title: '',
             content: '',
             latlng: new kakao.maps.LatLng()
          },
          {
             title: '',
             content: '',
             latlng: new kakao.maps.LatLng()
          }
      ];

      // 마커 이미지의 이미지 주소입니다
      var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
          
      for (var i = 0; i < positions.length; i++) {
          
          // 마커 이미지의 이미지 크기 입니다
          var imageSize = new kakao.maps.Size(24, 35); 
          
          // 마커 이미지를 생성합니다    
          var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
          
          // 마커를 생성합니다
          var marker = new kakao.maps.Marker({
              map: map, // 마커를 표시할 지도
              position: positions[i].latlng, // 마커를 표시할 위치
              title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
              image : markerImage // 마커 이미지 
           
          });
          
          var infowindow = new kakao.maps.InfoWindow({
              content: positions[i].content // 인포윈도우에 표시할 내용
          });
          
          kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
          kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
          kakao.maps.event.addListener(marker, 'click', function () {       
              //map.setLevel(4, {anchor: this.getPosition()});
                document.getElementById('maplevel');//맵 레벨 읽어오기
              //alert(map.getLevel());
              var ml=map.getLevel();//선언 안하면 데이터 타입 알수없어 if문 작동안함
              if(ml=='4'){
                 
                      //alert("if문 성공");
                    //location.href='index.jsp?main =board/supage.jsp';
                 location.href='index2.jsp/board/supage.jsp?id=';
             }
              
              map.setLevel(4);
              
            map.panTo(this.getPosition()); 
         });
          
          
        
      }
      
      
      // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
      function makeOverListener(map, marker, infowindow) {
          return function() {
              infowindow.open(map, marker);
          };
      }

      // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
      function makeOutListener(infowindow) {
          return function() {
              infowindow.close();
          };
      }
      
      
      
   </script>
  <button type="button" onclick="setmap()">지도오픈</button>
   <button type="button" onclick="setback()">지도초기화</button>
   <button type="button" onclick="setgido()">지도이동</button>

</body>
</html>