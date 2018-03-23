angular.module('crudApp').controller('registrationController',['$scope','UserService' ,'$http', function($scope,UserService, $http){
    var self = this;
    self.user={};

    $scope.firstNamePattern=/^[A-Z][a-z]*\S$/;
    $scope.lastNamePattern=/^[A-Z][a-z]*\S$/;
    $scope.userNamePattern= /^\S*$/;
    $scope.passwordPattern = /^\S*$/;
    $scope.phonePattern = /^[0-9]+\S$/;
    function clicMe(){
    	console.log(self.user);
    }
    function createUser () {
        console.log('About to create user' );
        console.log(self.user);
        UserService.createUser(self.user)
            .then(
                function (response) {
                    console.log('User created successfully');
                    self.successMessage = 'User created successfully';
                    self.errorMessage='';
                    self.done = true;
                    self.user={};
                    $scope.myForm.$setPristine();
                },
                function (errResponse) {
                    console.error('Error while creating User');
                    self.errorMessage = 'Error while creating User: ' + errResponse.data.errorMessage;
                    self.successMessage='';
                }
            );
    }
    $scope.userRegistration = function(){
        console.log("Usao jeee" + $scope.user.firstName);
        var fd = new FormData();
        fd.append('firstName', $scope.user.firstName);
        fd.append('lastName', $scope.user.lastName);
        fd.append('phoneNumber', $scope.user.phoneNumber);
        fd.append('email', $scope.user.email);
        fd.append('username', $scope.user.username);
        fd.append('password', $scope.user.password);
      //  fd.append('email', $scope.user.email);

        console.log("Form Data:" + angular.toJson(fd));
        createUser($scope.user);
    }

     
    
}]);