<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우동 | 내 위치</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<style>
	    .map_wrap {position:relative;width:100%;height:350px;}
	    .title {font-weight:bold;display:block;}
	    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
	    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
	    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	</style>
</head>
<body">
	<jsp:include page="../../top.jsp"></jsp:include>
	<br><br><br><br><br>
	<div class="container" style="height: 650px; background-color:#95c4de; ">
		<br>
		<div class="map_wrap">
		    <div id="map" style="width:100%;height:600px;position:relative;overflow:hidden;"></div>
		    <div class="hAddr">
		        <span class="title">지도중심기준 행정동 주소정보</span>
		        <span id="centerAddr"></span>
	    	</div>
		</div>
		<!-- 
		<div id="map" style="width:500px;height:400px;"></div>
		 -->
	</div>
	<!-- kaka map library -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37fbf7425a9a292b0593b520f7bee3ed&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript">
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 6 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        var lat = position.coords.latitude, // 위도
		        lon = position.coords.longitude; // 경도
		        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		            message = '<div style="padding:5px;">현재위치 입니다.</div>'; // 인포윈도우에 표시될 내용입니다
		            //console.log(lat+" "+lon);
		        // 마커와 인포윈도우를 표시합니다
		        displayMarker(locPosition, message);
		            
		    	 // 지도에 원을 표시한다
				var circle = new kakao.maps.Circle({
					map: map, // 원을 표시할 지도 객체
					center : new kakao.maps.LatLng(lat, lon), // 지도의 중심 좌표
					radius : 1000, // 원의 반지름 (단위 : m)
					fillColor: '#8c7df7', // 채움 색
					fillOpacity: 0.5, // 채움 불투명도
					strokeWeight: 3, // 선의 두께
					strokeColor: '#8c7df7', // 선 색
					strokeOpacity: 0.9, // 선 투명도 
					strokeStyle: 'solid' // 선 스타일
				});
				/* searchDetailAddrFromCoords(locPosition, function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {
			            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
			            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
			            
			            var content = '<div class="bAddr">' +
			                            '<span class="title">법정동 주소정보</span>' + 
			                            detailAddr + 
			                        '</div>';

			            // 마커를 클릭한 위치에 표시합니다 
			            marker.setPosition(mouseEvent.latLng);
			            marker.setMap(map);

			            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
			            infowindow.setContent(content);
			            infowindow.open(map, marker);
			        }   
			    }); */
		      });
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			console.log("b");
		    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
		        message = 'geolocation을 사용할수 없어요..'
		        
		    displayMarker(locPosition, message);
		}
		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {

		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({  
		        map: map, 
		        position: locPosition
		    }); 
		    
		    var iwContent = message, // 인포윈도우에 표시할 내용
		        iwRemoveable = true;

		    // 인포윈도우를 생성합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        content : iwContent,
		        removable : iwRemoveable
		    });
		    
		    // 인포윈도우를 마커위에 표시합니다 
		    infowindow.open(map, marker);
		    
		    // 지도 중심좌표를 접속위치로 변경합니다
		    map.setCenter(locPosition);      
		}
		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
		    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});
		function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}
		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        var infoDiv = document.getElementById('centerAddr');

		        for(var i = 0; i < result.length; i++) {
		            // 행정동의 region_type 값은 'H' 이므로
		            if (result[i].region_type === 'H') {
		                infoDiv.innerHTML = result[i].address_name;
		                break;
		            }
		        }
		    }    
		}
	
	</script>
</body>
</html>