'use-strict';

angular.module('crudApp').controller('TheatresController', 
    ['$scope', '$state', 'initialData', 'TheatresService', 
        function($scope, $state, initialData, TheatresService) {
            var self = this;

            self.theatresList = initialData;
            self.this = loadAllTheatres;

            function loadAllTheatres() {
                TheatresService.loadAllTheatres();
            }
        }])