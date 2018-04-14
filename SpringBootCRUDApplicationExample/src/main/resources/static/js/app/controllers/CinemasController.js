'use-strict';

angular.module('crudApp').controller('CinemasController', 
    ['$scope', '$state', 'initialData', 'CinemasService',
        function( $scope, $state, initialData, CinemasService) {
            var self = this;
            //self.provera = provera;
            self.cinemasList = initialData;
            self.loadAllCinemas = loadAllCinemas;
            console.log(initialData);
            self.provera = function() {
                console.log("CinemasController: function provera()");
            }

            function loadAllCinemas() {
                CinemasService.loadAllCinemas();
            }

        }]);