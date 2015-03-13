# using class style ctrls

class AdminCtrl
  
  constructor: (@$scope, @$location) -> 
    @isActive()

  isActive: ->
    @$scope.isActive = (viewLocation) =>
      viewLocation is @$location.path()   

class PostNewCtrl

  constructor: (@$scope, @$state, @BlogService) ->
    @init()
    @setNewPost()
    @$scope.save = @savePost

  init: ->
    @$scope.buttonText = 'Add Post'    

  setNewPost: ->
    @$scope.post = new @BlogService()  

  savePost: =>
    @$scope.post.$save(=>
      @$state.go('admin.postViewAll', undefined ,{reload: true, inherit:false ,notify:true})
    )


class PostUpdateCtrl

  constructor: (@$scope, @BlogService, @$stateParams, @$state) ->
    @init()

    @getPost() 

    @$scope.updatePost = @update
  
  init: ->
    @$scope.buttonText = 'Update Post'    

  getPost: ->
    @$scope.post = @BlogService.get({id: @$stateParams.id});  

  update: =>
    @$scope.post.$update( =>
      @$state.go('admin.postViewAll', undefined ,{reload: true, inherit:false ,notify:true})
    )
 

class PostListCtrl

  constructor: (@$scope, @BlogService, @$state) ->
    
    @getPosts()
    
    @$scope.deletePost = @deletePost

  getPosts: ->
    @$scope.loading = true
    console.log(@BlogService.query().$promise)
    # just for fun
    @BlogService.query()
      .$promise
      .then(
        (data) =>
          setTimeout(()=>
            @$scope.posts = data
            @$scope.loading = false  
            @$scope.$apply()
          ,2000)
      )


  deletePost: (post) =>
    post.$delete( =>
      @$state.go('admin.postViewAll', undefined ,{reload: true, inherit:false ,notify:true})
    )  

angular.module('myApp.admin.controllers', [])
  .controller('PostNewCtrl', ['$scope','$state', 'BlogService', PostNewCtrl])
  .controller('PostUpdateCtrl', ['$scope', 'BlogService', '$stateParams', '$state', PostUpdateCtrl])
  .controller('PostListCtrl', ['$scope', 'BlogService', '$state', PostListCtrl])
  .controller('AdminCtrl', ['$scope','$location', AdminCtrl])
