angular.module('crudApp').controller('BaseController',['$state', 'AuthenticationService', function($state, AuthenticationService){
    var self = this;

    self.logout = logout;

    function logout(){
        console.log("Logout...")
        AuthenticationService.ClearCredentials();
        $state.reload();
    }
}]);