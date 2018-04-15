'use-strict';

angular.module('crudApp').controller('CinemasController', 
    ['$scope', '$state', 'initialData', 'CinemasService',
        function( $scope, $state, CinemasService) {
            var self = this;
            //self.provera = provera;
            //self.cinemasList = initialData;
            self.loadAllCinemas = loadAllCinemas;
            //self.cinemasList = initialData;
            //self.brojac = brojac;
            //brojac = 0;
            //console.log(cinemasList);
            self.provera = function() {
                console.log("CinemasController: function provera()");
            }

            function loadAllCinemas() {
                console.log(11);
                CinemasService.loadAllCinemas();
            }

        }]);