'use-strict';

angular.module('crudApp').factory('TheatresService', 
    ['$localStorage', '$http', '$q', 'urls', 
        function($localStorage, $http, $q, urls) {

            var factoryMethods = {};
            factoryMethods.initialTheatresCtrlData = function() {
                var theatresList = $http.get(urls.THEATRES_SERVICE_API)
                    .then(function(response) {
                        console.log("Theatres response", response.data);
                        return response.data;
                    }, function(error) {
                        console.log("Error occured while initializing list of all theatres!");
                    });
    
                return $q.all([theatresList])
                    .then(function(results) {
                        return {   culturalObjectList: results[0] };        
                    });
            }
            return factoryMethods;
        }]);