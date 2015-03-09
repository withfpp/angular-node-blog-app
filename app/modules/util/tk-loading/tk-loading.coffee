tkLoading = ($http) ->
  obj = 
    restrict: 'A'
    link: (scope, element, attrs) =>
      scope.isLoading = () =>
        $http.pendingRequests.length > 0

      scope.$watch(scope.isLoading, (v)->
        if v 
          element.show()
        else 
          element.hide()  
      )  

  obj    

angular.module('myApp.util')
  .directive('tkLoading', ['$http', tkLoading])