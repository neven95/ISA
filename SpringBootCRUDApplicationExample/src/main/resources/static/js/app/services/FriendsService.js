'use-strict';

angular.module('crudApp').factory('FriendsService', 
    ['$http', '$q', 'urls', 
        function($http, $q, urls) {

            var factoryMethods = {};
            factoryMethods.initialFriendsCtrlData = function(username) {
                var friendsList = $http.get(urls.FRIENDS_SERVICE_API+username)
                    .then(function(response) {
                        return response.data;
                    }, function(error) {
                        console.log("Error occured while initializing list of all friends!");
                    });
    
                return $q.all([friendsList])
                    .then(function(results) {
                        return {   friendsList: results[0] };        
                    });
            }
            return factoryMethods;
        }]);