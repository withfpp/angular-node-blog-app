angular.module('myApp.blog',[
    'myApp.blog.controllers',
    'myApp.blog.services'
  ])
  .config([
    '$stateProvider',
    '$locationProvider',
    ($stateProvider, $locationProvider) ->
      
      $stateProvider
        .state('test1', {
          url: 'test1',
          templateUrl: '/modules/blog/views/test.html'
          controller: () ->
            console.log('another test')
        })
        .state('postAll', {
          url: '/posts'
          templateUrl: '/modules/blog/views/blogAll.html'
          controller: 'PostAllCtrl'
        })
        .state('postSingle', {
          url: '/posts/:id'
          templateUrl: '/modules/blog/views/blogSingle.html'
          controller: 'PostSingleCtrl'
        })


    ])
