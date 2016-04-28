/* global angular, google */
(function() {
  angular.module('app').controller('meetingsCtrl', function($scope, $http) {
    $scope.setup = function() {
      $http.get('/api/v1/meetings.json').then(function(response) {
        $scope.meetings = response.data;
        setupMap($scope.meetings);
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

    $scope.createMeeting = function(name, address, startTime, endTime, notes, tags) {
      var params = {
        name: name,
        address: address,
        start_time: startTime,
        end_time: endTime,
        notes: notes,
        tags: tags
      };
      $http.post('/api/v1/meetings.json', params).then(function(response) {
        console.log(response);
        $scope.meetings.push(response.data);
      });
    };

    function setupMap(meetings) {
      var geocoder = new google.maps.Geocoder();
      var map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: -34.397, lng: 150.644},
        zoom: 8
      });
      var markers = [];
      var bounds = new google.maps.LatLngBounds();
      meetings.forEach(function(meeting) {
        console.log(meeting);
        geocoder.geocode({address: meeting.address}, function(results, status) {
          if (status === google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              position: results[0].geometry.location,
              map: map,
              title: 'Hello World!'
            });
            markers.push(marker);
            for (var i = 0;i < markers.length; i++) {
              bounds.extend(markers[i].getPosition());
            }
            map.fitBounds(bounds);
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      });
    }
  });
})();
