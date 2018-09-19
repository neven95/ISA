angular.module('crudApp').controller('CulturalObjectController', 
    ['$scope', '$state', 'initialData', 'TheatresService',
        function( $scope, $state, initialData, TheatresService) {
            var self = this;
            self.culturalObjects = initialData.culturalObjectList;
            console.log("CoCtrl initialData:", initialData);
        }]);