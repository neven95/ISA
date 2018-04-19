var app = angular.module("crudApp");

app.controller('usersListController', 
    ['UserService', 'initialData', function(UserService, initialData) {

        var self = this;

        self.users = initialData.users;
        self.getAllUsers = getAllUsers;

        function getAllUsers() {
            return UserService.getAllUsers();
        }

    }]);