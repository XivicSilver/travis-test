'use strict';

angular.module('travisTestApp')
  .controller('MainCtrl', ['$scope', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma',
      'Yay',
      'It works',
      'Finally!'
    ];
    
    angular.forEach($scope.awesomeThings, function(el, i) {
      console.log(el, i);
    });

    $scope.TT = '@@TT';
  }]);
