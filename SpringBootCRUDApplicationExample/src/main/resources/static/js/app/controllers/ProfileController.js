'use strict';

angular.module('crudApp').controller('ProfileController',
    ['UserService','initialData', '$scope','$state',   function( UserService, initialData, $scope, $state) {
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

     } ]);