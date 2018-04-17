'use strict';

angular.module('crudApp').controller('ProfileController',
    ['UserService','initialData', '$scope','$state', 'AuthenticationService',   function( UserService, initialData, $scope, $state, AuthenticationService) {
        var self = this;
        self.userData = initialData.userData;

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
        self.updateUsersGeneralSettings = updateUsersGeneralSettings;
        self.submit = submit;
        function submit(){
            updateUsersGeneralSettings(self.userData, self.userData.id);
        }
        function updateUsersGeneralSettings(user, id){
            console.log('About to update user');
            self.dataLoading = true;
            UserService.updateUser(user, id)
                .then(
                    function (response){
                        console.log('User updated successfully');
                        console.log(response.username);
                        self.successMessage='User updated successfully';
                        self.errorMessage='';
                        self.done = true;
                        self.dataLoading = false;
                        AuthenticationService.SetCredentials(response.username, response.password, response.type);
                        $state.go('guest-abstract.settings-abstract.general', {username: response.username});
                    },
                    function(errResponse){
                        console.error('Error while updating User');
                        self.errorMessage=errResponse.data.errorMessage;
                        self.dataLoading = false;
                        self.successMessage='';
                    }
                );
        }
     } ]);