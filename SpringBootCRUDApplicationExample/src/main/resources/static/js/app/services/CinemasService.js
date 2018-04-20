'use-strict';

angular.module('crudApp').factory('CinemasService', 
    ['$localStorage', '$http', '$q', 'urls', '$state',
        function($localStorage, $http, $q, urls, $state) {

            var self = this;
            
            var cinemaFactoryMethods = {};

            cinemaFactoryMethods.initialCinemasCtrlData = function() {
                var cinemasList = $http.get(urls.CINEMAS_SERVICE_API)
                    .then(function(response) {
                        return response.data;
                    }, 
                        function(responseErr) {
                            console.log("Error occured while initializing list of all cinemas!");
                    });

                return $q.all([cinemasList])
                    .then(function(results) {
                        return { cinemasList: results[0] };
                    });

            }

            return cinemaFactoryMethods;
        }])