'use strict';

angular.module('crudApp').controller('SuccessController',
    ['$scope','$state',   function($scope, $state) {
        var a = 1;
        (function(){    
        console.log("Usao je u kontroler");  
        })();
        function toLogin(){
            console.log("Usao je u kontroler");
            $state.go('login');
        }
        
    }]);