'use-strict';

angular.module('crudApp').controller('CinemasController', 
    ['$scope', '$state', 'initialData', 'CinemasService',
        function( $scope, $state, initialData, CinemasService) {
            var self = this;
            //self.provera = provera;
            //self.cinemasList = initialData;
            self.cinemasList = initialData.cinemasList;
            //self.cinemasList = initialData;
            //self.brojac = brojac;
            //brojac = 0;
            //console.log(cinemasList);
            self.provera = function() {
                console.log("CinemasController: function provera()");
            }

            /*function loadAllCinemas() {
                console.log(11);
                CinemasService.loadAllCinemas();
            }*/

            $scope.loc = { lat: 23, lon: 79 };

            $scope.gotoLocation = function (lat, lon) {
                if ($scope.lat != lat || $scope.lon != lon) {
                    $scope.loc = { lat: lat, lon: lon };
                    if (!$scope.$$phase) $scope.$apply("loc");
                }
            };

            // geo-coding
            $scope.search = "";
            $scope.geoCode = function () {
                if ($scope.search && $scope.search.length > 0) {
                    if (!this.geocoder) this.geocoder = new google.maps.Geocoder();
                    this.geocoder.geocode({ 'address': $scope.search }, function (results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            var loc = results[0].geometry.location;
                            $scope.search = results[0].formatted_address;
                            $scope.gotoLocation(loc.lat(), loc.lng());
                        } else {
                            alert("Sorry, this search produced no results.");
                        }
                    });
                }
            };

        }]);