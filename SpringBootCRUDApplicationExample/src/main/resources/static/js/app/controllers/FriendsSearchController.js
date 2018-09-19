angular.module('crudApp').controller('FriendsSearchController',['$state', '$rootScope', 'initialData','usersInitialData','AuthenticationService','FriendsService',
 'UserService',function($state, $rootScope, initialData,usersInitialData, AuthenticationService, FriendsService,UserService){
    var self = this;

    self.searchResults = initialData.friendsList;
    self.userData = usersInitialData.userData;
    self.addFriend = addFriend;
    self.refuse = refuse;
    self.accept = accept;
    self.showAdd = showAdd;
    self.searchValue='';
    console.log(self.searchResults);
    console.log("**************");
    console.log(self.userData);
    function addFriend(usersId, friendsId){
        FriendsService.addFriend(usersId, friendsId)
        .then(
            function(response){
                UserService.getUser($rootScope.globals.currentUser.username)
                .then(
                    function(response){
                        self.userData = response.userData;
                    },
                    function(errResponse){

                    }
                );
            },
            function(errResponse){

            }
        );
    
    }
    function refuse(username, friendsId){
        FriendsService.refuseFriendship(username, friendsId)
        .then(
            function(response){
                UserService.getUser($rootScope.globals.currentUser.username)
                .then(
                    function(response){
                        self.userData = response.userData;
                    },
                    function(errResponse){

                    }
                );
            },
            function(errResponse){

            }
        );
    }
    function accept(username, friendsId){
        FriendsService.acceptFriendship(username, friendsId)
        .then(
            function(response){
                UserService.getUser($rootScope.globals.currentUser.username)
                .then(
                    function(response){
                        self.userData = response.userData;
                    },
                    function(errResponse){

                    }
                );
            },
            function(errResponse){

            }
        );
    }
    function showAdd(friendsId){
        for(var i =0; i<self.userData.friends.length; i++){
            if((self.userData.friends[i].friendsKey == friendsId) && self.userData.friends[i].sent === "requested"){
                return 1;
            }else if((self.userData.friends[i].friendsKey == friendsId) && self.userData.friends[i].sent === "received"){
                return 2;
            }else if((self.userData.friends[i].friendsKey == friendsId) && self.userData.friends[i].sent === "accepted"){
                return 3;
            }
        }
        
        return 0;
    }
}]);