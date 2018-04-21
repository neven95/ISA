'use-strict';

angular.module('crudApp').controller('FriendsController', 
    ['$scope', '$state', 'initialData', 'FriendsService',
        function($scope, $state, initialData, FriendsService) {
            var self = this;
            console.log(initialData);
            self.friendsList = initialData.friendsList;
            self.deleteFriend = deleteFriend;

            function deleteFriend(username, friendsId){
                FriendsService.refuseFriendship(username, friendsId)
                .then(
                    function(response){
                        FriendsService.initialFriendsCtrlData(username)
                        .then(
                            function(response){
                                self.friendsList = response.friendsList;
                            },
                            function(errResponse){
        
                            }
                        );
                    },
                    function(errResponse){
        
                    }
                );
            }
           
            console.log("loaded friends:******");
            console.log("prvi clan");
            console.log(self.friendsList);
            console.log("**************");
            console.log("friendsOf");
         //   console.log(self.friendsList[0].friendsOf[0].friends);
        }]);