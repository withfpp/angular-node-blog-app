// Generated by CoffeeScript 1.8.0
angular.module('myApp', ['ui.router', 'ui.bootstrap', 'ngRoute', 'ngResource', 'myApp.admin', 'myApp.util', 'myApp.blog']).config([
  '$locationProvider', '$stateProvider', '$urlRouterProvider', function($locationProvider, $stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise('/posts');
    return $stateProvider.state('test', {
      url: '/test',
      templateUrl: '/modules/blog/views/test.html',
      controller: function() {
        return alert('test');
      }
    });
  }
]).controller('navCtrl', [
  '$scope', '$location', function($scope, $location) {
    return $scope.isActive = (function(_this) {
      return function(viewLocation) {
        console.log($location.path());
        return viewLocation === $location.path();
      };
    })(this);
  }
]);