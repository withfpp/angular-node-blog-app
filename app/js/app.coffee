angular.module('myApp', [
    'ui.router',
    'ui.bootstrap',
    'ngRoute',
    'ngResource',
    'myApp.admin',
    'myApp.util',
    'myApp.blog'
  ])
  .config([
    '$locationProvider'
    '$stateProvider'
    '$urlRouterProvider'
    ($locationProvider, $stateProvider, $urlRouterProvider) ->
      $urlRouterProvider
        .otherwise('/posts');

      $stateProvider
        .state('test', {
          url: '/test'
          templateUrl: '/modules/blog/views/test.html'
          controller: () ->
            alert('test')
        })
  ])  
  .controller('navCtrl', ['$scope', '$location', ($scope, $location) ->
    $scope.isActive = (viewLocation) =>
      console.log($location.path())
      viewLocation is $location.path()   
  ])
