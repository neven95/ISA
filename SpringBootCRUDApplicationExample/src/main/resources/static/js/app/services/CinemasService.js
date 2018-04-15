'use-strict';

angular.module('crudApp').factory('CinemasService', 
    ['$localStorage', '$http', '$q', 'urls', 
        function($localStorage, $http, $q, urls) {

            var self = this;
           // self.loadAllCinemas = loadAllCinemas;

            var factory = {};

            factory.loadAllCinemas = function() {
                console.log("Fetching cinemas...");

                $http.get(urls.CINEMAS_SERVICE_API)
                    .then(
                        function(response) {
                            console.log('Fetched successfully all cinemas');
                            console.log(response.data);
                            return response.data;
                        }, 
                        function(errResponse) {
                            console.error('Error while loading cinemas');
                            //deferred.reject(errResponse);
                            return errResponse;
                        }
                    );
            }

            return factory;
        }])