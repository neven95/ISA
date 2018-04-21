'use-strict'
var app = angular.module("crudApp");

app.controller('usersListController', 
    ['initialData', 'objectService', 'UserService', '$scope', 
        function(initialData, objectService, UserService, $scope) {

            var self = this;
            console.log("UserListContr: ");
            console.log(initialData.data);
            self.users = initialData.data;

            self.object = {};
            self.submit = submit;
            self.dataLoading = false;
            self.successMessage = '';
            self.errorMessage = '';
            self.admin = '';
            $scope.lonlatPattern = /^(\-?\d+(\.\d+)?) hereAdot . endMod \s*(\-?\d+(\.\d+)?)$/;
            $scope.namePattern = /^[A-Z][a-z]*\S$/;

            function submit() {
                console.log('Submitting');
                console.log(document.getElementById("inputAdmin").value == "");
                inputAdmin = document.getElementById("inputAdmin");
                self.dataLoading = true;
                if(document.getElementById('inputAdmin').value == ""){
                    self.errorMessage = 'Object must have administrator';
                } else {
                    if (self.object.id === undefined || self.object.id === null) {
                        console.log('Saving New object', self.object);
                        createObject(self.object);
                    } else {
                        updateObject(self.object, self.object.id);
                        console.log('Object updated with id ', self.object.id);
                    }
                }
            }

            function createObject(object) {
                console.log('About to create object');
                 console.log(self.object.admin.id);
                UserService.getUserByUsername(self.object.admin.username)
                    .then(
                        function(response){
                            self.object.admin.type = "2";
                            console.log("Updating user");
                            UserService.updateUser(self.object.admin, self.object.admin.id)
                                .then(
                                    function (response) {
                                        console.log("Creating object");
                                        objectService.createObject(object)
                                            .then(
                                                function(response){
                                                    //console.log(response);
                                                    self.successMessage = 'Object created successfully';
                                                    self.errorMessage='';
                                                    console.log("Upisani objekat");
                                                    console.log(response);
                                                    //self.done = true;
                                                    self.object={};
                                                    $scope.registerObjectForm.$setPristine();
                                                    $scope.registerObjectForm.$setUntouched();
                                                    //self.dataLoading = false;
                                                },
                                                function(errResponse) {
                                                    //console.log("Error when creating object");
                                                    self.errorMessage = 'Failed object creation';
                                                    self.successMessage = '';
                                                }
                                            )
                                    },
                                    function (errResponse) {
                                        console.log("Error when updating user");
                                    }
                                )
                        },
                        function(errResponse){
                            console.log("Error when retrieving user");
                        }
                    );
            }

            function updateObject(object, id){
                console.log('About to update object');
                objectService.updateObject(object, id)
                    .then(
                        function (response){
                            console.log('object updated successfully');
                            self.successMessage='object updated successfully';
                            self.errorMessage='';
                            self.done = true;
                            $scope.registerObjectForm.$setPristine();
                        },
                        function(errResponse){
                            console.error('Error while updating object');
                            self.errorMessage='Error while updatingobject '+errResponse.data;
                            self.successMessage='';
                        }
                    );
            }


            function removeObject(id){
                console.log('About to remove object with id '+id);
                objectService.removeObject(id)
                    .then(
                        function(){
                            console.log('Object '+id + ' removed successfully');
                        },
                        function(errResponse){
                            console.error('Error while removing object '+id +', Error :'+errResponse.data);
                        }
                    );
            }


            function getAllObjects(){
                return objectService.getAllObjects();
            }

            function editObject(id) {
                self.successMessage='';
                self.errorMessage='';
                objectService.getObject(id).then(
                    function (object) {
                        self.object = object;
                    },
                    function (errResponse) {
                        console.error('Error while removing object ' + id + ', Error :' + errResponse.data);
                    }
                );
            }
            function reset(){
                self.successMessage='';
                self.errorMessage='';
                self.object={};
                $scope.registerObjectForm.$setPristine(); //reset Form
            }

    }]);