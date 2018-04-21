angular.module('crudApp').controller('BaseController',['$state', '$rootScope', 'AuthenticationService', function($state, $rootScope, AuthenticationService){
    var self = this;

    self.logout = logout;
    self.search = search;
    self.searchValue='';
    function search(){
        if(self.searchValue==null || self.searchValue==''){
            return;
        }
        $state.go('guest-abstract.profile-abstract.profile-abstract-friends.friends-search', {username: $rootScope.globals.currentUser.username, searchValue: self.searchValue});
    }
    function logout(){
        console.log("Logout...")
        AuthenticationService.ClearCredentials();
        $state.go('guest-abstract.home');
    }

}]);