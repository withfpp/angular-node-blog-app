angular.module('myApp.blog.services',[])
  .factory('BlogService', [
    '$resource', 
    ($resource) ->
      url = "http://localhost:3000"
      $resource(url + '/api/articles/:id', {id: '@_id'}, {
        update: {
          method: 'PUT'
        }
        query: {
          isArray: true
        }
      })

])

