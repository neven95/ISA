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
    USER_SERVICE_API : 'http://localhost:8080/SpringBootCRUDApp/api/user/',
    CINEMAS_SERVICE_API : 'http://localhost:8080/SpringBootCRUDApp/cinemasApi/cinemas'
});
app.controller('baseController',['$scope','$state', function($scope, $state){
    $scope.open = function () {
        $scope.showModal = true;
    };
    
    $scope.ok = function () {
        $scope.showModal = false;
    };
    
    $scope.cancel = function () {
        $scope.showModal = false;
    };
    
}]);
/*app.config(['$stateProvider', '$urlRouterProvider',
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
            	controller: 'loginController'
            }).state('success',{
                url: '/success',
                templateUrl: 'partials/successMessage',
                controller: 'UserController',
                controllerAs: 'sCtrl'
            }).state('choice',{
                url: '/choice',
                templateUrl: 'partials/choice',
                controller: 'UserController',
                controllerAs: 'sCtrl'
            });
        $urlRouterProvider.otherwise('/');
    }]);*/

    app.config(['$stateProvider', '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {
        $stateProvider
        .state('guest-abstract', {
            abstract: true,
            views: {
                '@': { templateUrl: 'partials/toolbar' }
            }
        })
        .state('guest-abstract.home',{
            url: '/home',
            views: {
                'choosing': {
                  templateUrl: 'partials/home',
                  controller: 'choosingController',
                  controllerAs: 'chooseCtrl'
              }
            }
           
        })
        .state('guest-abstract.cinemas',{
            url: '/cinemas',
            views: {
                'cinemas': {
                  templateUrl: 'partials/cinemas',
                  controller: 'CinemasController',
                  controllerAs: 'cinemasCtrl1'
              }
            },
              resolve: {
                initialData: function(CinemasService){
                      
                      console.log(CinemasService.loadAllCinemas());
                      return CinemasService.loadAllCinemas();   
                  }
              }
        })
        .state('login',{
            url: '/login',
            templateUrl: 'partials/login',
            controller: 'loginController'
        })
        .state('registration',{
            url: '/registration',
            templateUrl: 'partials/register',
            controller: 'UserController',
            controllerAs: 'regCtrl'
        });
        $urlRouterProvider.otherwise('/home');
    }]);

    app.controller('choosingController',['$scope','$state', function($scope, $state){
        var self = this;
        self.toCinemas = toCinemas;
        function toCinemas() {
           $state.go('guest-abstract.cinemas');
        };
        
        
        
    }]);