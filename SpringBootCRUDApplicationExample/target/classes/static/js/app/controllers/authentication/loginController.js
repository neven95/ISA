(function () {
    'use strict';
 
    angular
        .module('crudApp')
        .controller('LoginController', LoginController);
 
    LoginController.$inject = ['AuthenticationService', '$state'];
    function LoginController(AuthenticationService, $state) {
        var vm = this;
        
        vm.login = login;
 
        (function initController() {
            // reset login status
            AuthenticationService.ClearCredentials();
        })();
 
        function login() {
            vm.dataLoading = true;
            AuthenticationService.Login(vm.username, vm.password, function (response) {
                if (response.status == 200) {
                    console.log('trebalo bi ovde da udje');
                    console.log(response);
                    console.log("a ovo je data od response");
                    console.log(response.data);
                    AuthenticationService.SetCredentials(vm.username, vm.password, response.data);
                    
                   $state.go('guest-abstract.home');
                } else {
                    console.log('Ovo je poruka o gresci ' + response.data.errorMessage);
                    vm.errorMessage = response.data.errorMessage;
                    vm.dataLoading = false;
                }
            });
        };
    }

})();