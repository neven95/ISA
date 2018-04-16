var app = angular.module('crudApp',['ui.router','ngStorage','registration-module', 'login-module',  'ngCookies']);

app.run(function($rootScope, $location, $http, $cookies, CinemasService, TheatresService) {

    $http.defaults.headers.get = { 'Content-type': 'application/json' };

    $rootScope.globals = $cookies.getObject('globals') || {};
    console.log($rootScope);
    if ($rootScope.globals.currentUser) {
        $http.defaults.headers.common['Authorization'] = 'Basic ' + $rootScope.globals.currentUser.authdata;
    }
 
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
    CINEMAS_SERVICE_API : 'http://localhost:8080/SpringBootCRUDApp/cinemasApi/cinemas',
    AUTHENTICATION_SERVICE_API : 'http://localhost:8080/SpringBootCRUDApp/api/authenticate/',
    THEATRES_SERVICE_API : 'http://localhost:8080/SpringBootCRUDApp/theatresApi/theatres',
});
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
                '@': { templateUrl: 'partials/toolbar',
                        controller: 'BaseController',
                        controllerAs: 'baseCtrl'
                }
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
                  controllerAs: 'cinemasCtrl'
              }
            },
              resolve: {
                initialData: function(CinemasService){
                      
                        //console.log(CinemasService.loadAllCinemas());
                      return CinemasService.loadAllCinemas(); 
                  }
              }
        })
        .state('guest-abstract.theatres',{
            url: '/theatres',
            resolve: {
                initialData: function(TheatresService){
                     // console.log(TheatresService);
                      return TheatresService.initialTheatresCtrlData();   
                  }
            },
            views: {
                'theatres': {
                  templateUrl: 'partials/theatres',
                  controller: 'TheatresController',
                  controllerAs: 'theatresCtrl'
              }
            }   
        })
        .state('success',{
            url: '/success',
            templateUrl: 'partials/successMessage',
            controller: 'UserController',
            controllerAs: 'sCtrl'
        })
        .state('badToken',{
            url: '/badToken',
            templateUrl: 'partials/badtoken',
           
        })
        .state('login',{
            url: '/login',
            templateUrl: 'partials/login',
            controller: 'LoginController',
            controllerAs: 'loginCtrl'
        })
        .state('registration',{
            url: '/registration',
            templateUrl: 'partials/registration',
            controller: 'UserController',
            controllerAs: 'regCtrl'
        })
        .state('guest-abstract.profile-abstract', {
            url: '/:username',
            abstract: true,
            views: {
                'profilePage': {
                  templateUrl: 'partials/profilePage'
                 // controller: 'ProfileController',
                 // controllerAs: 'profCtrl'
              }
            }   
        })
        .state('guest-abstract.profile-abstract.profile-informations', {
            url: '/informations',
            resolve: {
                initialData: ['$stateParams', 'UserService',function($stateParams, UserService){
                      return UserService.getUser($stateParams.username);   
                  }]
            },
            views: {
                'informations': {
                  templateUrl: 'partials/profileInformations',
                  controller: 'ProfileController',
                  controllerAs: 'profCtrl'
              }
            }  
        })
        .state('guest-abstract.profile-abstract.profile-friends', {
            url: '/friends',
            resolve: {
                initialData: ['$stateParams', 'UserService',function($stateParams, UserService){
                      return UserService.getUser($stateParams.username);   
                  }]
            },
            views: {
                'friends': {
                  template: '<strong>Ej drugovii</strong>',
                //  controller: 'ProfileController',
                //  controllerAs: 'profCtrl'
              }
            }  
        })
        .state('guest-abstract.profile-abstract.profile-settings', {
            url: '/settings',
            resolve: {
                initialData: ['$stateParams', 'UserService',function($stateParams, UserService){
                      return UserService.getUser($stateParams.username);   
                  }]
            },
            views: {
                'settings': {
                  templateUrl: 'partials/editProfile',
                  controller: 'ProfileController',
                  controllerAs: 'profCtrl'
              }
            }  
        })
        $urlRouterProvider.otherwise('/home');
    }]);
/*app.config(['$stateProvider', '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider){
        $stateProvider
        .state('user-abstract', {
            abstract: true,
            views: {
                '@': { 
                    templateUrl: 'partials/toolbar',
                    controller: BaseController,
                    controllerAs: baseUsrController
            }
            }
        })
        .state('user-abstract.', {

        });

}]);*/
    app.controller('choosingController',['$scope','$state', function($scope, $state){
        var self = this;
        self.toCinemas = toCinemas;
        self.toTheatres = toTheatres;

        function toCinemas() {
           $state.go('guest-abstract.cinemas');
        }

        function toTheatres() {
            $state.go('guest-abstract.theatres');
        }

    }]);