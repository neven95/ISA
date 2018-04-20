app = angular.module('crudApp');

app.directive('myMap', function() {
    // directive link function
    var link = function($scope, $elem, $attr) {
        var map, infoWindow;
        var markers = [];
        
        // map config
        var mapOptions = {
            center: new google.maps.LatLng(50, 2),
            zoom: 4,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            scrollwheel: false
        };
        
        // init the map
        function initMap() {
            if (map === void 0) {
                map = new google.maps.Map($elem[0], mapOptions);
            }
        }    
        
        // place a marker
        function setMarker(map, lat, lon, title, content) {
            console.log("Set marker");
            console.log(lat);
            console.log(lon);
            var marker;
            var position = new google.maps.LatLng(parseFloat(lat), parseFloat(lon));
            var markerOptions = {
                position: position,
                map: map,
                title: title,
                icon: 'https://maps.google.com/mapfiles/ms/icons/green-dot.png'
            };

            marker = new google.maps.Marker(markerOptions);
            markers.push(marker); // add marker to array
            
            google.maps.event.addListener(marker, 'click', function () {
                // close window if not undefined
                if (infoWindow !== void 0) {
                    infoWindow.close();
                }
                // create new window
                var infoWindowOptions = {
                    content: content
                };
                infoWindow = new google.maps.InfoWindow(infoWindowOptions);
                infoWindow.open(map, marker);
            });
        }
        var clickedMap    = $attr.clickedMap;
        console.log(clickedMap);
        $attr.$observe('clickedMap', function(value) {
            console.log(value);
         });
        // show the map and place some markers
        initMap();
        //console.log(scope.clickedMap);
       /* if($scope.showMap){
         setMarker(map, $scope.longitude, $scope.latitude, 'London', 'Just some content');
        // setMarker(map, new google.maps.LatLng(52.370216, 4.895168), 'Amsterdam', 'More content');
        // setMarker(map, new google.maps.LatLng(48.856614, 2.352222), 'Paris', 'Text here');
        }*/
    };
    
    return {
        restrict: 'E',
        scope: {
            clickedMap: '@clickedMap',
           
          },
        template: '<div id="gmaps"></div>',
        replace: true,
        link: link
    };
});

