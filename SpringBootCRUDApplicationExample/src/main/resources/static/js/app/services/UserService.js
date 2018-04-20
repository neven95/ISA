'use strict';

angular.module('crudApp').factory('UserService',
    ['$localStorage', '$http', '$q', 'urls',
        function ($localStorage, $http, $q, urls) {

            var factory = {
                loadAllUsers: loadAllUsers,
                getAllUsers: getAllUsers,
                getUser: getUser,
                createUser: createUser,
                updateUser: updateUser,
                removeUser: removeUser,
                getUserByUsername: getUserByUsername
            };

            return factory;

            function loadAllUsers() {
                console.log('Fetching all users');
                var deferred = $q.defer();
                var usersList = $http.get(urls.USER_SERVICE_API)
                    .then(
                        function (response) {
                            console.log('Fetched successfully all users');
                            $localStorage.users = response.data;
                            deferred.resolve(response);
                          // return response.data;
                        },
                        function (errResponse) {
                            console.error('Error while loading users');
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
                /*return $q.all([usersList])
                    .then(function(results) {
                        return { usersList: results[0] };
                    });*/
            }

            function getAllUsers(){
                return $localStorage.users;
            }

          /*  function getUser(id) {
                console.log('Fetching User with id :'+id);
                var deferred = $q.defer();
                $http.get(urls.USER_SERVICE_API + id)
                    .then(
                        function (response) {
                            console.log('Fetched successfully User with id :'+id);
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error('Error while loading user with id :'+id);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }*/
            function getUser (id) {
                var userData = $http.get(urls.USER_SERVICE_API + id)
                    .then(function(response) {
                        return response.data;
                    }, function(error) {
                        console.log("Error occured while initializing user data!");
                    });
    
                return $q.all([userData])
                    .then(function(results) {
                        return {   userData: results[0] };        
                });
            }

            function getUserByUsername (username) {
                var userData = $http.get(urls.USER_SERVICE_API + username)
                    .then(function(response) {
                        return response.data;
                    }, function(error) {
                        console.log("Error occured while initializing user data!");
                    });

                return $q.all([userData])
                    .then(function(results) {
                        return {   userData: results[0] };        
                });
            }
            function createUser(user) {
                console.log('Creating User');
                console.log(user);
                var deferred = $q.defer();
                $http.post(urls.USER_SERVICE_API, user)
                    .then(
                        function (response) {
                            loadAllUsers();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                           console.error('Error while creating User : '+errResponse.data.errorMessage);
                           deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function updateUser(user, id) {
                console.log('Updating User with id '+id);
                var deferred = $q.defer();
                $http.put(urls.USER_SERVICE_API + id, user)
                    .then(
                        function (response) {
                            loadAllUsers();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error(errResponse.data.errorMessage);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function removeUser(id) {
                console.log('Removing User with id '+id);
                var deferred = $q.defer();
                $http.delete(urls.USER_SERVICE_API + id)
                    .then(
                        function (response) {
                            loadAllUsers();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error('Error while removing User with id :'+id);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

        }
    ]);