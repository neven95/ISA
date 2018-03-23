var app = angular.module('crudApp',['ui.router','ngStorage','registration-module', 'login-module']);

app.run(function($rootScope, $http) {

    $http.defaults.headers.get = { 'Content-type': 'application/json' };

 
    $rootScope.$on('$stateChangeStart', function(evt, toState, toParams, fromState, fromParams) {
        console.log("$stateChangeStart " + fromState.name + JSON.stringify(fromParams) + " -> " + toState.name + JSON.stringify(toParams));
    });
    $rootScope.$on('$stateChangeSuccess', function() {
        console.log("$stateChangeSuccess " + fromState.name + JSON.stringify(fromParams) + " -> " + toState.name + JSON.stringify(toParams));
    });
    $rootScope.$on('$stateChangeError', function() {
        console.log("$stateChangeError " + fromState.name + JSON.stringify(fromParams) + " -> " + toState.name + JSON.stringify(toParams));
    });
});
app.constant('urls', {
    BASE: 'http://localhost:8080/SpringBootCRUDApp',
    USER_SERVICE_API : 'http://localhost:8080/SpringBootCRUDApp/api/user/'
});
app.controller('baseController',['$scope', function($scope){
    
}]);
app.config(['$stateProvider', '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('home', {
                url: '/',
                templateUrl: 'partials/toolbar',
                controller:'baseController',
                controllerAs:'ctrl',
                resolve: {
                    users: function ($q, UserService) {
                        console.log('Load all users');
                        var deferred = $q.defer();
                        UserService.loadAllUsers().then(deferred.resolve, deferred.resolve);
                        return deferred.promise;
                    }
            }
            }).state('registration',{
            	url: '/registration',
            	templateUrl: 'partials/register',
            	controller: 'UserController',
            	controllerAs: 'regCtrl'
            }).state('login',{
            	url: '/login',
            	templateUrl: 'partials/login',
            	controller: 'loginController',
            	
            });
        $urlRouterProvider.otherwise('/');
    }]);

