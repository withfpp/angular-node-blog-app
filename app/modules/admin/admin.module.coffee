angular.module('myApp.admin',[
    'myApp.admin.controllers',
    'myApp.admin.services'
  ])
  .config([
    '$stateProvider',
    '$locationProvider',
    ($stateProvider, $locationProvider) ->
      
      $stateProvider
        .state('admin', {
          url: '/admin'
          templateUrl: '/modules/admin/views/adminHome.html'
          controller: 'AdminCtrl'
        })
        .state('admin.postNew', {
          url: '/posts/new'
          templateUrl: '/modules/admin/views/adminPostNew.html'
          controller: 'PostNewCtrl'
        })
        .state('admin.postUpdate', {
          url: '/posts/:id/edit'
          templateUrl: '/modules/admin/views/adminPostUpdate.html'
          controller: 'PostUpdateCtrl'
        })
        .state('admin.postViewAll', {
          url: '/posts/all',
          templateUrl: '/modules/admin/views/adminAllPost.html',
          controller: 'PostListCtrl'
        })


    ])