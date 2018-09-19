angular.module('crudApp')
.controller('ReserveController', ['$scope', function($scope) {
    var self = this;

    self.myDate = new Date();
    self.isOpen = false;
}]);