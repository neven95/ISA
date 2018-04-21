'use-strict';

angular.module('crudApp').controller('FriendsController', 
    ['$scope', '$state', 'initialData', 
        function($scope, $state, initialData) {
            var self = this;
            
            self.friendsList = initialData.friendsList;
            console.log("loaded friends:******");
            console.log(self.friendsList);
            console.log("**************");
            
        }]);