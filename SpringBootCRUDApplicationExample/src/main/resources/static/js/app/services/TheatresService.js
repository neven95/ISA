'use-strict';

angular.module('crudApp').factory('TheatresService', 
    ['$localStorage', '$http', '$q', 'urls', 
        function($localStorage, $http, $q, urls) {

            var factoryMethods = {};
            factoryMethods.initialTheatresCtrlData = function() {
                var theatresList = $http.get(urls.THEATRES_SERVICE_API)
                    .then(function(response) {
                        return response.data;
                    }, function(error) {
                        console.log("Error occured while initializing list of all theatres!");
                    });
    
                return $q.all([theatresList])
                    .then(function(results) {
                        return {   theatresList: results[0] };        
                    });
            }
            return factoryMethods;
            /*
            var factory = {
                loadAllTheatres: loadAllTheatres

            }

            return factory;

            function loadAllTheatres() {
                console.log("Fetching theatres...");

                $http.get(urls.THEATRES_SERVICE_API)
                    .then(
                        function(response) {
                            console.log(response.data);
                            console.log("Succesfully fetched all theatres...");
                            return response.data;
                    }, 
                        function(errResponse) {
                            console.error('Error while loading cinemas');
                            // deferred.reject(errResponse);
                            return errResponse;
                    }
                );
            }*/
        }]);