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
            factoryMethods.initialFriendsSearchCtrlData = function(username, searchValue) {
                var friendsList = $http.get(urls.SEARCH_FRIENDS_SERVICE_API+searchValue)
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
            factoryMethods.addFriend = function (usersId, friendsId) {
                console.log('Adding friend with id '+friendsId);
                var deferred = $q.defer();
                $http.post(urls.ADDING_FRIEND_API+usersId+ "/" + friendsId)
                    .then(
                        function (response) {
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error(errResponse.data.errorMessage);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }
            factoryMethods.refuseFriendship = function(username, friendsId) {
                console.log('refusing friend with id '+friendsId);
                var deferred = $q.defer();
                $http.delete(urls.REFUSING_FRIEND_API+username+ "/" + friendsId)
                    .then(
                        function (response) {
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error(errResponse.data.errorMessage);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }
            factoryMethods.acceptFriendship = function(username, friendsId) {
                console.log('accepting friend with id '+friendsId);
                var deferred = $q.defer();
                $http.put(urls.ACCEPTING_FRIEND_API+username+ "/" + friendsId)
                    .then(
                        function (response) {
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error(errResponse.data.errorMessage);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }
            return factoryMethods;
        }]);