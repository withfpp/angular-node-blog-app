# this time, js style coffee controller
# class style in admin section

angular.module('myApp.blog.controllers', [])
  .controller('PostAllCtrl', [
    '$scope',
    'BlogService',
    '$filter',
    '$q'
    (@$scope, BlogService, $filter, $q) ->

      @init = =>
        BlogService.query(
          (data) =>
            @posts = data
            @$scope.totalItems = @posts.length
            @paginate()
        )
 
      @paginate = =>
        @$scope.posts = []
        @$scope.currentPage = 1

        @$scope.numPerPage = 4
        @$scope.$watchGroup(
          ['currentPage', 'numPerPage'],
          =>
            @$scope.posts = $filter('paginate')(@posts, @$scope.currentPage, @$scope.numPerPage)
        )

      @init()
    
  ])
  .controller 'PostSingleCtrl', [
    '$scope',
    'BlogService',
    '$stateParams'
    ($scope, BlogService, $stateParams) -> 
      id = $stateParams.id
      BlogService.get({id: id}, (data)->
        $scope.post = data
      )
  ]

  