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
            self.showMarker = false;
            self.clickedCinema = null;
            self.enableMarker = function(cinema){
                self.showMarker = true;
                self.clickedCinema = cinema;
            }
            /*function loadAllCinemas() {
                console.log(11);
                CinemasService.loadAllCinemas();
            }*/

            self.loc = { lat: 23, lon: 79 };

            self.gotoLocation = function (lat, lon) {
                if ($self.lat != lat || self.lon != lon) {
                    $self.loc = { lat: lat, lon: lon };
                    if (!self.$$phase) self.$apply("loc");
                }
            };

            // geo-coding
            self.search = "";
            self.geoCode = function (latitude, longitude) {
                self.lat = latitude;
                self.lon = longitude;
                console.log(self.lat);
                console.log(self.lon);
                console.log("Ispisi nesto");
                if (self.search && self.search.length > 0) {
                    if (!this.geocoder) this.geocoder = new google.maps.Geocoder();
                    this.geocoder.geocode({ 'address': self.search }, function (results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            var loc = results[0].geometry.location;
                            self.search = results[0].formatted_address;
                            self.gotoLocation(loc.lat(), loc.lng());
                        } else {
                            alert("Sorry, this search produced no results.");
                        }
                    });
                }
            };

        }]);