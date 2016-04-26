/* global angular */
(function() {
  angular.module('app').controller('meetingsCtrl', function($scope, $http) {
    $scope.setup = function() {
      $http.get('/api/v1/meetings.json').then(function(response) {
        $scope.meetings = response.data;
      });
      $http.get('/api/v1/tags.json').then(function(response) {
        $scope.tags = response.data;
      });
    };

    $scope.filterByTag = function(tag) {
      $scope.tagFilterId = tag.id;
    };

    $scope.resetFilterByTag = function() {
      $scope.tagFilterId = null;
    };

    $scope.matchTag = function(meeting) {
      if ($scope.tagFilterId) {
        // Use a for loop to see if $scope.tagFilterId exists in meeting.tags
        for (var i = 0; i < meeting.tags.length; i++) {
          var tag = meeting.tags[i];
          if (tag.id === $scope.tagFilterId) {
            return true;
          }
        }
        return false;
        // Or accomplish the same thing in one line:
        // return meeting.tags.map(tag => tag.id).indexOf($scope.tagFilterId) !== -1;
      } else {
        return true;
      }
    };

    $scope.changeOrderAttribute = function(inputAttribute) {
      if (inputAttribute !== $scope.orderAttribute) {
        $scope.orderDescending = false;
      } else {
        $scope.orderDescending = !$scope.orderDescending;
      }
      $scope.orderAttribute = inputAttribute;
    };
  });
})();
