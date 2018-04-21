var app = angular.module("crudApp");

app.factory('objectService', 
    ['$localStorage', '$http', '$q', 'urls',
        function($localStorage, $http, $q, urls) {
            var factory = {
                loadAllObjects: loadAllObjects,
                getAllObjects: getAllObjects,
                getObject: getObject,
                createObject: createObject,
                updateObject: updateObject,
                removeObject: removeObject
            };

            return factory;

            function loadAllObjects() {
                console.log('Fetching all objects');
                var deferred = $q.defer();
                var objectsList = $http.get(urls.OBJECT_SERVICE_API)
                    .then(
                        function (response) {
                            console.log('Fetched successfully all objects');
                            $localStorage.objects = response.data;
                            deferred.resolve(response);
                          // return response.data;
                        },
                        function (errResponse) {
                            console.error('Error while loading objects');
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
                /*return $q.all([usersList])
                    .then(function(results) {
                        return { usersList: results[0] };
                    });*/
            }

            function getAllObjects(){
                return $localStorage.objects;
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
            function getObject (id) {
                var objectData = $http.get(urls.OBJECT_SERVICE_API + id)
                    .then(function(response) {
                        return response.data;
                    }, function(error) {
                        console.log("Error occured while initializing object data!");
                    });
    
                return $q.all([objectData])
                    .then(function(results) {
                        return {   objectData: results[0] };        
            });
        }
            function createObject(object) {
                console.log('Creating object');
                console.log(object);
                var deferred = $q.defer();
                $http.post(urls.OBJECT_SERVICE_API, object)
                    .then(
                        function (response) {
                            loadAllObjects();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                           console.error('Error while creating object : '+errResponse.data.errorMessage);
                           deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function updateObject(object, id) {
                console.log('Updating object with id '+id);
                var deferred = $q.defer();
                $http.put(urls.OBJECT_SERVICE_API + id, object)
                    .then(
                        function (response) {
                            loadAllObjectss();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error(errResponse.data.errorMessage);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function removeObject(id) {
                console.log('Removing object with id '+id);
                var deferred = $q.defer();
                $http.delete(urls.OBJECT_SERVICE_API + id)
                    .then(
                        function (response) {
                            loadAllObjects();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error('Error while removing object with id :'+id);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

    }]);