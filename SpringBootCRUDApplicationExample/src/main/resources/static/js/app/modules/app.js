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
    FRIENDS_SERVICE_API: 'http://localhost:8080/SpringBootCRUDApp/api/friendsList/',
    CINEMAS_SERVICE_API : 'http://localhost:8080/SpringBootCRUDApp/cinemasApi/cinemas',
    AUTHENTICATION_SERVICE_API : 'http://localhost:8080/SpringBootCRUDApp/api/authenticate/',
    THEATRES_SERVICE_API : 'http://localhost:8080/SpringBootCRUDApp/theatresApi/theatres',
    SEARCH_FRIENDS_SERVICE_API : 'http://localhost:8080/SpringBootCRUDApp/api/searchFriends/',
    ADDING_FRIEND_API: 'http://localhost:8080/SpringBootCRUDApp/api/addFriend/',
    REFUSING_FRIEND_API: 'http://localhost:8080/SpringBootCRUDApp/api/refuse/',
    ACCEPTING_FRIEND_API: 'http://localhost:8080/SpringBootCRUDApp/api/accept/',
    OBJECT_SERVICE_API : 'http://localhost:8080/SpringBootCRUDApp/theatresApi/registerObject'
});

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
            resolve: {
                initialData: function(CinemasService){
                      
                        //console.log(CinemasService.loadAllCinemas());
                      return CinemasService.initialCinemasCtrlData(); 
                  }
            },
            views: {
                'cinemas': {
                  templateUrl: 'partials/cinemas',
                  controller: 'CinemasController',
                  controllerAs: 'cinemasCtrl'
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
                 
              }
            }   
        })
        .state('guest-abstract.profile-abstract.profile-overview', {
            url: '/overview',
            resolve: {
                initialData: ['$stateParams', 'UserService',function($stateParams, UserService){
                      return UserService.getUser($stateParams.username);   
                  }]
            },
            views: {
                'overview': {
                  templateUrl: 'partials/profileOverview',
                  controller: 'ProfileController',
                  controllerAs: 'profCtrl'
              }
            }  
        })
        .state('guest-abstract.profile-abstract.profile-abstract-friends', {
            url: '/friends',
            abstract: true,
            views: {
                'friends': {
                  templateUrl: 'partials/friends',
                  controller: 'BaseController',
                  controllerAs: 'faCtrl'
              }
            }  
        })
        .state('guest-abstract.profile-abstract.profile-abstract-friends.friends-list', {
            url: '/friendsList',
            resolve: {
                initialData: ['$stateParams', 'FriendsService',function($stateParams, FriendsService){
                    console.log("Usao je u resolve");
                    return FriendsService.initialFriendsCtrlData($stateParams.username);   
                  }]
            },
            views: {
                'friendsList@guest-abstract.profile-abstract.profile-abstract-friends': {
                  templateUrl: 'partials/friendsList',
                  controller: 'FriendsController',
                  controllerAs: 'friendsCtrl'
              }
            }  
        })
        .state('guest-abstract.profile-abstract.profile-abstract-friends.friends-search', {
            url: '/friendsSearch',
            resolve: {
                initialData: ['$stateParams', 'FriendsService',function($stateParams, FriendsService){
                    console.log("Usao je u resolve");
                    console.log($stateParams.username+" " +$stateParams.searchValue);
                   // console.log(FriendsService.initialFriendsCtrlData($stateParams.username));
                    return FriendsService.initialFriendsSearchCtrlData($stateParams.username, $stateParams.searchValue);   
                  }],
                  usersInitialData:  ['$stateParams', 'UserService',function($stateParams, UserService){
                    console.log("Usao je u usersInitialData resolve");
                    console.log($stateParams.username+" " +$stateParams.searchValue);
                   // console.log(FriendsService.initialFriendsCtrlData($stateParams.username));
                    return UserService.getUser($stateParams.username);   
                  }]
            },
            views: {
                'friendsSearch': {
                  templateUrl: 'partials/friendsSearch',
                  controller: 'FriendsSearchController',
                  controllerAs: 'searchCtrl'
              }

            },
            params: {
                searchValue:null
            }    
        })
        .state('guest-abstract.settings-abstract', {
            url: '/settings',
            abstract: true,
            views: {
                'settingsPage': {
                  templateUrl: 'partials/settingsPage'
                 
              }
            }   
        })
        .state('guest-abstract.settings-abstract.general', {
            url: '/general',
            resolve: {
                initialData: ['$stateParams', 'UserService',function($stateParams, UserService){
                      return UserService.getUser($stateParams.username);   
                  }]
            },
            views: {
                'general': {
                  templateUrl: 'partials/generalSettings',
                  controller: 'ProfileController',
                  controllerAs: 'settingsCtrl'
              }
            },
            params: {
                username:null
            }  
        })
        .state('guest-abstract.settings-abstract.security', {
            url: '/security',
            resolve: {
                initialData: ['$stateParams', 'UserService',function($stateParams, UserService){
                      return UserService.getUser($stateParams.username);   
                  }]
            },
            views: {
                'general': {
                  templateUrl: 'partials/securitySettings',
                  controller: 'ProfileController',
                  controllerAs: 'securityCtrl'
              }
            },
            params: {
                username: null
            }  
        })

        .state('guest-abstract.reserve',{
            url: '/reserve',
            views: {
                
              'reserve': { templateUrl: 'partials/reserve',
                controller: 'ReserveController',
                controllerAs: 'friendsCtrl'
            }
            }
        })

        .state('guest-abstract.profile-abstract.profile-usersList', {
            url: '/usersList',
            resolve: {
                initialData: ['UserService', function(UserService){
                      return UserService.loadAllUsers();
                  }]
            },
            views:{
                'usersList': {
                    templateUrl: "partials/usersList",
                    controller: "usersListController",
                    controllerAs: "usersCtrl"
                }
            }
        })
        .state('guest-abstract.registerObject', {
            url: '/registerObject',
            resolve: {
                initialData: ['UserService', function(UserService){
                      return UserService.loadAllUsers();
                  }]
            },
            views: {
                'registerObject': {
                    templateUrl: "partials/registerCinema",
                    controller: "usersListController",
                    controllerAs: "regUsersCtrl"
                }
            }
        });
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