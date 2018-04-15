'use strict';

angular.module('crudApp').controller('UserController',
    ['UserService', '$scope','$state',   function( UserService, $scope, $state) {
        
        var self = this;
        self.user = {};
        self.users=[];
        self.user.enabled = false;
        self.user.confirmationToken = '';
        self.user.type = '0';
        self.loggedUser = null;
        self.submit = submit;
        self.getAllUsers = getAllUsers;
        self.createUser = createUser;
        self.updateUser = updateUser;
        self.removeUser = removeUser;
        self.editUser = editUser;
        self.reset = reset;
        self.firstNamePattern=/^[A-Z][a-z]*\S$/;
        self.lastNamePattern=/^[A-Z][a-z]*\S$/;
        self.userNamePattern= /^\S*$/;
        self.passwordPattern = /^\S*$/;
        self.phonePattern = /^[0-9]+\S$/;
        self.successMessage = '';
        self.errorMessage = '';
        self.done = false;
        self.dataLoading = false;
        self.onlyIntegers = /^\d+$/;
        self.onlyNumbers = /^\d+([,.]\d+)?$/;
        function glupaFunkcija() {
            console.log('Usao sam u kontroler');
           // $state.go('login');
        }
        function submit() {
            console.log('Submitting');
            self.dataLoading = true;
            if (self.user.id === undefined || self.user.id === null) {
                console.log('Saving New User', self.user);
                createUser(self.user);
            } else {
                updateUser(self.user, self.user.id);
                console.log('User updated with id ', self.user.id);
            }
        }
        self.moje = function () {
        	  
              $state.go('login');
        }

        function createUser(user) {
            console.log('About to create user');
            UserService.createUser(user)
                .then(
                    function (response) {
                        console.log('User created successfully');
                        self.successMessage = 'User created successfully, activate your profile and go to Login page';
                        self.errorMessage='';
                        self.done = true;
                        self.user={};
                        $scope.registerForm.$setPristine();
                        $scope.registerForm.$setUntouched();
                        self.dataLoading = false;
                        
                    },
                    function (errResponse) {
                        console.error('Error while creating User');
                        self.errorMessage = 'Error while creating User: ' + errResponse.data.errorMessage;
                        self.successMessage='';
                        self.dataLoading = false;
                    }
                );
        }


        function updateUser(user, id){
            console.log('About to update user');
            UserService.updateUser(user, id)
                .then(
                    function (response){
                        console.log('User updated successfully');
                        self.successMessage='User updated successfully';
                        self.errorMessage='';
                        self.done = true;
                        $scope.myForm.$setPristine();
                    },
                    function(errResponse){
                        console.error('Error while updating User');
                        self.errorMessage='Error while updating User '+errResponse.data;
                        self.successMessage='';
                    }
                );
        }


        function removeUser(id){
            console.log('About to remove User with id '+id);
            UserService.removeUser(id)
                .then(
                    function(){
                        console.log('User '+id + ' removed successfully');
                    },
                    function(errResponse){
                        console.error('Error while removing user '+id +', Error :'+errResponse.data);
                    }
                );
        }


        function getAllUsers(){
            return UserService.getAllUsers();
        }

        function editUser(id) {
            self.successMessage='';
            self.errorMessage='';
            UserService.getUser(id).then(
                function (user) {
                    self.user = user;
                },
                function (errResponse) {
                    console.error('Error while removing user ' + id + ', Error :' + errResponse.data);
                }
            );
        }
        function reset(){
            self.successMessage='';
            self.errorMessage='';
            self.user={};
            $scope.myForm.$setPristine(); //reset Form
        }
    }


    ]);