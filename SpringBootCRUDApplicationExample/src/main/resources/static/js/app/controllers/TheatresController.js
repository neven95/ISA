'use-strict';

angular.module('crudApp').controller('TheatresController', 
    ['$scope', '$state', 'initialData', 'TheatresService', 
        function($scope, $state, initialData, TheatresService) {
            var self = this;

            self.theatresList = initialData.theatresList;
         //   self.this = loadAllTheatres;
            function loadAllTheatres() {
                
                return TheatresService.loadAllTheatres();
             }
           // self.theatresList = TheatresService.loadAllTheatres();
            console.log("loaded theatres:******");
            console.log(self.theatresList);
            console.log("**************");
            
        }])