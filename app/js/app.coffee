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
        .otherwise('/home');

      $stateProvider
        .state('home', {
          url: '/home'
          templateUrl: 'welcome.html'
        })
  ])  
  .controller('navCtrl', ['$scope', '$location', ($scope, $location) ->
    $scope.isActive = (viewLocation) =>
      console.log($location.path())
      viewLocation is $location.path()   
  ])





